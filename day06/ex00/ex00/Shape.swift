//
//  Shape.swift
//  ex00
//
//  Created by Lashaun Corinna on 8/19/22.
//

import UIKit

class Shape: UIView {
    
    var color: CGColor
    
    init(frame: CGRect, color: CGColor) {
        self.color = color
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
