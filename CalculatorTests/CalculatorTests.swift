//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Peter on 20.01.2025.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    private var calculatorViewModel: CalculatorViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        calculatorViewModel = CalculatorViewModel()
    }

    override func tearDownWithError() throws {
        calculatorViewModel = nil
        try super.tearDownWithError()
    }

    func testInitialState() {
        XCTAssertEqual(calculatorViewModel.value, "0", "Initial value should be 0")
    }
    
    func testClearButton() {
        calculatorViewModel.value = "111"
        calculatorViewModel.didPressButton(.clear)
        
        XCTAssertEqual(calculatorViewModel.value, "0", "Value should be 0 after clear")
    }
    
    func testAddition() {
        calculatorViewModel.didPressButton(.two)
        calculatorViewModel.didPressButton(.plus)
        calculatorViewModel.didPressButton(.three)
        calculatorViewModel.didPressButton(.equal)
        
        XCTAssertEqual(calculatorViewModel.value, "5", "2 + 3 should equal 5")
    }
    
    func testSubtraction() {
        calculatorViewModel.didPressButton(.five)
        calculatorViewModel.didPressButton(.minus)
        calculatorViewModel.didPressButton(.three)
        calculatorViewModel.didPressButton(.equal)
        
        XCTAssertEqual(calculatorViewModel.value, "2", "5 - 3 should equal 2")
    }
    
    func testMultiplication() {
        calculatorViewModel.didPressButton(.two)
        calculatorViewModel.didPressButton(.multiple)
        calculatorViewModel.didPressButton(.three)
        calculatorViewModel.didPressButton(.equal)
        
        XCTAssertEqual(calculatorViewModel.value, "6", "2 * 3 should equal 6")
    }
    
    func testDivision() {
        calculatorViewModel.didPressButton(.six)
        calculatorViewModel.didPressButton(.divide)
        calculatorViewModel.didPressButton(.two)
        calculatorViewModel.didPressButton(.equal)
        
        XCTAssertEqual(calculatorViewModel.value, "3", "6 / 2 should equal 3")
    }
    
    func testDivisionByZero() {
        calculatorViewModel.didPressButton(.nine)
        calculatorViewModel.didPressButton(.divide)
        calculatorViewModel.didPressButton(.zero)
        calculatorViewModel.didPressButton(.equal)
        
        XCTAssertEqual(calculatorViewModel.value, "0", "9 / 0 should return 0")
    }
    
    func testDecimal() {
        calculatorViewModel.didPressButton(.one)
        calculatorViewModel.didPressButton(.dec)
        calculatorViewModel.didPressButton(.three)
        
        XCTAssertEqual(calculatorViewModel.value, "1.3", "1.3 should be valid")
    }
    
    func testPercent() {
        calculatorViewModel.didPressButton(.five)
        calculatorViewModel.didPressButton(.four)
        calculatorViewModel.didPressButton(.percent)
        
        XCTAssertEqual(calculatorViewModel.value, "0.54", "54% should equal 0.54")
    }
    
    func testNegative() {
        calculatorViewModel.didPressButton(.nine)
        calculatorViewModel.didPressButton(.negative)
        
        XCTAssertEqual(calculatorViewModel.value, "-9", "Negative of 9 should be -9")
    }
}
