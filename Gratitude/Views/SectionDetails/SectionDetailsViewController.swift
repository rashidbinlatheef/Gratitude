//
//  SectionDetailsViewController.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 11/09/22.
//

import UIKit

//sourcery: AutoMockable
protocol SectionDetailsViewable: AnyObject {
    func render(
        title: String,
        tableDataSource: SectionDetailsTableDataSourceProtocol
    )
    
    func showEmptyState(_ show: Bool)
}

final class SectionDetailsViewController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyStateView: UIView!
    @IBOutlet private weak var fullStateView: UIView!
    @IBOutlet private weak var fullStateAddPhotoButton: PrimaryButton!
    private let titleLabel = GRLabel()
    private var interactor: SectionDetailsInteracting!
    
    static func viewController(
        interactor: SectionDetailsInteracting
    ) -> SectionDetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "SectionDetailsViewController") as? SectionDetailsViewController else {
            assertionFailure("SectionDetailsViewController not found")
            return UIViewController() as! SectionDetailsViewController
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
    
    @objc
    override func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            if let textField = view.firstResponder {
                let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
                tableView.contentInset = contentInsets
                tableView.scrollIndicatorInsets = contentInsets
                
                var visibleRect = view.frame
                visibleRect.size.height -= keyboardSize.height
                
                if !visibleRect.contains(textField.frame.origin) {
                    tableView.scrollRectToVisible(textField.frame, animated: true)
                }
            }
        }
    }
    
    override func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        tableView.contentInset = contentInsets
        tableView.scrollIndicatorInsets = contentInsets
    }
}

extension SectionDetailsViewController: SectionDetailsViewable {
    func render(
        title: String,
        tableDataSource: SectionDetailsTableDataSourceProtocol
    ) {
        titleLabel.text = title
        tableDataSource.use(tableView)
    }
    
    func showEmptyState(_ show: Bool) {
        emptyStateView.isHidden = !show
        fullStateView.isHidden = show
    }
}

private extension SectionDetailsViewController {
    func setupUI() {
        titleLabel.typoGraphy = .headingRegular
        titleLabel.contentType = .primary
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    @IBAction func addPhotosButtonTapped() {
        interactor.handleAddPhotoButtonAction()
    }
    
    @IBAction func doneButtonTapped() {
        interactor.handleDoneButtonAction()
    }
}
