//
//  HomeCoordinator.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation
import UIKit
import SwiftUI

final class HomeCoordinator: BaseCoordinator {
    private let navigationController: UINavigationController
    private let viewControllerBuilder: HomeViewControllerBuilding
    private let visionBoard: VisionBoard
    private let dataManager: DataManager
    private let imageStore: ImageStore
    private var imagePicker: ImagePicker?

    init(
        navigationController: UINavigationController,
        viewControllerBuilder: HomeViewControllerBuilding = HomeViewControllerBuilder(),
        visionBoard: VisionBoard,
        dataManager: DataManager = DataManagerService.sharedInstance,
        imageStore: ImageStore = ImageStoreManager.sharedInstance
    ) {
        self.navigationController = navigationController
        self.viewControllerBuilder = viewControllerBuilder
        self.visionBoard = visionBoard
        self.dataManager = dataManager
        self.imageStore = imageStore
        super.init()
    }
    
    override func start() {
        let homeVC = viewControllerBuilder.buildVisionBoardView(
            sceneDelegate: self,
            visionBoard: visionBoard
        )
        navigationController.setViewControllers([homeVC], animated: true)
    }
}

extension HomeCoordinator: VisionBoardSceneDelegate {
    func goToAddNewSection() {
        let viewController = viewControllerBuilder.buildSectionNameInputView(
            sceneDelegate: self
        )
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToSectionDetailsScreen(_ section: Section) {
        let images = Array(section.photos).map {
            return ImagePickerItem(
                imageId: $0.id,
                thumbUrl: $0.isLocalImage ? imageStore.imageUrlStringFor(String($0.id)) : $0.url,
                imageUrl: $0.isLocalImage ? imageStore.imageUrlStringFor(String($0.id)) : $0.url,
                caption: $0.caption,
                isLocal: $0.isLocalImage
            )
        }
        
        let sectionDetailView = viewControllerBuilder.buildSectionDetailsView(
            sceneDelegate: self,
            section: section,
            images: images
        )
        navigationController.pushViewController(sectionDetailView, animated: true)
    }
}

extension HomeCoordinator: SectionNameInputSceneDelegate {
    func continueWithSectionName(_ name: String) {
        dataManager.addSectionWithName(name)
        NotificationCenter.default.post(name: visionBoardDidUpdateNotification, object: nil)
        navigationController.popToRootViewController(animated: true)
    }
}

extension HomeCoordinator: SectionDetailsSceneDelegate {
    func didFinishUpdatingDetailsForSection(_ section: Section, images: [ImagePickerItem]) {
        dataManager.updateSection(section, images: images)
        NotificationCenter.default.post(name: visionBoardDidUpdateNotification, object: nil)
        navigationController.popToRootViewController(animated: true)
    }
    
    func goToAddPhotoFor(_ section: Section) {
        if let index = navigationController.viewControllers.firstIndex(where: { $0 is SectionImageSelectorViewController}) {
            navigationController.popToViewController(navigationController.viewControllers[index], animated: true)
        } else {
            let sectionDetailView = viewControllerBuilder.buildSectionImageSelectorView(
                sceneDelegate: self,
                section: section
            )
            navigationController.pushViewController(sectionDetailView, animated: true)
        }
    }
}

extension HomeCoordinator: SectionImageSelectorSceneDelegate {
    func didContinueWithSelectedImages(_ images: [ImagePickerItem], section: Section) {
        let sectionDetailView = viewControllerBuilder.buildSectionDetailsView(
            sceneDelegate: self,
            section: section,
            images: images
        )
        navigationController.pushViewController(sectionDetailView, animated: true)
    }
    
    func showImagePicker(delegate: ImagePickerDelegate) {
        let imagePicker = ImagePicker(
            presentationController: navigationController,
            delegate: delegate
        )
        imagePicker.present()
        self.imagePicker = imagePicker
    }
}
