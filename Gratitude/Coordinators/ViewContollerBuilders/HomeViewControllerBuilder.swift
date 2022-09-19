//
//  HomeViewControllerBuilder.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation
import UIKit

//sourcery: AutoMockable
protocol HomeViewControllerBuilding {
    func buildVisionBoardView(
        sceneDelegate: VisionBoardSceneDelegate,
        visionBoard: VisionBoard
    ) -> UIViewController
    
    func buildSectionDetailsView(
        sceneDelegate: SectionDetailsSceneDelegate,
        section: Section,
        images: [ImagePickerItem]
    ) -> UIViewController
    
    func buildSectionImageSelectorView(
        sceneDelegate: SectionImageSelectorSceneDelegate,
        section: Section
    ) -> UIViewController
    
    func buildSectionNameInputView(
        sceneDelegate: SectionNameInputSceneDelegate
    ) -> UIViewController
}

final class HomeViewControllerBuilder {
    
}

extension HomeViewControllerBuilder: HomeViewControllerBuilding {
    func buildVisionBoardView(
        sceneDelegate: VisionBoardSceneDelegate,
        visionBoard: VisionBoard
    ) -> UIViewController {
        let presenter = VisionBoardPresenter()
        let interactor = VisionBoardInteractor(
            sceneDelegate: sceneDelegate,
            presenter: presenter,
            visionBoard: visionBoard
        )
        
        let viewController = VisionBoardViewController.viewController(interactor: interactor)
        presenter.set(view: viewController)
        return viewController
    }
    
    func buildSectionDetailsView(
        sceneDelegate: SectionDetailsSceneDelegate,
        section: Section,
        images: [ImagePickerItem]
    ) -> UIViewController {
        let presenter = SectionDetailsPresenter()
        let interactor = SectionDetailsInteractor(
            sceneDelegate: sceneDelegate,
            presenter: presenter,
            section: section,
            images: images
        )
        
        let viewController = SectionDetailsViewController.viewController(interactor: interactor)
        presenter.set(view: viewController)
        return viewController
    }
    
    func buildSectionImageSelectorView(
        sceneDelegate: SectionImageSelectorSceneDelegate,
        section: Section
    ) -> UIViewController {
        let presenter = SectionImageSelectorPresenter()
        let interactor = SectionImageSelectorInteractor(
            sceneDelegate: sceneDelegate,
            presenter: presenter,
            section: section
        )
        
        let viewController = SectionImageSelectorViewController.viewController(interactor: interactor)
        presenter.set(view: viewController)
        return viewController
    }
    
    func buildSectionNameInputView(
        sceneDelegate: SectionNameInputSceneDelegate
    ) -> UIViewController {
        OnboardingViewControllerBuilder().buildSectionNameInputView(sceneDelegate: sceneDelegate)
    }
}
