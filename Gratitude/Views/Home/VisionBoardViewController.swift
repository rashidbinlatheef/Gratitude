//
//  VisionBoardViewController.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 10/09/22.
//

import UIKit

//sourcery: AutoMockable
protocol VisionBoardViewable: AnyObject {
    func render(
        title: String,
        tableDataSource: VisionBoardTableDataSourceProtocol
    )
}

final class VisionBoardViewController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var interactor: VisionBoardInteracting!
    private let titleLabel = GRLabel()
    
    static func viewController(
        interactor: VisionBoardInteracting
    ) -> VisionBoardViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "VisionBoardViewController") as? VisionBoardViewController else {
            assertionFailure("VisionBoardViewController not found")
            return UIViewController() as! VisionBoardViewController
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
        navigationItem.hidesBackButton = true
        navigationController?.isNavigationBarHidden = false
    }
}

extension VisionBoardViewController: VisionBoardViewable {
    func render(
        title: String,
        tableDataSource: VisionBoardTableDataSourceProtocol
    ) {
        titleLabel.text = title
        tableDataSource.use(tableView)
    }
}

private extension VisionBoardViewController {
    func setupUI() {
        titleLabel.typoGraphy = .headingRegular
        titleLabel.contentType = .primary
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem.init(customView: titleLabel)
        ]
    }
    
    @IBAction func addNewSectionButtonTapped() {
        interactor.handleAddAnotherButtonTap()
    }
}
