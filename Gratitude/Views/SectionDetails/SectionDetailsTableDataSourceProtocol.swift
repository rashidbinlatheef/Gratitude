//
//  SectionDetailsTableDataSourceProtocol.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 13/09/22.
//

import Foundation
import UIKit

//sourcery: AutoMockable
protocol SectionDetailsTableActionHandler: AnyObject {
    func deleteButtonTappedFor(_ image: ImagePickerItem)
    func captionUpdatedFor(_ image: ImagePickerItem, caption: String?)
}

//sourcery: AutoMockable
protocol SectionDetailsTableDataSourceProtocol: AnyObject {
    func use(_ tableView: UITableView)
    func reloadWithImages(_ image: [ImagePickerItem])
}

class SectionDetailsTableDataSource: NSObject {
    private var images: [ImagePickerItem]
    private weak var tableView: UITableView!
    private weak var actionHandler: SectionDetailsTableActionHandler?

    init(
        images: [ImagePickerItem],
        actionHandler: SectionDetailsTableActionHandler
    ) {
        self.images = images
        self.actionHandler = actionHandler
    }
}

extension SectionDetailsTableDataSource: SectionDetailsTableDataSourceProtocol {
    func use(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView = tableView
    }
    
    func reloadWithImages(_ image: [ImagePickerItem]) {
        self.images = image
        tableView.reloadData()
    }
}

extension SectionDetailsTableDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SectionPhotoItemCell", for: indexPath) as? SectionPhotoItemCell else {
                fatalError("Failed to get expected kind of reusable cell from the tableView. Expected type `SectionPhotoItemCell`")
            }
        
        let image = images[indexPath.row]
        cell.render(imageUrl: image.thumbUrl, caption: image.caption)
        cell.deleteButtonActionHandler = { [weak self] in
            guard let self = self else { return }
            self.actionHandler?.deleteButtonTappedFor(image)
        }
        cell.didUpdateCaption = { [weak self] text in
            guard let self = self else { return }
            self.actionHandler?.captionUpdatedFor(image, caption: text)
        }
        return cell
    }
}

extension SectionDetailsTableDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIApplication
            .shared
            .sendAction(
                #selector(UIApplication.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
    }
}
