//
//  ImagesCell.swift
//  ex00
//
//  Created by Lashaun Corinna on 8/14/22.
//

import UIKit
import SwiftUI

let images: [String] = ["https://img1.akspic.ru/crops/9/5/1/4/5/154159/154159-dikaya_mestnost-oblako-rastenie-gora-prirodnyj_landshaft-7680x4320.jpg",
                        "https://img1.akspic.ru/crops/9/0/5/9/4/149509/149509-nagore-oblako-priroda-nebo-gornyj_hrebet-7680x4320.jpg",
                        "https://img1.akspic.ru/crops/4/5/8/3/6/163854/163854-nacionalnyj_park_zajon-nacionalnyj_park_brajskanon-nacionalnyj_park_arki-bolshoj_kanon-nacionalnyj_park_dolina_smerti-7680x4320.jpg",
                        "https://img1.akspic.ru/crops/1/7/5/9/4/149571/149571-prirodnyj_zapovednik-vodnye_elementy-voda-oregon-starovozrastnye_lesa-7680x4320.jpg",
                        "https://linkError.jpg"]

class ImagesCell: UICollectionViewCell {
    
    @IBOutlet weak var animalImage: UIImageView! {
        
        didSet {
            let imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(animalImage))
            animalImage.addGestureRecognizer(imageTapGestureRecognizer)
            animalImage.isUserInteractionEnabled = true
        }
        func imageTapped() {
            //navigate to another view controller
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func downloadImage (url: URL, mainViewController: UIViewController){
        let queue = DispatchQueue.global(qos: .background)
        
        queue.async{
            if let data = try? Data(contentsOf: url){
                let image = UIImage(data: data)
                DispatchQueue.main.async{
                    self.animalImage.image = image
                }
            }else{
                let allertController = UIAlertController(title: "not found", message: "\(url)", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { (action) in
                }
                allertController.addAction(action)
                DispatchQueue.main.async {
                    mainViewController.present(allertController, animated: true)
                }
                
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.animalImage.image = nil
    }
    
}
