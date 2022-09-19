//
//  ImageDownloader.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 11/09/22.
//

import UIKit
/**
    Handles image downloads from url
 */
final class ImageDownloader {
    private var sessionManager: URLSession?
    
   /// The Cache where we store images
    static private let imageCache = NSCache<NSString, UIImage>()

    init() {}
    
    /**
            Download image from a URL and returns the image in mainThread
            - parameter url: The URLwhere image is located
            - parameter completion: The code to be executed once image is downloaded
        */
    func downloadImageFromUrl(_ url: URL, completion: @escaping(_ image: UIImage?) -> Void) {
        if let cachedImage = Self.imageCache.object(forKey: url.absoluteString as NSString) {
            DispatchQueue.main.async {
                completion(cachedImage)
            }
        }
        else {
            if sessionManager == nil {
                let configuration = URLSessionConfiguration.default
                configuration.timeoutIntervalForRequest = 30
                configuration.timeoutIntervalForResource = 30
                sessionManager = URLSession(configuration: configuration)
            }
            
            let urlSessionTask = sessionManager?.dataTask(with: url) { data, _, error in
                if error != nil {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
                else if let imageData = data, let downloadedImage = UIImage(data: imageData) {
                    Self.imageCache.setObject(downloadedImage, forKey: url.absoluteString as NSString)
                    DispatchQueue.main.async {
                        completion(downloadedImage)
                    }
                }
            }
            urlSessionTask?.resume()
        }
    }
    
    /**
            Download image from a urlString  and returns the image in mainThread
            - parameter url: The url string image is located
            - parameter completion: The code to be executed once image is downloaded
        */
    func downloadImageFromUrlString(_ urlString: String, completion: @escaping(_ image: UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        downloadImageFromUrl(url, completion: completion)
    }
    
    /**
            Cancel All request from session manager
        */
    func cancelAllRequests() {
        sessionManager?.invalidateAndCancel()
    }
    
    func reset() {
        Self.imageCache.removeAllObjects()
    }
}
