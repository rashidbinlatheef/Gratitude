//
//  VisionBoardNamePickerListDataSourceProtocol.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 14/09/22.
//

import Foundation
import UIKit

//sourcery: AutoMockable
protocol VisionBoardNamePickerListActionHandler: AnyObject {
    func didSelectName(_ name: String)
}

//sourcery: AutoMockable
protocol VisionBoardNamePickerListDataSourceProtocol: AnyObject {
    func use(_ collectionView: UICollectionView)
}

class VisionBoardNamePickerListDataSource: NSObject {
    private var nameList: [String]
    private weak var collectionView: UICollectionView!
    private weak var actionHandler: VisionBoardNamePickerListActionHandler?
    
    init(
        nameList: [String],
        actionHandler: VisionBoardNamePickerListActionHandler
    ) {
        self.nameList = nameList
        self.actionHandler = actionHandler
    }
}

extension VisionBoardNamePickerListDataSource: VisionBoardNamePickerListDataSourceProtocol {
    func use(_ collectionView: UICollectionView) {
        collectionView.dataSource = self
        self.collectionView = collectionView
    }
}

extension VisionBoardNamePickerListDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VisionBoardNamePickerCell", for: indexPath) as? VisionBoardNamePickerCell else {
            fatalError("Failed to get expected kind of reusable cell. Expected type `VisionBoardNamePickerCell`")
        }
        let name = nameList[indexPath.row]
        cell.render(title: name, actionHandler: { [weak self] in
            self?.actionHandler?.didSelectName(name)
        })
        
        return cell
    }
}
