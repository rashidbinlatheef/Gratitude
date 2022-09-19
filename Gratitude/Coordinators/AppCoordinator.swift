//
//  AppCoordinator.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 08/09/22.
//

import Foundation
import UIKit

final class AppCoordinator: BaseCoordinator {
    private let window: UIWindow
    private let navigationController  = UINavigationController()
    private let dataManager: DataManager

    init(
        window: UIWindow,
        dataManager: DataManager = DataManagerService.sharedInstance
    ) {
        self.window = window
        self.dataManager = dataManager
        super.init()
    }
    
    override func start() {
        window.rootViewController = navigationController
        updateEntryPoints()
    }
}

private extension AppCoordinator {
    func updateEntryPoints() {
        if let visionBoard = dataManager.getVisionBoard() {
            startHomeFlow(visionBoard: visionBoard)
        } else {
            startOnboardingFlow()
        }
    }
    
    func startOnboardingFlow() {
        let onboardingCompletionBlock: (Coordinator) -> Void = { [weak self] coordinator in
            guard let self = self else { return }
            self.removeChildCoordinator(coordinator)
            self.updateEntryPoints()
        }
        
        let onboardingCoordinator = OnboardingCoordinator(
            navigationController: navigationController,
            completion: onboardingCompletionBlock
        )
        onboardingCoordinator.start()
        addChildCoordinartor(onboardingCoordinator)
    }
    
    func startHomeFlow(visionBoard: VisionBoard) {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController, visionBoard: visionBoard)
        homeCoordinator.start()
        addChildCoordinartor(homeCoordinator)
    }
}
