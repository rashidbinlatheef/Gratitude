//
//  SectionImageSelectorPresenter.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 13/09/22.
//

import Foundation

//sourcery: AutoMockable
protocol SectionImageSelectorPresenting {
    func display(
        searchText: String?,
        images: [ImagePickerItem],
        selectedImages: [ImagePickerItem],
        tableActionHandler: SectionImageListActionHandler
    )
    
    func reloadListWithImages(_ images: [ImagePickerItem], selectedImages: [ImagePickerItem])
        
    func didUpdateImageSelection(_ selectedImages: [ImagePickerItem])

    func showImageLimitBanner(_ show: Bool)
    
    func showNetworkProgressIndicator(_ show: Bool)
}

final class SectionImageSelectorPresenter {
    private weak var view: SectionImageSelectorViewable?
    private var imageListDataSource: SectionImageListDataSourceProtocol?
        
    func set(view: SectionImageSelectorViewable) {
        self.view = view
    }
}

extension SectionImageSelectorPresenter: SectionImageSelectorPresenting {
    func display(
        searchText: String?,
        images: [ImagePickerItem],
        selectedImages: [ImagePickerItem],
        tableActionHandler: SectionImageListActionHandler
    ) {
        let imageListDataSource = SectionImageListDataSource(
            images: images,
            actionHandler: tableActionHandler,
            selectedImages: selectedImages
        )
        view?.render(
            searchText: searchText,
            listDataSource: imageListDataSource
        )
        self.imageListDataSource = imageListDataSource
    }
    
    func didUpdateImageSelection(_ selectedImages: [ImagePickerItem]) {
        imageListDataSource?.reloadWithSelectedImages(selectedImages)
        view?.showSelectedImages(selectedImages)
    }
    
    func showImageLimitBanner(_ show: Bool) {
        view?.showImageLimitBanner(show)
    }
    
    func reloadListWithImages(_ images: [ImagePickerItem], selectedImages: [ImagePickerItem]) {
        imageListDataSource?.reloadWithImages(images, selectedImages: selectedImages)
    }
    
    func showNetworkProgressIndicator(_ show: Bool) {
        view?.showNetworkProgressIndicator(show)
    }
}
