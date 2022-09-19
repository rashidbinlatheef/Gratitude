//
//  IntroductionInteractor.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation

//sourcery: AutoMockable
protocol IntroductionSceneDelegate: AnyObject {
    func continueWithBuildingVisionBoard()
}

//sourcery: AutoMockable
protocol IntroductionInteracting {
    func handleBuildVisionBoardButtonTap()
}

final class IntroductionInteractor {
    private weak var sceneDelegate: IntroductionSceneDelegate?
    
    init(sceneDelegate: IntroductionSceneDelegate) {
        self.sceneDelegate = sceneDelegate
    }
}

extension IntroductionInteractor: IntroductionInteracting {
    func handleBuildVisionBoardButtonTap() {
        sceneDelegate?.continueWithBuildingVisionBoard()
    }
}
