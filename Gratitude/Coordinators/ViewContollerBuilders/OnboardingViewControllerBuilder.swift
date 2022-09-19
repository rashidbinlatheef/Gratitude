//
//  OnboardingViewControllerBuilder.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation
import UIKit

//sourcery: AutoMockable
protocol OnboardingViewControllerBuilding {
    func buildIntroductionView(sceneDelegate: IntroductionSceneDelegate) -> UIViewController
    func buildUserNameInputView(sceneDelegate: UsernameInputSceneDelegate) -> UIViewController
    func buildVisionBoardNameInputView(
        userName: String,
        sceneDelegate: VisionBoardNameInputSceneDelegate
    ) -> UIViewController
    func buildSectionNameInputView(sceneDelegate: SectionNameInputSceneDelegate) -> UIViewController
}

final class OnboardingViewControllerBuilder {
    
}

extension OnboardingViewControllerBuilder: OnboardingViewControllerBuilding {
    func buildIntroductionView(sceneDelegate: IntroductionSceneDelegate) -> UIViewController {
        let interactor = IntroductionInteractor(sceneDelegate: sceneDelegate)
        let viewController = IntroductionViewController.viewController(interactor: interactor)
        return viewController
    }
    
    func buildUserNameInputView(sceneDelegate: UsernameInputSceneDelegate) -> UIViewController {
        let interactor = UserNameInputInteractor(
            sceneDelegate: sceneDelegate
        )
        
        let viewController = UserNameViewController.viewController(interactor: interactor)
        return viewController
    }
    
    func buildVisionBoardNameInputView(
        userName: String,
        sceneDelegate: VisionBoardNameInputSceneDelegate
    ) -> UIViewController {
        let presenter = VisionBoardNameInputPresenter()
        
        let interactor = VisionBoardNameInputInteractor(
            sceneDelegate: sceneDelegate,
            presenter: presenter,
            userName: userName
        )
        
        let viewController = VisionBoardNameViewController.viewController(interactor: interactor)
        presenter.set(view: viewController)
        return viewController
    }
    
    func buildSectionNameInputView(sceneDelegate: SectionNameInputSceneDelegate) -> UIViewController {
        let presenter = SectionNameInputPresenter()
        
        let interactor = SectionNameInputInteractor(
            sceneDelegate: sceneDelegate,
            presenter: presenter
        )
        
        let viewController = SectionNameViewController.viewController(interactor: interactor)
        presenter.set(view: viewController)
        return viewController
    }
}
