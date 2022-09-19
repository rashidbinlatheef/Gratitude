//
//  BorderType.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 07/09/22.
//

import Foundation
import UIKit

enum BorderType: String {
    case primary
    case none
    
    var color: UIColor {
        switch self {
        case .primary:
            return .primaryBorder
        case .none:
            return .clear
        }
    }
}
