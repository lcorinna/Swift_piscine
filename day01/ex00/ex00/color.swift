//
//  color.swift
//  ex00
//
//  Created by Lashaun Corinna on 8/11/22.
//

import Swift

enum color: String{
    case piki = "piki"
    case cross = "cross"
    case diamonds = "diamonds"
    case hearts = "hearts"
    
    static let allColors: [color] = [piki, cross, diamonds, hearts]
//    var color: String {
//        switch self {
//        case .piki:
//            return "black"
//        case .cross:
//            return "black"
//        case .diamonds:
//            return "red"
//        case .hearts:
//            return "red"
//        }
//    }
}
