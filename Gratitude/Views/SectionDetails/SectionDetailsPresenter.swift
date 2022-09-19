//
//  SectionDetailsPresenter.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 13/09/22.
//

import Foundation

//sourcery: AutoMockable
protocol SectionDetailsPresenting {
    func display(
        section: Section,
        images: [ImagePickerItem],
        tableActionHandler: SectionDetailsTableActionHandler
    )
    
    func reloadListWith(_ images: [ImagePickerItem])
}

final class SectionDetailsPresenter {
    private weak var view: SectionDetailsViewable?
    private var sectionDetailsTableDataSource: SectionDetailsTableDataSourceProtocol?
    
    init() {}
    
    func set(view: SectionDetailsViewable) {
        self.view = view
    }
}

extension SectionDetailsPresenter: SectionDetailsPresenting {
    func display(
        section: Section,
        images: [ImagePickerItem],
        tableActionHandler: SectionDetailsTableActionHandler
    ) {
        let sectionDetailsTableDataSource = SectionDetailsTableDataSource(
            images: images,
            actionHandler: tableActionHandler
        )
        view?.render(
            title: section.name,
            tableDataSource: sectionDetailsTableDataSource
        )
        view?.showEmptyState(images.isEmpty)
        self.sectionDetailsTableDataSource = sectionDetailsTableDataSource
    }
    
    func reloadListWith(_ images: [ImagePickerItem]) {
        sectionDetailsTableDataSource?.reloadWithImages(images)
    }
}
