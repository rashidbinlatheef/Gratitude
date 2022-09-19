//
//  ImageFrameView.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 11/09/22.
//

import UIKit

final class ImageFrameView: UIView {
    private let imageUrls: [String]?
    var addPhotoActionHandler: (() -> Void)?
    var photoTapActionHandler: (() -> Void)?

    init(imageUrls: [String]?) {
        self.imageUrls = imageUrls
        super.init(frame: .zero)
        setupUI()
    }
    
    func setupUI() {
        var imageFrames = [UIView]()
        let imageCount = imageUrls?.count ?? 0
        switch imageCount {
        case 0:
            imageFrames.append(
                contentsOf: [
                    getImageFrameWith(color: .pink300),
                    getImageFrameWith(color: .purple200),
                    getImageFrameWith(color: .yellow300),
                    getImageFrameWith(color: .green100),
                ]
            )
        case 1:
            imageFrames.append(
                contentsOf: [
                    getImageFrameWith(imageUrl: imageUrls?[0]),
                    getImageFrameWith(color: .pink300)
                ]
            )
        case 2:
            imageFrames.append(
                contentsOf: [
                    getImageFrameWith(imageUrl: imageUrls?[0]),
                    getImageFrameWith(imageUrl: imageUrls?[1]),
                    getImageFrameWith(color: .pink300)
                ]
            )
        case 3:
            imageFrames.append(
                contentsOf: [
                    getImageFrameWith(imageUrl: imageUrls?[0]),
                    getImageFrameWith(imageUrl: imageUrls?[1]),
                    getImageFrameWith(imageUrl: imageUrls?[2]),
                    getImageFrameWith(color: .pink300)
                ]
            )
        case 4,5:
            imageFrames.append(
                contentsOf: [
                    getImageFrameWith(imageUrl: imageUrls?[0]),
                    getImageFrameWith(imageUrl: imageUrls?[1]),
                    getImageFrameWith(imageUrl: imageUrls?[2]),
                    getImageFrameWith(imageUrl: imageUrls?[3]),
                ]
            )
            if imageCount == 5 {
                imageFrames.append(getImageFrameWith(imageUrl: imageUrls?[4]))
            } else {
                imageFrames.append(getImageFrameWith(color: .pink300))
            }
        default:
            break
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        let height: CGFloat = imageFrames.count == 5 ? 268: 132
        heightAnchor.constraint(equalToConstant: height).isActive = true
        
        let stackView = createStackViewWith(imageFrames: imageFrames)
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func getImageFrameWith(color: UIColor? = nil, imageUrl: String? = nil) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        let imageView = WebImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        if let imageUrl = imageUrl {
            imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            imageView.contentMode = .scaleAspectFill
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            view.addGestureRecognizer(tapGesture)
            imageView.setImageFromUrlString(imageUrl)
        } else {
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            imageView.image = UIImage(systemName: "plus")
            imageView.tintColor = .white
    
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addImageTapped))
            view.addGestureRecognizer(tapGesture)
        }
        
        return view
    }
    
    @objc
    private func addImageTapped() {
        addPhotoActionHandler?()
    }
    
    @objc
    private func imageTapped() {
        photoTapActionHandler?()
    }
    
    func createStackViewWith(imageFrames: [UIView]) -> UIStackView {
        switch imageFrames.count {
        case 2:
            return createStackViewWith(
                subViews: imageFrames,
                axis: .horizontal
            )
        case 3:
            let verticalStackView = createStackViewWith(
                subViews: [imageFrames[1], imageFrames[2]],
                axis: .vertical
            )
            return createStackViewWith(
                subViews: [imageFrames[0], verticalStackView],
                axis: .horizontal
            )
        case 4:
            let verticalStackView = createStackViewWith(
                subViews: [imageFrames[2], imageFrames[3]],
                axis: .vertical
            )
            return createStackViewWith(
                subViews: [imageFrames[0], imageFrames[1], verticalStackView],
                axis: .horizontal
            )
        case 5:
            let verticalStackView = createStackViewWith(
                subViews: [imageFrames[3], imageFrames[4]],
                axis: .vertical
            )
            let bottomStackView = createStackViewWith(
                subViews: [imageFrames[2], verticalStackView],
                axis: .horizontal
            )
            
            let topStackView = createStackViewWith(
                subViews: [imageFrames[0], imageFrames[1]],
                axis: .horizontal
            )
            
            return createStackViewWith(
                subViews: [topStackView, bottomStackView],
                axis: .vertical
            )
        default:
            fatalError("This will never happen")
            break
            
        }
    }
    
    func createStackViewWith(subViews: [UIView], axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: subViews)
        stackView.axis = axis
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
