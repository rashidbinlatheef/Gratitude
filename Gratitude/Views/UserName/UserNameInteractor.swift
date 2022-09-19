//
//  UserNameInteractor.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation

//sourcery: AutoMockable
protocol UsernameInputSceneDelegate: AnyObject {
    func continueWithUsername(_ name: String)
}

//sourcery: AutoMockable
protocol UserNameInputInteracting {
    func handleContinueButtonWithName(_ name: String)
}

final class UserNameInputInteractor {
    private weak var sceneDelegate: UsernameInputSceneDelegate?

    init(
        sceneDelegate: UsernameInputSceneDelegate
    ) {
        self.sceneDelegate = sceneDelegate
    }
}

extension UserNameInputInteractor: UserNameInputInteracting {
    func handleContinueButtonWithName(_ name: String) {
        sceneDelegate?.continueWithUsername(name)
    }
}
