//
//  GRLabel.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 06/09/22.
//

import UIKit

final class GRLabel: UILabel {
    @IBInspectable var contentTypeString: String = "" {
        didSet {
           contentType = ContentType(rawValue: contentTypeString)
        }
    }
    
    @IBInspectable var backgroundTypeString: String = "" {
        didSet {
            backgroundType = BackgroundType(rawValue: backgroundTypeString)
        }
    }
    
    @IBInspectable var typoGraphyString: String = "" {
        didSet {
            typoGraphy = TypoGraphy(rawValue: typoGraphyString)
        }
    }

    var contentType: ContentType? {
        didSet {
            applyStyles()
        }
    }
    
    private var backgroundType: BackgroundType? {
        didSet {
            applyStyles()
        }
    }
    var typoGraphy: TypoGraphy? {
        didSet {
            applyStyles()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyles()
    }
    
    private func applyStyles() {
        if let typoGraphy = typoGraphy {
            font = typoGraphy.typeInfo.font
        }
        
        if let contentType = contentType {
            textColor = contentType.color
        }
        
        if let backgroundType = backgroundType {
            backgroundColor = backgroundType.color
        }
    }

}
