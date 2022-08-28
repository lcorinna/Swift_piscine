//
//  structTweet.swift
//  ex00
//
//  Created by Lashaun Corinna on 8/15/22.
//

import Foundation

struct Tweet: CustomStringConvertible {
    
    let name: String
    let text: String
    
    var description: String {
        return "(\(name), \(text)"
    }
    
}

protocol APITwitterDelegate {
    
    func manageTweet (_: [Tweet])
    
    func err  (_: NSError)
    
}
