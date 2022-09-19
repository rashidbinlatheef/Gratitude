//
//  ViewController.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 06/09/22.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var disabledButton: PrimaryButton!
    @IBOutlet weak var accentPrimaryButton: PrimaryButton!

    @IBOutlet weak var secondaryPillButton: PillButton!
    @IBOutlet weak var teriaryPillButton: PillButton!
    
    @IBOutlet weak var validationTextField: ValidationTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disabledButton.isEnabled = false
        secondaryPillButton.setTitle("secondary pill button", for: .normal)
        teriaryPillButton.setTitle("Terriarry pill button", for: .normal)
        self.view.backgroundColor = BackgroundType.primary.color
        validationTextField.onTextDidChange = { [weak self] (isValid, textField) in
            guard let self = self else { return }
            self.accentPrimaryButton.isEnabled = isValid
        }
        
        
        // Do any additional setup after loading the view.
    }


}

