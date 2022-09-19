//
//  SectionNameViewController.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 10/09/22.
//

import UIKit

//sourcery: AutoMockable
protocol SectionNameInputViewable: AnyObject {
    func loadSectionNamePickerTitles(_ titles: [String])
}

final class SectionNameViewController: BaseViewController {
    @IBOutlet private weak var buttonsContainer: UIView!
    @IBOutlet private weak var buttonsContainerHeight: NSLayoutConstraint!
    @IBOutlet private weak var nameTextField: ValidationTextField!
    @IBOutlet private weak var continueButton: PrimaryButton!
    @IBOutlet private weak var continueButtonBottomSpaceConstraint: NSLayoutConstraint!
    
    private var interactor: SectionNameInputInteracting!

    static func viewController(interactor: SectionNameInputInteracting) -> SectionNameViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "SectionNameViewController") as? SectionNameViewController else {
            assertionFailure("SectionNameViewController not found")
            return UIViewController() as! SectionNameViewController
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
        registerForKeyBoardNotification()
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removerKeyBoardNotificationObservers()
    }
    
    @IBAction func continueButtonTapped() {
        nameTextField.resignFirstResponder()
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

extension SectionNameViewController: SectionNameInputViewable{
    func loadSectionNamePickerTitles(_ titles: [String]) {
        setupSectionNamePickerView(titles)
    }
}

private extension SectionNameViewController {
    func setupUI() {
        continueButton.isEnabled = false
        nameTextField.onTextDidChange = { [weak self] (isValid, _) in
            self?.continueButton.isEnabled = isValid
        }
        nameTextField.becomeFirstResponder()
    }
    
    func setupSectionNamePickerView(_ titles: [String]) {
        let scrollView = UIScrollView()
        buttonsContainer.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bottomAnchor.constraint(equalTo: buttonsContainer.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: buttonsContainer.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: buttonsContainer.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: buttonsContainer.leadingAnchor).isActive = true
        
        let padding: CGFloat = 12
        var currentWidth: CGFloat = 0
        var buttonHeight: CGFloat = 0
        
        for buttonTitle in titles {
            let button = PillButton()
            button.buttonStyle = .secondary
            button.typoGraphy = TypoGraphy.paragraphSmall
            button.setTitle(buttonTitle, for: .normal)
            button.buttonActionHandler = { [weak self] in
                guard let self = self else { return }
                self.nameTextField.text = buttonTitle
                self.continueButton.isEnabled = self.nameTextField.isValid
            }
            scrollView.addSubview(button)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: currentWidth).isActive = true
            let buttonSize = button.recommendedSize
            currentWidth = currentWidth + buttonSize.width + padding
            buttonHeight = buttonSize.height
        }
        scrollView.contentSize = CGSize(width:currentWidth, height: scrollView.frame.size.height)
        scrollView.showsHorizontalScrollIndicator = false
        buttonsContainerHeight.constant = buttonHeight
    }
}
