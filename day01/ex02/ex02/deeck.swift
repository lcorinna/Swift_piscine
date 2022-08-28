//
//  deck.swift
//  ex02
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
}
