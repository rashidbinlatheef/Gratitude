//
//  WebImageView.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 11/09/22.
//

import Foundation
import UIKit

final class WebImageView: UIImageView {
    private var imageDownloader: ImageDownloader?
    private var spinner: UIActivityIndicatorView?

    public override var image: UIImage? {
        get {
            super.image
        }
        set {
            imageDownloader?.cancelAllRequests()
            super.image = newValue
        }
    }
    
    func setImageFromUrlString(_ urlString: String, placeHolder: UIImage? = nil) {
        image = placeHolder
        imageDownloader = ImageDownloader()
        showSpinner(true)
        imageDownloader?.downloadImageFromUrlString(urlString, completion: { [weak self] downloadedImage in
            guard let self = self else { return }
            self.showSpinner(false)
            if let image = downloadedImage {
                self.image = image
            }
        })
    }
    
    private func showSpinner(_ show: Bool) {
        spinner?.stopAnimating()
        spinner?.removeFromSuperview()
        
        guard show else {
            return
        }

        let spinner = UIActivityIndicatorView(style: .medium)
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        spinner.startAnimating()
        self.spinner = spinner
    }
}
