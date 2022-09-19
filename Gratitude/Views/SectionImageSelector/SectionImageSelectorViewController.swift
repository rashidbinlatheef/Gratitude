//
//  SectionImageSelectorViewController.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 11/09/22.
//

import UIKit

//sourcery: AutoMockable
protocol SectionImageSelectorViewable: AnyObject {
    func render(
        searchText: String?,
        listDataSource: SectionImageListDataSourceProtocol
    )
    
    func showSelectedImages(_ images: [ImagePickerItem])
    
    func showImageLimitBanner(_ show: Bool)
    
    func showNetworkProgressIndicator(_ show: Bool)
}

final class SectionImageSelectorViewController: BaseViewController {
    @IBOutlet private weak var imageCounterLabel: GRLabel!
    @IBOutlet private weak var photosListView: UICollectionView!
    @IBOutlet private weak var imagePreviewContainer: UIView!
    @IBOutlet private weak var imagePreviewContainerHeight: NSLayoutConstraint!
    @IBOutlet private weak var previewStackView: UIStackView!
    @IBOutlet private weak var imageLimitBanner: UIView!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!
    @IBOutlet private weak var spinnerHeight: NSLayoutConstraint!

    private let searchBar = UISearchBar()
    private var interactor: SectionImageSelectorInteracting!

    static func viewController(interactor: SectionImageSelectorInteracting) -> SectionImageSelectorViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "SectionImageSelectorViewController") as? SectionImageSelectorViewController else {
            assertionFailure("SectionImageSelectorViewController not found")
            return UIViewController() as! SectionImageSelectorViewController
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
    }
    
    @IBAction private func continueButtonTapped() {
        interactor.continueWithImageSelection()
    }
    
    @IBAction private func cameraButtonTapped() {
        interactor.handleCameraButtonTap()
    }
}


extension SectionImageSelectorViewController: SectionImageSelectorViewable {
    func render(
        searchText: String?,
        listDataSource: SectionImageListDataSourceProtocol
    ) {
        searchBar.text = searchText
        listDataSource.use(photosListView)
    }
    
    func showSelectedImages(_ images: [ImagePickerItem]) {
        guard !images.isEmpty else {
            imagePreviewContainerHeight.constant = 0
            imagePreviewContainer.isHidden = true
            imageCounterLabel.text = "\(images.count) photos selected"
            return
        }
        imagePreviewContainerHeight.constant = 84
        imagePreviewContainer.isHidden = false
        for arrangedSubview in previewStackView.arrangedSubviews {
            previewStackView.removeArrangedSubview(arrangedSubview)
        }
        
        for image in images {
            let imageView = WebImageView()
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.setImageFromUrlString(image.thumbUrl)
            previewStackView.addArrangedSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: 56).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        }
        imageCounterLabel.text = "\(images.count) photos selected"
    }
    
    func showImageLimitBanner(_ show: Bool) {
        imageLimitBanner.isHidden = !show
    }
    
    func showNetworkProgressIndicator(_ show: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if show {
                self.spinner.startAnimating()
                self.spinnerHeight.constant = 20
            } else {
                self.spinner.stopAnimating()
                self.spinnerHeight.constant = 0
            }
        }
    }
}

extension SectionImageSelectorViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        interactor.searchImagesFor(searchText: searchBar.text)
    }
}

private extension SectionImageSelectorViewController {
    func setupUI() {
        setupNavigationBar()
        imagePreviewContainer.isHidden = true
    }
    
    func setupNavigationBar() {
        searchBar.sizeToFit()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.heightAnchor.constraint(equalToConstant: 42).isActive = true

        
        let containerView = BaseButton(frame: .zero)
        containerView.buttonActionHandler = { [weak self] in
            self?.cameraButtonTapped()
        }
        containerView.backgroundColor = .grey200

        let imageView = UIImageView(image: UIImage(named: "camera")?.withTintColor(ContentType.accent.color))
        containerView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true

        let rightBarButton = UIBarButtonItem(customView: containerView)
        
        rightBarButton.tintColor = ContentType.accent.color
        
        navigationItem.rightBarButtonItem = rightBarButton
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
}
