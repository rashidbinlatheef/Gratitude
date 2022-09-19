//
//  VisionBoardNameInputInteractor.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation

//sourcery: AutoMockable
protocol VisionBoardNameInputSceneDelegate: AnyObject {
    func continueWithVisionBoardName(_ name: String)
}

//sourcery: AutoMockable
protocol VisionBoardNameInputInteracting: DidLoadInteracting {
    func handleContinueButtonWithName(_ name: String)
}

final class VisionBoardNameInputInteractor {
    private weak var sceneDelegate: VisionBoardNameInputSceneDelegate?
    private let presenter: VisionBoardNameInputPresenting
    private let userName: String

    init(
        sceneDelegate: VisionBoardNameInputSceneDelegate,
        presenter: VisionBoardNameInputPresenting,
        userName: String
    ) {
        self.sceneDelegate = sceneDelegate
        self.presenter = presenter
        self.userName = userName
    }
}

extension VisionBoardNameInputInteractor: VisionBoardNameInputInteracting {
    func didLoad() {
        let header = "Hello, \(userName)! 😊 👋🏽\nLet’s give your vision board a name."
        let nameList = ["🕺My Dream Life", "🎯 Vision Board 2021", "💫 \(userName)’s Dream World"]
        presenter.display(
            header: header,
            nameList: nameList,
            listActionHandler: self
        )
    }
    
    func handleContinueButtonWithName(_ name: String) {
        sceneDelegate?.continueWithVisionBoardName(name)
    }
}

extension VisionBoardNameInputInteractor: VisionBoardNamePickerListActionHandler {
    func didSelectName(_ name: String) {
        presenter.updateVisionBoardName(name)
    }
}
