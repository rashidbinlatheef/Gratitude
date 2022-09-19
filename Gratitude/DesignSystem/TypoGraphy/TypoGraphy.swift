//
//  TypoGraphy.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 06/09/22.
//

import UIKit

struct TypeInfo {
    let fontWeight: CGFloat
    let fontSize: CGFloat
    
    var font: UIFont {
        switch fontWeight {
        case 400:
            return .regularAppFont(ofSize: fontSize)
        case 500:
            return .mediumAppFont(ofSize: fontSize)
        case 600:
            return .semiBoldAppFont(ofSize: fontSize)
        case 700:
            return .boldAppFont(ofSize: fontSize)
        default:
            return .regularAppFont(ofSize: fontSize)
        }
    }
}

enum TypoGraphy: String {
    /// Bold 24 pt 700
    case headingLarge
    /// Bold 20 pt 700
    case headingRegular
    /// Bold 14 pt 700
    case headingSmall
    /// Bold 12 pt 600
    case labelRegular
    /// Bold 14 pt 500
    case bodyRegular
    /// Bold 14 pt 400
    case paragraphRegular
    /// Bold 12 pt 400
    case paragraphSmall
    
    var typeInfo: TypeInfo {
        switch self {
        case .headingLarge:
            return Heading.large
        case .headingRegular:
            return Heading.regular
        case .headingSmall:
            return Heading.small
        case .labelRegular:
            return Label.regular
        case .bodyRegular:
            return Body.regular
        case .paragraphRegular:
            return Paragraph.regular
        case .paragraphSmall:
            return Paragraph.small
        }
    }

    enum Heading {
        static let large = TypeInfo(
            fontWeight: 700,
            fontSize: 24
        )
        
        static let regular = TypeInfo(
            fontWeight: 700,
            fontSize: 20
        )
        
        static let small = TypeInfo(
            fontWeight: 700,
            fontSize: 14
        )
    }
    
    enum Label {
        static let regular = TypeInfo(
            fontWeight: 600,
            fontSize: 12
        )
    }
    
    enum Body {
        static let regular = TypeInfo(
            fontWeight: 500,
            fontSize: 14
        )
    }
    
    enum Paragraph {
        static let regular = TypeInfo(
            fontWeight: 400,
            fontSize: 14
        )
        
        static let small = TypeInfo(
            fontWeight: 400,
            fontSize: 12
        )
    }
}
