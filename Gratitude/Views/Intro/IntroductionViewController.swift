//
//  IntroductionViewController.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 08/09/22.
//

import UIKit

final class IntroductionViewController: BaseViewController {
    static func viewController(interactor: IntroductionInteracting) -> IntroductionViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "IntroductionViewController") as? IntroductionViewController else {
            assertionFailure("IntroductionViewController not found")
            return UIViewController() as! IntroductionViewController
        }
        viewController.interactor = interactor
        return viewController
    }
    
    private var interactor: IntroductionInteracting!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func buildAVisionButtonTapped() {
        interactor.handleBuildVisionBoardButtonTap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}
