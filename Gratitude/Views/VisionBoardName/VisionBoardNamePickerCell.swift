//
//  VisionBoardNamePickerCell.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 14/09/22.
//

import UIKit

final class VisionBoardNamePickerCell: UICollectionViewCell {
    @IBOutlet private weak var button: PillButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        button.setTitle("", for: .normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func render(title: String, actionHandler: (() -> Void)?) {
        button.setTitle(title, for: .normal)
        button.buttonActionHandler = actionHandler
    }
}
