//
//  SectionImageListDataSource.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 13/09/22.
//

import Foundation
import UIKit

//sourcery: AutoMockable
protocol SectionImageListActionHandler: AnyObject {
    func didSelectImage(_ image: ImagePickerItem)
    func startPagingIfNeeded()
}

//sourcery: AutoMockable
protocol SectionImageListDataSourceProtocol: AnyObject {
    func use(_ collectionView: UICollectionView)
    func reloadWithSelectedImages(_ selectedImages: [ImagePickerItem])
    func reloadWithImages(_ images: [ImagePickerItem], selectedImages: [ImagePickerItem])
}

class SectionImageListDataSource: NSObject {
    private var images: [ImagePickerItem]
    private weak var collectionView: UICollectionView!
    private weak var actionHandler: SectionImageListActionHandler?
    private var selectedImages: [ImagePickerItem]
    
    init(
        images: [ImagePickerItem],
        actionHandler: SectionImageListActionHandler,
        selectedImages: [ImagePickerItem]
    ) {
        self.images = images
        self.actionHandler = actionHandler
        self.selectedImages = selectedImages
    }
}

extension SectionImageListDataSource: SectionImageListDataSourceProtocol {
    func use(_ collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView = collectionView
    }
    
    func reloadWithSelectedImages(_ selectedImages: [ImagePickerItem]) {
        self.selectedImages = selectedImages
        collectionView.reloadData()
    }
    
    func reloadWithImages(_ images: [ImagePickerItem], selectedImages: [ImagePickerItem]) {
        self.images = images
        self.selectedImages = selectedImages
        collectionView.reloadData()
    }
}

extension SectionImageListDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionImageSelectorCell", for: indexPath) as? SectionImageSelectorCell else {
            fatalError("Failed to get expected kind of reusable cell. Expected type `SectionImageSelectorCell`")
        }
        let image = images[indexPath.row]
        let isSelected = selectedImages.contains{$0.imageId == image.imageId}
        cell.render(imageUrl: image.thumbUrl, isSelected: isSelected)
        return cell
    }
}

extension SectionImageListDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  1
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: 218)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension SectionImageListDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UIApplication
            .shared
            .sendAction(
                #selector(UIApplication.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
        let image = images[indexPath.row]
        actionHandler?.didSelectImage(image)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > scrollView.contentSize.height - 100 - scrollView.frame.height {
            actionHandler?.startPagingIfNeeded()
        }
    }
}
