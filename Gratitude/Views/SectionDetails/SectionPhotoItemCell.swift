//
//  SectionPhotoItemCell.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 11/09/22.
//

import UIKit

final class SectionPhotoItemCell: UITableViewCell {
    @IBOutlet private weak  var captionTextField: TextField!
    @IBOutlet private weak  var sectionImage: WebImageView!
    @IBOutlet private weak  var deleteButton: UIButton!
    var deleteButtonActionHandler: (() -> Void)?
    var didUpdateCaption: ((String?) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        sectionImage.layer.cornerRadius = 12
        deleteButton.setTitle("", for: .normal)
        captionTextField.delegate = self
        captionTextField.addTarget(
            self,
            action: #selector(textDidChange),
            for: .editingChanged
            )
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        sectionImage.image = nil
        captionTextField.text = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func render(imageUrl: String, caption: String?) {
        captionTextField.text = caption
        sectionImage.setImageFromUrlString(imageUrl)
    }
    
    @IBAction private func deleteButtonTapped() {
        deleteButtonActionHandler?()
    }
    
    @objc
    private func textDidChange() {
        didUpdateCaption?(captionTextField.text)
    }
}

extension SectionPhotoItemCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        true
    }
}
