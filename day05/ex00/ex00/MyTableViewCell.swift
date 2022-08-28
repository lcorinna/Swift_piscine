//
//  MyTableViewCell.swift
//  ex00
//
//  Created by Lashaun Corinna on 8/16/22.
//

import UIKit
import CoreLocation
import Foundation

struct Favourites {
    let name: String
    let description: String
    let coordinate: CLLocationCoordinate2D
//    static var favourite: [(name: String, description: String, nord: Double, south: Double)] =
//    [("Ecol42", "Place of knoledge", 55.797044, 37.579248)]
}

var places: [Favourites] = [Favourites(name: "Ecol42", description: "Place of knoledge", coordinate: CLLocationCoordinate2D(latitude: 55.797044, longitude: 37.579248)), Favourites(name: "Pacific ocean", description: "So big and so blue", coordinate: CLLocationCoordinate2D(latitude: 18.199684, longitude: -174.290985)), Favourites(name: "Apple office", description: "Even better", coordinate: CLLocationCoordinate2D(latitude: 55.690905, longitude: 37.413178))]

class MyTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static let id = "MyTableViewCell"
    //
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    //
    //    var list: (name: String, description: String) {
    //        get {
    //            return (nameLabel.text!, descriptionLabel.text!)
    //        }
    //        set (list) {
    //            nameLabel.text = list.name
    //            descriptionLabel.text = list.description
    //
    //        }
}
