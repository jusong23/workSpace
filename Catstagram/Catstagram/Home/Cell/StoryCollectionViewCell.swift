//
//  StoryCollectionViewCell.swift
//  Catstagram
//
//  Created by 이주송 on 2022/04/08.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageViewBackground: UIView!
    @IBOutlet weak var viewUserProfileBackground: UIView!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageViewBackground.layer.cornerRadius = 24
        viewUserProfileBackground.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true
        // Initialization code
    }

}
