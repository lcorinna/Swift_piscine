//
//  generationShape.swift
//  ex00
//
//  Created by Lashaun Corinna on 8/19/22.
//

import Foundation
import UIKit


class generationShape {
    
    var frameSize: CGSize
    
    init(frameSize: CGSize ){
        self.frameSize = frameSize
    }
    
    public func randomShape (_ center: CGPoint)  -> Shape {
        
        var randomColor = CGColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        
        var randomNumber = Int.random(in: 0...1)
        
        var frame = CGRect(x: center.x - frameSize.width / 2, y: center.y - frameSize.height / 2, width: 100, height: 100)
        
        switch randomNumber {
        case 0:
            return Circle(frame: frame, color: randomColor)
        default:
            return Square(frame: frame, color: randomColor)
        }
    }
    
}
