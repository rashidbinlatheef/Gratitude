//
//  SectionNameInputPresenter.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation

//sourcery: AutoMockable
protocol SectionNameInputPresenting {
    func showSectionPickerItems(_ itemTitles: [String])
}

final class SectionNameInputPresenter: SectionNameInputPresenting {
    private weak var view: SectionNameInputViewable?
    
    func set(view: SectionNameInputViewable) {
        self.view = view
    }
    
    func showSectionPickerItems(_ itemTitles: [String]) {
        view?.loadSectionNamePickerTitles(itemTitles)
    }
}
