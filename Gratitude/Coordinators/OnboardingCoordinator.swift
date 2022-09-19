//
//  OnboardingCoordinator.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import UIKit

final class OnboardingCoordinator: BaseCoordinator {
    private let navigationController: UINavigationController
    private let viewControllerBuilder: OnboardingViewControllerBuilding
    private var userName: String?
    private var visionBoardName: String?
    private let dataManager: DataManager
    private var sectionName: String?
    private let completion: (Coordinator) -> Void

    init(
        navigationController: UINavigationController,
        viewControllerBuilder: OnboardingViewControllerBuilding = OnboardingViewControllerBuilder(),
        dataManager: DataManager = DataManagerService.sharedInstance,
        completion: @escaping (Coordinator) -> Void
    ) {
        self.navigationController = navigationController
        self.viewControllerBuilder = viewControllerBuilder
        self.completion = completion
        self.dataManager = dataManager
        super.init()
    }
    
    override func start() {
        showIntroView()
    }
}

extension OnboardingCoordinator: IntroductionSceneDelegate {
    func continueWithBuildingVisionBoard() {
        showUserNameInputView()
    }
}

extension OnboardingCoordinator: UsernameInputSceneDelegate {
    func continueWithUsername(_ name: String) {
        userName = name
        showVisionBoardNameInputView()
    }
}

extension OnboardingCoordinator: VisionBoardNameInputSceneDelegate {
    func continueWithVisionBoardName(_ name: String) {
        visionBoardName = name
        showSectionNameInputView()
    }
}

extension OnboardingCoordinator: SectionNameInputSceneDelegate {
    func continueWithSectionName(_ name: String) {
        sectionName = name
        guard let visionBoardName = visionBoardName,
              let userName = userName,
              let sectionName = sectionName else {
            return
        }
        
        dataManager.createVisionBoardWithName(visionBoardName, userName: userName, sectionName: sectionName)
        completion(self)
    }
}

private extension OnboardingCoordinator{
    func showIntroView() {
        let introView = viewControllerBuilder.buildIntroductionView(sceneDelegate: self)
        navigationController.viewControllers = [introView]
    }
    
    func showUserNameInputView() {
        let userNameInputView = viewControllerBuilder.buildUserNameInputView(sceneDelegate: self)
        navigationController.pushViewController(userNameInputView, animated: true)
    }
    
    func showVisionBoardNameInputView() {
        guard let userName = userName else { return }
        let visionBoardNameInputView = viewControllerBuilder.buildVisionBoardNameInputView(
            userName: userName,
            sceneDelegate: self
        )
        navigationController.pushViewController(visionBoardNameInputView, animated: true)
    }
    
    func showSectionNameInputView() {
        let sectionNameInputView = viewControllerBuilder.buildSectionNameInputView(sceneDelegate: self)
        navigationController.pushViewController(sectionNameInputView, animated: true)
    }
}
