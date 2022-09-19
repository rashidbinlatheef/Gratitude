//
//  BackgroundType.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 06/09/22.
//

import Foundation
import UIKit

enum BackgroundType: String {
    case primary
    case secondary
    case secondaryLight
    case accent
    case accentLight
    case accentInformational
    case stateDisabled
    case none
    
    var color: UIColor {
        switch self {
        case .primary:
            return .backgroundPrimary
        case .secondary:
            return .backgroundSecondary
        case .secondaryLight:
            return .backgroundSecondaryLight
        case .accent:
            return .backgroundAccent
        case .accentLight:
            return .backgroundAccentLight
        case .accentInformational:
            return .backgroundAccentInformational
        case .stateDisabled:
            return .backgroundAccentDisabled
        case .none:
            return .clear
        }
    }
}
