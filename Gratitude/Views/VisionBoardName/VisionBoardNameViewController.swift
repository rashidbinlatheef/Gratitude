//
//  VisionBoardNameViewController.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 08/09/22.
//

import UIKit

//sourcery: AutoMockable
protocol VisionBoardNameInputViewable: AnyObject {
    func updateVisionBoardName(_ visionBoardName: String)
    func render(
        header: String,
        listDataSource: VisionBoardNamePickerListDataSourceProtocol
    )
}

final class VisionBoardNameViewController: BaseViewController {
    @IBOutlet private weak var headerLabel: GRLabel!
    @IBOutlet private weak var nameTextField: ValidationTextField!
    @IBOutlet private weak var continueButton: PrimaryButton!
    @IBOutlet private weak var continueButtonBottomSpaceConstraint: NSLayoutConstraint!
    @IBOutlet private weak var namePickerCollectionView: UICollectionView!

    private var interactor: VisionBoardNameInputInteracting!

    static func viewController(interactor: VisionBoardNameInputInteracting) -> VisionBoardNameViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "VisionBoardNameViewController") as? VisionBoardNameViewController else {
            assertionFailure("VisionBoardNameViewController not found")
            return UIViewController() as! VisionBoardNameViewController
        }
        viewController.interactor = interactor
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        registerForKeyBoardNotification()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removerKeyBoardNotificationObservers()
    }
        
    @IBAction func continueButtonTapped() {
        guard let name = nameTextField.text else { return }
        interactor.handleContinueButtonWithName(name)
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

extension VisionBoardNameViewController: VisionBoardNameInputViewable {
    // TODO: Fix Typo
    func render(
        header: String,
        listDataSource: VisionBoardNamePickerListDataSourceProtocol
    ) {
        headerLabel.text = header
        listDataSource.use(namePickerCollectionView)
    }

    func updateVisionBoardName(_ visionBoardName: String) {
        nameTextField.text = visionBoardName
        continueButton.isEnabled = nameTextField.isValid
    }
}

private extension VisionBoardNameViewController{
    func setupUI() {
        continueButton.isEnabled = false
        nameTextField.onTextDidChange = { [weak self] (isValid, _) in
            self?.continueButton.isEnabled = isValid
        }
        nameTextField.becomeFirstResponder()
    }
}
