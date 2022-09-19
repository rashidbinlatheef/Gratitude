//
//  BaseButton.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 10/09/22.
//

import UIKit

class BaseButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        applyStyles()
    }
    
    var buttonActionHandler: (() -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        applyStyles()
    }
    
    private func setup() {
        addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    @objc
    private func handleButtonTap() {
        buttonActionHandler?()
    }
    
    private func applyStyles() {
        if #available(iOS 15.0, *) {
            configuration = nil
        }
        self.titleLabel?.font = typoGraphy?.typeInfo.font
    }
}
