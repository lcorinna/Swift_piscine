//
//  circle.swift
//  ex00
//
//  Created by Lashaun Corinna on 8/19/22.
//

import Foundation
import UIKit

class Circle: Shape {
        
        override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
            return UIDynamicItemCollisionBoundsType.ellipse
        }
    
    override func draw(_ rect: CGRect) {
        layer.backgroundColor = color
        layer.cornerRadius = self.bounds.width / 2
    }
}
