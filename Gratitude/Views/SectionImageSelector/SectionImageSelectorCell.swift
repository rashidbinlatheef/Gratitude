//
//  SectionImageSelectorCell.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 11/09/22.
//

import UIKit

final class SectionImageSelectorCell: UICollectionViewCell {
    @IBOutlet private weak var sectionImage: WebImageView!
    @IBOutlet private weak var tickImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        tickImage.isHidden = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        tickImage.isHidden = true
        sectionImage.image = nil
    }
    
    func setImageSelected(_ isSelected: Bool) {
        tickImage.isHidden = !isSelected
    }
    
    func render(imageUrl: String, isSelected: Bool) {
        tickImage.isHidden = !isSelected
        sectionImage.setImageFromUrlString(imageUrl)
    }
}
