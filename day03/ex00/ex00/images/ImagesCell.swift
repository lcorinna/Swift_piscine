 //
//  ImagesCell.swift
//  ex00
//
//  Created by Lashaun Corinna on 8/14/22.
//

import UIKit
import SwiftUI

class ImagesCell: UICollectionViewCell {

    @IBOutlet weak var animalImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(animal: Animal) {
        self.animalImage.image = animal.image
    }

//    override func prepareForReuse() {
//        super.prepareForReuse()
//        self.animalImage.image = nil //переиспользование при скроле
//    }
}
