//
//  deck.swift
//  ex04
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
    
    static let allCards: [Card] = allSpades + allDiamonds + allHearts + allClubs
    
    var cards: [Card] = []
    var discards: [Card] = []
    var outs: [Card] = []
    
    
    init (bool: Bool) {
        self.cards = Deck.allCards
        if bool == false {
            self.cards.mix()
        }
    }
    
    override var description: String {
        return self.cards.description
    }
    
    func draw () -> Card? {
        var first: Card?
        first = self.cards.first
        self.outs.append(first!)
        self.cards.remove(at: 0)
        return first
    }
    
    func fold(c: Card) {
        var index = 0;
        for elem in self.outs {
            if c == elem {
                self.discards.append(elem)
                self.outs.remove(at: index)
            }
            index += 1
        }
    }
    
}

extension Array {
    mutating func mix(){
        for i in 0 ..< self.count {
            let elem = Int(arc4random_uniform(UInt32(self.count)))
            self.swapAt(elem, i)
        }
    }
}
