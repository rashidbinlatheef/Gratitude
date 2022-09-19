//
//  PrimaryButton.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 06/09/22.
//

import UIKit

final class PrimaryButton: BaseButton {
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
    
    @IBInspectable var styleStringValue: String = "" {
        didSet {
            buttonStyle = PrimaryButton.ButtonStyle(rawValue: styleStringValue)
        }
    }
    
    var buttonStyle: PrimaryButton.ButtonStyle? {
        didSet {
            applyStyles()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            applyStyles()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyles()
    }
    
    private func setupUI() {
        layer.cornerRadius = 8
    }
    
    private func applyStyles() {
        if #available(iOS 15.0, *) {
            configuration = nil
        }        
        if let buttonStyle = self.buttonStyle {
            backgroundColor = isEnabled ? buttonStyle.backgroundColor: buttonStyle.disabledBackgroundColor
            setTitleColor(buttonStyle.contentType.color, for: .normal)
            tintColor = buttonStyle.contentType.color
        }
        
        let contentPadding = UIEdgeInsets(top: 14, left: 19, bottom: 14, right: 19)
        setInsets(forContentPadding: contentPadding, imageTitlePadding: 6)
    }
}

extension PrimaryButton {
    enum ButtonStyle: String {
        case accent
        case overlayDark
        
        var contentType: ContentType {
            switch self {
            case .accent:
                return .alwaysOn
            case .overlayDark:
                return .primaryLight
            }
        }
        
        var backgroundColor: UIColor {
            switch self {
            case .accent:
                return BackgroundType.accent.color
            case .overlayDark:
                return BackgroundType.secondary.color
            }
        }
        
        var disabledBackgroundColor: UIColor {
            switch self {
            case .accent:
                return BackgroundType.stateDisabled.color
            case .overlayDark:
                return BackgroundType.secondaryLight.color
            }
        }
    }
}
