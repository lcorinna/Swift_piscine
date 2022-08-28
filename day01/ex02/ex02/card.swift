//
//  card.swift
//  ex02
//
//  Created by Lashaun Corinna on 8/11/22.
//

import Swift
import Foundation

class Card: NSObject {
    var color: Color
    var value: Value
    
    init(color: Color, value: Value) {
        self.color = color
        self.value = value
    }
    
    override var description: String {
        return "Value \(self.value) Color \(self.color)"
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let card2 = object as? Card {
            return (self.value == card2.value && self.color == card2.color)
        }
        else {
            return false
        }
    }
    static func == (one: Card, two: Card) -> Bool {
        return (one.value == two.value && one.color == two.color)
    }
    
}
