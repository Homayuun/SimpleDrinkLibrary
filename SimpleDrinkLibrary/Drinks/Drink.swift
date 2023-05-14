//
//  SimpleDrinkLibrary.swift
//  SimpleDrinkLibrary
//
//  Created by Homayun on 1402-02-24.
//

struct Drink: Equatable {
    let name: String
    let volume: Int
}
extension Array where Element == Drink {
    mutating func appendCup(of drink: Drink) throws {
        guard drink.volume >= 100 else {
            throw DrinkError.invalidVolume
        }
        append(drink)
    }
}

enum DrinkError: Error {
    case invalidVolume
}

