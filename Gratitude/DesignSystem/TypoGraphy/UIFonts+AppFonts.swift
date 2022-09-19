//
//  UIFonts+AppFonts.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 10/09/22.
//

import Foundation
import UIKit

private let regularFontName = "Inter-Regular"
private let mediumFontName = "Inter-Medium"
private let semiBoldFontName = "Inter-SemiBold"
private let boldFontName = "Inter-Bold"

extension UIFont {
    class func regularAppFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: regularFontName, size: fontSize) ?? .systemFont(ofSize: fontSize, weight: .regular)
    }
    
    class func mediumAppFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: mediumFontName, size: fontSize) ?? .systemFont(ofSize: fontSize, weight: .medium)
    }
    
    class func semiBoldAppFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: semiBoldFontName, size: fontSize) ?? .systemFont(ofSize: fontSize, weight: .semibold)
    }
    
    class func boldAppFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: boldFontName, size: fontSize) ?? .systemFont(ofSize: fontSize, weight: .bold)
    }
}
