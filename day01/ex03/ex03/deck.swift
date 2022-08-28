//
//  deck.swift
//  ex03
//
//  Created by Lashaun Corinna on 8/11/22.
//

import Swift
import Foundation

class Deck: NSObject {
    static let allSpades: [Card] = Value.allValues.map{Card(color: Color.piki, value: $0)}
    static let allDiamonds: [Card] = Value.allValues.map{Card(color: Color.diamonds, value: $0)}
    static let allHearts: [Card] = Value.allValues.map{Card(color: Color.hearts, value: $0)}
    static let allClubs: [Card] = Value.allValues.map{Card(color: Color.cross, value: $0)}
    
    static let allCards: [Card] = (allSpades + allDiamonds + allHearts + allClubs)
}

extension Array {
    mutating func mix(){
        for i in 0 ..< self.count {
            let elem = Int(arc4random_uniform(UInt32(self.count)))
            self.swapAt(elem, i)
        }
    }
}
