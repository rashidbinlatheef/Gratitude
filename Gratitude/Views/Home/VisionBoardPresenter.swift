//
//  VisionBoardPresenting.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation

//sourcery: AutoMockable
protocol VisionBoardPresenting {
    func display(
        visionBoard: VisionBoard,
        tableActionHandler: VisionBoardTableActionHandler
    )
    
    func refreshVisionBoard(
        _ visionBoard: VisionBoard
    )
}

final class VisionBoardPresenter {
    private weak var view: VisionBoardViewable?
    private var visionBoardTableDataSource: VisionBoardTableDataSourceProtocol?
    
    init() {}
    
    func set(view: VisionBoardViewable) {
        self.view = view
    }
}

extension VisionBoardPresenter: VisionBoardPresenting {
    func display(
        visionBoard: VisionBoard,
        tableActionHandler: VisionBoardTableActionHandler
    ) {
        let visionBoardTableDataSource = VisionBoardTableDataSource(
            sections: Array(visionBoard.sections),
            actionHandler: tableActionHandler
        )
        view?.render(
            title: visionBoard.name,
            tableDataSource: visionBoardTableDataSource
        )
        self.visionBoardTableDataSource = visionBoardTableDataSource
    }
    
    func refreshVisionBoard(
        _ visionBoard: VisionBoard
    ) {
        visionBoardTableDataSource?.reloadViewWith(Array(visionBoard.sections))
    }
}
