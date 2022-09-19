//
//  UITableViewSpy.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 18/09/22.
//

import UIKit

class UITableViewSpy: UITableView {
    var reloadDataCallsCount = 0
    var reloadDataCalled: Bool {
        return reloadDataCallsCount > 0
    }
    override func reloadData() {
        reloadDataCallsCount += 1
        super.reloadData()
    }
}
