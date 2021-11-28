//
//  main.swift
//  DeffieHellman
//
//  Created by Антон Зайцев on 24.11.2021.
//

import Foundation

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ** : PowerPrecedence

func ** (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

let g = Int.random(in: 0..<1000)
let n = Int.random(in: 0..<1000)

print("Public: \tg =", g)
print("Public: \tn =", n)

var Alice_num = Int.random(in: 0..<1000)
var Bob_num = Int.random(in: 0..<1000)

print("Private: \tAlice's number =", Alice_num)
print("Private: \tBob's number =", Bob_num)

let Alice_key1 = g ** Alice_num % n
let Bob_key1 = g ** Bob_num % n

print("Private: \tAlice's key1 =", Alice_key1)
print("Private: \tBob's key1 =", Bob_key1)

let Alice_key_final = Bob_key1 ** Alice_num % n
let Bob_key_final = Alice_key1 **  Bob_num % n

print("Public: \tAlice's key final =", Alice_key_final)
print("Public: \tBob's key final =", Bob_key_final)

if (Alice_key_final == Bob_key_final) {
    print("Succefull")
}
else {
    print("Fail")
}
