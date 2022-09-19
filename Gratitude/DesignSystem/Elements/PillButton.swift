//
//  PillButton.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 07/09/22.
//

import UIKit

final class PillButton: BaseButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyles()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        applyStyles()
    }
    
    @IBInspectable var styleStringValue: String = "" {
        didSet {
            buttonStyle = PillButton.ButtonStyle(rawValue: styleStringValue)
        }
    }
    
    var buttonStyle: PillButton.ButtonStyle? {
        didSet {
            applyStyles()
        }
    }
    
    private var widthConstraint: NSLayoutConstraint?
   
    public var recommendedSize: CGSize {
        return CGSize(width: recommendedWidth(), height: intrinsicContentSize.height)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyles()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupBordersAndCorners()
        setupWidth()
    }
    
    override var intrinsicContentSize: CGSize {
        if let widthConstraint = widthConstraint {
            return CGSize(width: widthConstraint.constant, height: super.intrinsicContentSize.height)
        }
        else {
            return super.intrinsicContentSize
        }
    }
    
    private func setupBordersAndCorners() {
        layer.cornerRadius = frame.size.height/2
        if let buttonStyle = buttonStyle {
            layer.borderColor = buttonStyle.borderType.color.cgColor
            layer.borderWidth = buttonStyle.borderWidth
        }
    }
    
    private func setupWidth() {
        if let titleLabel = titleLabel,
            titleLabel.text != nil {

            let width = recommendedWidth()
            if let widthConstraint = widthConstraint {
                widthConstraint.constant = width
            }
            else {
                translatesAutoresizingMaskIntoConstraints = false
                widthConstraint = self.widthAnchor.constraint(greaterThanOrEqualToConstant: width)
                widthConstraint?.isActive = true
            }
        }
    }
    
    private func recommendedWidth() -> CGFloat {
        guard let titleLabel = titleLabel else {
            return 0
        }

        let titleInset = CGFloat(imageView?.image == nil ? 0 : 8)
        let insets = buttonStyle?.contentEdgeInsets ?? .zero
        contentEdgeInsets =  .init(
            top: insets.top,
            left: insets.left,
            bottom: insets.bottom,
            right: titleInset + insets.right
        )
        
        titleEdgeInsets = UIEdgeInsets(top: 0, left: titleInset, bottom: 0, right: -titleInset)

        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: titleLabel.font.lineHeight)
        let titleSize = titleLabel.sizeThatFits(constraintRect)
        let totalMargins = contentEdgeInsets.left * 2
        let imageWidth = imageView?.bounds.width ?? 0
        let titleWidth = titleSize.width + titleEdgeInsets.left

        return titleWidth + totalMargins + imageWidth
    }
    
    private func applyStyles() {
        if #available(iOS 15.0, *) {
            configuration = nil
        }
        if let buttonStyle = self.buttonStyle {
            backgroundColor = buttonStyle.backgroundColor
            setTitleColor(buttonStyle.contentType.color, for: .normal)
        }
    }
    
    override public func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        titleLabel?.text = title
        setupWidth()
    }
}

extension PillButton {
    enum ButtonStyle: String {
        case primary
        case secondary
        case tertiary
        
        var contentType: ContentType {
            switch self {
            case .primary:
                return .primary
            case .secondary:
                return .secondary
            case .tertiary:
                return .accent
            }
        }
        
        var backgroundColor: UIColor {
            switch self {
            case .primary:
                return BackgroundType.accentLight.color
            case .secondary:
                return BackgroundType.primary.color
            case .tertiary:
                return BackgroundType.secondary.color
            }
        }
        
        var contentEdgeInsets: UIEdgeInsets {
            switch self {
            case .primary:
                return .init(top: 12, left: 12, bottom: 12, right: 12)
            case .secondary:
                return .init(top: 8, left: 12, bottom: 8, right: 12)
            case .tertiary:
                return .init(top: 4, left: 12, bottom: 4, right: 12)
            }
        }
        
        var borderType: BorderType {
            switch self {
            case .primary:
                return .none
            case .secondary:
                return .primary
            case .tertiary:
                return .primary
            }
        }
        
        var borderWidth: CGFloat {
            switch self {
            case .primary, .tertiary:
                return 0
            case .secondary:
                return 1
            }
        }
    }
}
