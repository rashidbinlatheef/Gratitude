//
//  VisionBoardItemCell.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 11/09/22.
//

import UIKit

final class VisionBoardItemCell: UITableViewCell {
    private var imageFrameView: ImageFrameView?
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var imageFrameContainerView: UIView!
    var editButtonActionHandler: (() -> Void)?
    var addPhotoActionHandler: (() -> Void)?
    var photoTapActionHandler: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageFrameContainerView.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageFrameView?.removeFromSuperview()
    }
    
    func render(name: String, imageUrls: [String]?) {
        nameLabel.text = name
        let imageFrameView = ImageFrameView(imageUrls: imageUrls)
        imageFrameContainerView.addSubview(imageFrameView)
        imageFrameView.addPhotoActionHandler = { [weak self] in
            guard let self = self else { return }
            self.addPhotoActionHandler?()
        }
        
        imageFrameView.photoTapActionHandler = { [weak self] in
            guard let self = self else { return }
            self.photoTapActionHandler?()
        }
        imageFrameView.translatesAutoresizingMaskIntoConstraints = false
        imageFrameView.topAnchor.constraint(equalTo: imageFrameContainerView.topAnchor).isActive = true
        imageFrameView.bottomAnchor.constraint(equalTo: imageFrameContainerView.bottomAnchor).isActive = true
        imageFrameView.leadingAnchor.constraint(equalTo: imageFrameContainerView.leadingAnchor).isActive = true
        imageFrameView.trailingAnchor.constraint(equalTo: imageFrameContainerView.trailingAnchor).isActive = true
        
        self.imageFrameView = imageFrameView
    }

    @IBAction private func editButtonTapped() {
        editButtonActionHandler?()
    }
}
