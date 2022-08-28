//
//  main.swift
//  ex04
//
//  Created by Lashaun Corinna on 8/11/22.
//

import Swift

var test = Deck(bool: false)
var x: Card?

print(test)

x = test.draw()
x = test.draw()
x = test.draw()
x = test.draw()
x = test.draw()
x = test.draw()
x = test.draw()
x = test.draw()
x = test.draw()
x = test.draw()


x = nil

print("")
for i in test.outs {
        print("outs = \(i)")
}
print("")
test.fold(c: test.outs[0])
test.fold(c: test.outs[1])
test.fold(c: test.outs[2])
test.fold(c: test.outs[3])

for i in test.discards {
        print("discards = \(i)")
}
print("")
for i in test.outs {
        print("outs = \(i)")
}
print("")
for i in test.cards {
      print(i)
}
