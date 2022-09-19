//
//  UIView+FirstResponder.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 14/09/22.
//

import Foundation
import UIKit

extension UIView {
    var firstResponder: UIView? {
        guard !isFirstResponder else { return self }
        return subviews.first(where: {$0.firstResponder != nil })
    }
}
