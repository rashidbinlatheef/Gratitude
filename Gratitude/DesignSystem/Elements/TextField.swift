//
//  TextField.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 07/09/22.
//

import UIKit

class TextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        applyStyles()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        applyStyles()
    }
    
    @IBInspectable var typoGraphyString: String = "" {
        didSet {
            typoGraphy = TypoGraphy(rawValue: typoGraphyString)
        }
    }
    
    var typoGraphy: TypoGraphy? {
        didSet {
            applyStyles()
        }
    }
    
    @IBInspectable var styleStringValue: String = "" {
        didSet {
            textFieldStyle = TextField.TextFieldStyle(rawValue: styleStringValue)
        }
    }
    
    override var placeholder: String? {
        didSet {
            updatePlaceHolder()
        }
    }
    
    var textFieldStyle: TextField.TextFieldStyle? {
        didSet {
            applyStyles()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyles()
    }
    
    private func setupUI() {
        layer.borderWidth = 0
    }
    
    private func applyStyles() {
        borderStyle = .none
        layer.borderWidth = 0
        font = typoGraphy?.typeInfo.font
        if let textFieldStyle = textFieldStyle {
            backgroundColor = textFieldStyle.backgroundColor
            textColor = textFieldStyle.contentType.color
            tintColor = textFieldStyle.contentType.color
        }
        updatePlaceHolder()
    }
    
    private func updatePlaceHolder() {
        if let textFieldStyle = textFieldStyle {
            let placeHolderColor = textFieldStyle.placeHolderColor
            let attributes = [ NSAttributedString.Key.foregroundColor: placeHolderColor]
            attributedPlaceholder = NSAttributedString(
                string: placeholder ?? "",
                attributes: attributes
            )
        }
    }
}

extension TextField {
    enum TextFieldStyle: String {
        case primary
        case secondary

        var contentType: ContentType {
            switch self {
            case .primary:
                return .accent
            case .secondary:
                return .tertiaryLight
            }
        }
        
        var backgroundColor: UIColor {
            BackgroundType.primary.color
        }
        
        var placeHolderColor: UIColor {
            ContentType.informational.color
        }
    }
}
