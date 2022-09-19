//
//  VisionBoardInteractor.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation

//sourcery: AutoMockable
protocol VisionBoardSceneDelegate: AnyObject {
    func goToSectionDetailsScreen(_ section: Section)
    func goToAddNewSection()
}

//sourcery: AutoMockable
protocol VisionBoardInteracting: DidLoadInteracting {
    func handleAddAnotherButtonTap()
}

final class VisionBoardInteractor {
    private weak var sceneDelegate: VisionBoardSceneDelegate?
    private let presenter: VisionBoardPresenting
    private let visionBoard: VisionBoard

    init(
        sceneDelegate: VisionBoardSceneDelegate,
        presenter: VisionBoardPresenting,
        visionBoard: VisionBoard
    ) {
        self.sceneDelegate = sceneDelegate
        self.presenter = presenter
        self.visionBoard = visionBoard
        NotificationCenter.default.addObserver(self, selector: #selector(visionBoardDidUpdate), name: visionBoardDidUpdateNotification, object: nil)
    }
    
    @objc
    private func visionBoardDidUpdate() {
        presenter.refreshVisionBoard(visionBoard)
    }
}

extension VisionBoardInteractor: VisionBoardInteracting {
    func didLoad() {
        presenter.display(
            visionBoard: visionBoard,
            tableActionHandler: self
        )
    }
    
    func handleAddAnotherButtonTap() {
        sceneDelegate?.goToAddNewSection()
    }
}

extension VisionBoardInteractor: VisionBoardTableActionHandler {
    func editButtonTappedFor(_ section: Section) {
        sceneDelegate?.goToSectionDetailsScreen(section)
    }
    
    func addPhotoButtonTappedFor(_ section: Section) {
        sceneDelegate?.goToSectionDetailsScreen(section)
    }
    
    func didSelectSection(_ section: Section) {
        sceneDelegate?.goToSectionDetailsScreen(section)
    }
}
