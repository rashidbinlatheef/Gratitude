//
//  SectionNameInputInteractor.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation

//sourcery: AutoMockable
protocol SectionNameInputSceneDelegate: AnyObject {
    func continueWithSectionName(_ name: String)
}

//sourcery: AutoMockable
protocol SectionNameInputInteracting: DidLoadInteracting {
    func handleContinueButtonWithName(_ name: String)
}

final class SectionNameInputInteractor {
    private weak var sceneDelegate: SectionNameInputSceneDelegate?
    private let presenter: SectionNameInputPresenting

    init(
        sceneDelegate: SectionNameInputSceneDelegate,
        presenter: SectionNameInputPresenting
    ) {
        self.sceneDelegate = sceneDelegate
        self.presenter = presenter
    }
}

extension SectionNameInputInteractor: SectionNameInputInteracting {
    func didLoad() {
        let itemTitles = ["Travel", "Work", "Relationships", "Health", "Finance"]
        presenter.showSectionPickerItems(itemTitles)
    }
    
    func handleContinueButtonWithName(_ name: String) {
        sceneDelegate?.continueWithSectionName(name)
    }
}
