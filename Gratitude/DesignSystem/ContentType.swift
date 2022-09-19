//
//  ContentType.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 06/09/22.
//

import Foundation
import UIKit

enum ContentType: String {
    case primary
    case primaryLight
    case secondary
    case secondaryLight
    case tertiary
    case tertiaryLight
    case informational
    case accent
    case alwaysOn
    case negative
    case none
    
    var color: UIColor {
        switch self {
        case .primary:
            return .contentPrimary
        case .primaryLight:
            return .contentPrimaryLight
        case .secondary:
            return .contentSecondary
        case .secondaryLight:
            return .contentSecondaryLight
        case .tertiary:
            return .contentTertiary
        case .tertiaryLight:
            return .contentTertiaryLight
        case .informational:
            return .contentInformational
        case .accent:
            return .contentAccent
        case .alwaysOn:
            return .contentAlwaysOn
        case .negative:
            return .contentNegative
        case .none:
            return .clear
        }
    }
}
