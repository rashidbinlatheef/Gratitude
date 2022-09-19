//
//  ValidationTextField.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 07/09/22.
//

import UIKit

final class ValidationTextField: TextField {
    @IBInspectable var minimumLenth: Int = 1
    @IBInspectable var maximumLenth: Int = 30
    @IBInspectable var useAllCaps: Bool = false
    
    var onTextDidChange: ((Bool, UITextField) -> Void)?
    var isValid: Bool {
        let textLength = text?.count ?? 0
        return textLength >= minimumLenth && textLength <= maximumLenth
    }
    
    override var text: String? {
        get {
            super.text
        }
        set {
            super.text = useAllCaps ? newValue?.uppercased(): newValue
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTextField()
    }
    
    private func setupTextField() {
        delegate = self
        addTarget(
            self,
            action: #selector(textDidChange),
            for: .editingChanged
        )
    }
    
    @objc
    private func textDidChange() {
        onTextDidChange?(isValid, self)
    }
}

extension ValidationTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        true
    }
    
}
