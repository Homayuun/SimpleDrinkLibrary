//
//  DrinkTests.swift
//  SimpleDrinkLibrary
//
//  Created by Homayun on 1402-02-24.
//

import XCTest
@testable import SimpleDrinkLibrary

class DrinkTests: XCTestCase {
    var drinks: [Drink] = []
    
    override func setUp() {
        super.setUp()

        drinks = []
    }
    
    func testDrinksArray_WhenInitialized_IsEmpty() {
        XCTAssertTrue(drinks.isEmpty)
    }
    
    func testAdd_OneCupOfDrink_IncreasesCountBy_One() {
        let drink = Drink(name: "Coffee", volume: 100)
        drinks.append(drink)
        XCTAssertEqual(drinks.count, 1)
    }
    
    func testAdd_OneCupOfDrink_AddsCorrectDrink() {
        let expectedDrink = Drink(name: "Tea", volume: 100)
        drinks.append(expectedDrink)
        XCTAssertEqual(drinks.first, expectedDrink)
    }
    
    func testAdd_OneCupOfDrink_SetsCorrectVolume() {
        let drink = Drink(name: "Water", volume: 100)
        drinks.append(drink)
        XCTAssertEqual(drinks.first?.volume, 100)
    }
    
    func testAdd_OneCupOfDrink_SetsCorrectName() {
        let drink = Drink(name: "Juice", volume: 100)
        drinks.append(drink)
        XCTAssertEqual(drinks.first?.name, "Juice")
    }
    
    func testAdd_MultipleCupsOfDifferentDrinks_IncreasesCount() {
        let drink1 = Drink(name: "Soda", volume: 100)
        let drink2 = Drink(name: "Lemonade", volume: 100)
        drinks.append(drink1)
        drinks.append(drink2)
        XCTAssertEqual(drinks.count, 2)
    }
    
    func testAdd_MultipleCupsOfDifferentDrinks_AddsAllDrinks() {
        let drink1 = Drink(name: "Milk", volume: 100)
        let drink2 = Drink(name: "Orange Juice", volume: 100)
        drinks.append(drink1)
        drinks.append(drink2)
        XCTAssertTrue(drinks.contains(drink1))
        XCTAssertTrue(drinks.contains(drink2))
    }
    
    func testAdd_MultipleCupsOfSameDrink_IncreasesCount() {
        let drink = Drink(name: "Cola", volume: 100)
        for _ in 1...3 {
            drinks.append(drink)
        }
        XCTAssertEqual(drinks.count, 3)
    }
    
    func testAdd_MultipleCupsOfSameDrink_CalculatesTotalVolume() {
        let icedTeaDrink = Drink(name: "Iced Tea", volume: 100)
        let coffeeDrink = Drink(name: "Coffee", volume: 100)
        
        for _ in 1...5 {
            drinks.append(icedTeaDrink)
        }
        drinks.append(coffeeDrink)
        
        let icedTeaVolume = drinks.filter { $0.name == "Iced Tea" }.reduce(0) { $0 + $1.volume }
        XCTAssertEqual(icedTeaVolume, 500)
    }

    func testAddingInvalidVolumeDrink_ThrowsError() {
        let invalidDrink = Drink(name: "Invalid Drink", volume: 50)
        XCTAssertThrowsError(try drinks.appendCup(of: invalidDrink))
    }
}
