//
//  VisionBoardNameInputPresenter.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation

//sourcery: AutoMockable
protocol VisionBoardNameInputPresenting {
    func display(
        header: String,
        nameList: [String],
        listActionHandler: VisionBoardNamePickerListActionHandler
    )
    func updateVisionBoardName(_ visionBoardName: String)
}

final class VisionBoardNameInputPresenter {
    private weak var view: VisionBoardNameInputViewable?
    private var namePickerDataSource: VisionBoardNamePickerListDataSourceProtocol?
    
    func set(view: VisionBoardNameInputViewable) {
        self.view = view
    }
}

extension VisionBoardNameInputPresenter: VisionBoardNameInputPresenting {
    func display(
        header: String,
        nameList: [String],
        listActionHandler: VisionBoardNamePickerListActionHandler
    ) {
        let namePickerDataSource = VisionBoardNamePickerListDataSource(
            nameList: nameList,
            actionHandler: listActionHandler
        )
        view?.render(header: header, listDataSource: namePickerDataSource)
        self.namePickerDataSource = namePickerDataSource
    }
    
    func updateVisionBoardName(_ visionBoardName: String) {
        view?.updateVisionBoardName(visionBoardName)
    }
}
