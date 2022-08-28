//
//  main.swift
//  ex01
//
//  Created by Lashaun Corinna on 8/11/22.
//

import Swift


var Card1 = Card(color: Color.hearts, value: Value.eight);
var Card2 = Card(color: Color.cross, value: Value.ace);
var Card3 = Card(color:Color.piki, value:Value.lady);

print(Card1)
print(Card2)
print(Card1.isEqual(Card3))
print(Card2 == Card2)
