//
//  SectionDetailsInteractor.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 13/09/22.
//

import Foundation

//sourcery: AutoMockable
protocol SectionDetailsSceneDelegate: AnyObject {
    func didFinishUpdatingDetailsForSection(_ section: Section, images: [ImagePickerItem])
    func goToAddPhotoFor(_ section: Section)
}

//sourcery: AutoMockable
protocol SectionDetailsInteracting: DidLoadInteracting {
    func handleAddPhotoButtonAction()
    func handleDoneButtonAction()
}

final class SectionDetailsInteractor {
    private weak var sceneDelegate: SectionDetailsSceneDelegate?
    private let presenter: SectionDetailsPresenting
    private let section: Section
    private var images: [ImagePickerItem]

    init(
        sceneDelegate: SectionDetailsSceneDelegate,
        presenter: SectionDetailsPresenting,
        section: Section,
        images: [ImagePickerItem]
    ) {
        self.sceneDelegate = sceneDelegate
        self.presenter = presenter
        self.section = section
        self.images = images
    }
}

extension SectionDetailsInteractor: SectionDetailsInteracting {
    func didLoad() {
        presenter.display(
            section: section,
            images: images,
            tableActionHandler: self
        )
    }
    
    func handleAddPhotoButtonAction() {
        sceneDelegate?.goToAddPhotoFor(section)
    }
    
    func handleDoneButtonAction() {
        sceneDelegate?.didFinishUpdatingDetailsForSection(section, images: images)
    }
}

extension SectionDetailsInteractor: SectionDetailsTableActionHandler {
    func deleteButtonTappedFor(_ image: ImagePickerItem) {
        if let index = images.firstIndex(where: { $0.imageId == image.imageId }) {
            images.remove(at: index)
            presenter.reloadListWith(images)
        }
    }
    
    func captionUpdatedFor(_ image: ImagePickerItem, caption: String?) {
        image.caption = caption
    }
}
