//
//  SectionImageSelectorInteractor.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 13/09/22.
//

import Foundation
import UIKit

//sourcery: AutoMockable
protocol SectionImageSelectorSceneDelegate: AnyObject {
    func didContinueWithSelectedImages(_ images: [ImagePickerItem], section: Section)
    func showImagePicker(delegate: ImagePickerDelegate)
}

//sourcery: AutoMockable
protocol SectionImageSelectorInteracting: DidLoadInteracting {
    func continueWithImageSelection()
    func searchImagesFor(searchText: String?)
    func handleCameraButtonTap()
}

final class SectionImageSelectorInteractor {
    private weak var sceneDelegate: SectionImageSelectorSceneDelegate?
    private let presenter: SectionImageSelectorPresenting
    private let section: Section
    private let pexelAPI: PexelAPIService
    private let imageStore: ImageStore

    private var searchText: String?
    private var images = [ImagePickerItem]()
    private var selectedImages = [ImagePickerItem]()
    private var isSearchingImages = false

    init(
        sceneDelegate: SectionImageSelectorSceneDelegate,
        presenter: SectionImageSelectorPresenting,
        section: Section,
        pexelAPI: PexelAPIService = PexelAPI.sharedInstance,
        imageStore: ImageStore = ImageStoreManager.sharedInstance
    ) {
        self.sceneDelegate = sceneDelegate
        self.presenter = presenter
        self.section = section
        self.pexelAPI = pexelAPI
        self.imageStore = imageStore
        searchText = section.name
        if !section.photos.isEmpty {
            selectedImages.append(
                contentsOf: Array(section.photos).map{
                    return ImagePickerItem(
                        imageId: $0.id,
                        thumbUrl: $0.isLocalImage ? imageStore.imageUrlStringFor(String($0.id)) : $0.url,
                        imageUrl: $0.isLocalImage ? imageStore.imageUrlStringFor(String($0.id)) : $0.url,
                        caption: $0.caption,
                        isLocal: $0.isLocalImage
                    )
                }
            )
            presenter.didUpdateImageSelection(selectedImages)
        }
    }
}

extension SectionImageSelectorInteractor: SectionImageSelectorInteracting {
    func didLoad() {
        searchImages()
    }
    
    func continueWithImageSelection() {
        sceneDelegate?.didContinueWithSelectedImages(selectedImages, section: section)
    }
    
    func searchImagesFor(searchText: String?) {
        self.searchText = searchText
        images = []
        presenter.reloadListWithImages(images, selectedImages: selectedImages)
        searchImages()
    }
    
    func handleCameraButtonTap() {
        guard selectedImages.count < 5 else {
            presenter.showImageLimitBanner(true)
            return
        }
        sceneDelegate?.showImagePicker(delegate: self)
    }
}

extension SectionImageSelectorInteractor: SectionImageListActionHandler {
    func didSelectImage(_ image: ImagePickerItem) {
        let isSelected = selectedImages.contains{$0.imageId == image.imageId}
        
        if !isSelected {
            // trying to select image, so check if limit exceeded
            guard selectedImages.count < 5 else {
                presenter.showImageLimitBanner(true)
                return
            }
            selectedImages.append(image)
        } else {
            // remove from list
            if let index = selectedImages.firstIndex(where: {$0.imageId == image.imageId}) {
                selectedImages.remove(at: index)
            }
        }
        presenter.showImageLimitBanner(false)
        presenter.didUpdateImageSelection(selectedImages)
    }
    
    func startPagingIfNeeded() {
        searchImages()
    }
}

extension SectionImageSelectorInteractor: ImagePickerDelegate {
    func didPickImage(_ image: UIImage?) {
        if let image = image {
            let uniqueId = imageStore.saveImageToDocumentsDirectory(image)
            let imageUrl = imageStore.imageUrlStringFor(String(uniqueId))
            // Use file store to create image url
            let imagePickerItem = ImagePickerItem(
                imageId: uniqueId,
                thumbUrl: imageUrl,
                imageUrl: imageUrl,
                caption: nil,
                isLocal: true
            )
            didSelectImage(imagePickerItem)
        }
    }
}

private extension SectionImageSelectorInteractor {
    func displayImages() {
        presenter.didUpdateImageSelection(selectedImages)
        presenter.display(
            searchText: searchText,
            images: images,
            selectedImages: selectedImages,
            tableActionHandler: self
        )
    }
    
    func searchImages() {
        guard !isSearchingImages else { return }
        isSearchingImages.toggle()
        presenter.showNetworkProgressIndicator(true)
        pexelAPI.searchImages(querry: searchText ?? "") { [weak self ] result in
            guard let self = self else { return }
            self.presenter.showNetworkProgressIndicator(false)
            self.isSearchingImages.toggle()
            switch result {
            case .success(let response):
                let imageList = Array(response.photos).map {
                    ImagePickerItem(
                        imageId: $0.id,
                        thumbUrl: $0.src.medium,
                        imageUrl: $0.src.original,
                        caption: nil,
                        isLocal: false
                    )
                    
                }
                self.images.append(contentsOf: imageList)
                self.displayImages()
            case .failure(let error):
                break
            }
        }
    }
}
