//
//  VisionBoardTableDataSource.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 12/09/22.
//

import Foundation
import UIKit

//sourcery: AutoMockable
protocol VisionBoardTableActionHandler: AnyObject {
    func editButtonTappedFor(_ section: Section)
    func addPhotoButtonTappedFor(_ section: Section)
    func didSelectSection(_ section: Section)
}

//sourcery: AutoMockable
protocol VisionBoardTableDataSourceProtocol: AnyObject {
    func use(_ tableView: UITableView)
    func reloadViewWith(_ sections: [Section])
}

class VisionBoardTableDataSource: NSObject {
    private var sections: [Section]
    private weak var tableView: UITableView!
    private weak var actionHandler: VisionBoardTableActionHandler?
    private let imageStore: ImageStore

    init(
        sections: [Section],
        actionHandler: VisionBoardTableActionHandler,
        imageStore: ImageStore = ImageStoreManager.sharedInstance
    ) {
        self.sections = sections
        self.actionHandler = actionHandler
        self.imageStore = imageStore
    }
}

extension VisionBoardTableDataSource: VisionBoardTableDataSourceProtocol {
    func use(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView = tableView
    }
    
    func reloadViewWith(_ sections: [Section]) {
        self.sections = sections
        tableView.reloadData()
    }
}

extension VisionBoardTableDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VisionBoardItemCell", for: indexPath) as? VisionBoardItemCell else {
                fatalError("Failed to get expected kind of reusable cell from the tableView. Expected type `VisionBoardItemCell`")
            }
        
        let section = sections[indexPath.row]
        cell.render(
            name: section.name,
            imageUrls: section.photos.map({
                $0.isLocalImage ? imageStore.imageUrlStringFor(String($0.id)): $0.thumbUrl
            })
        )
        cell.editButtonActionHandler = { [weak self] in
            guard let self = self else { return }
            self.actionHandler?.editButtonTappedFor(section)
        }
        cell.addPhotoActionHandler = { [weak self] in
            guard let self = self else { return }
            self.actionHandler?.addPhotoButtonTappedFor(section)
        }
        
        cell.photoTapActionHandler = { [weak self] in
            guard let self = self else { return }
            self.actionHandler?.didSelectSection(section)
        }
        return cell
    }
}

extension VisionBoardTableDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.row]
        actionHandler?.didSelectSection(section)
    }
}
