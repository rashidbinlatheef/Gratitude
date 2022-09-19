//
//  UICollectionViewSpy.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 16/09/22.
//

import Foundation
import UIKit

class UICollectionViewSpy: UICollectionView {
    var reloadDataCallsCount = 0
    var reloadDataCalled: Bool {
        return reloadDataCallsCount > 0
    }
    override func reloadData() {
        reloadDataCallsCount += 1
        super.reloadData()
    }
}
