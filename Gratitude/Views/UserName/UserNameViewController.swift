//
//  UserNameViewController.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 08/09/22.
//

import UIKit

final class UserNameViewController: BaseViewController {
    @IBOutlet private weak var nameTextField: ValidationTextField!
    @IBOutlet private weak var continueButton: PrimaryButton!
    @IBOutlet private weak var continueButtonBottomSpaceConstraint: NSLayoutConstraint!
    
    private var interactor: UserNameInputInteracting!
    
    static func viewController(interactor: UserNameInputInteracting) -> UserNameViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "UserNameViewController") as? UserNameViewController else {
            assertionFailure("UserNameViewController not found")
            return UIViewController() as! UserNameViewController
        }
        viewController.interactor = interactor
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func continueButtonTapped() {
        guard let name = nameTextField.text else { return }
        interactor.handleContinueButtonWithName(name)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        registerForKeyBoardNotification()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removerKeyBoardNotificationObservers()
    }
    
    @objc
    override func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            updateConstraintsWithKeyboardNotification(
                notification,
                constraint: continueButtonBottomSpaceConstraint,
                constant: keyboardSize.height - 10
            )
        }
    }
    
    @objc
    override func keyboardWillHide(notification: NSNotification) {
        updateConstraintsWithKeyboardNotification(
            notification,
            constraint: continueButtonBottomSpaceConstraint,
            constant: -10
        )
    }
}

private extension UserNameViewController {
    func setupUI() {
        continueButton.isEnabled = false
        nameTextField.onTextDidChange = { [weak self] (isValid, _) in
            self?.continueButton.isEnabled = isValid
        }
        nameTextField.becomeFirstResponder()
    }
}
