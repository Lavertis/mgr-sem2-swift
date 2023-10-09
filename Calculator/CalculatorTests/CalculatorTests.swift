//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Rafał on 14/10/2023.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testPositiveScenarioForAddCalculation() {
        let a = 5
        let b = 1
        
        let result = MathService.add(a: a, b: b)
        
        XCTAssertEqual(result, 6)
    }
    
    func testNegativeScenarioForAddCalculation() {
        let a = 5
        let b = 1
        
        let result = MathService.add(a: a, b: b)
        
        XCTAssertNotEqual(result, 5)
    }
    
    func testPositiveScenarioForSubCalculation() {
        let a = 5
        let b = 1
        
        let result = MathService.subtract(a: a, b: b)
        
        XCTAssertEqual(result, 4)
    }
    
    func testNegativeScenarioForSubCalculation() {
        let a = 5
        let b = 1
        
        let result = MathService.subtract(a: a, b: b)
        
        XCTAssertNotEqual(result, 5)
    }
    
    func testPositiveScenarioForProdCalculation() {
        let a = 5
        let b = 2
        
        let result = MathService.multiply(a: a, b: b)
        
        XCTAssertEqual(result, 10)
    }
    
    func testNegativeScenarioForProdCalculation() {
        let a = 5
        let b = 2
        
        let result = MathService.multiply(a: a, b: b)
        
        XCTAssertNotEqual(result, 5)
    }
    
    func testPositiveScenarioForDivCalculation() {
        let a = 5
        let b = 2
        
        let result = MathService.divide(a: a, b: b)
        
        XCTAssertEqual(result, 2.5)
    }
    
    func testZeroScenarioForDivCalculation() {
        let a = 5
        let b = 0
        
        let result = MathService.divide(a: a, b: b)
        
        XCTAssertNil(result)
    }
    
    func testPositiveScenarioForSinCalculation() {
        let a = 5
        
        let result = MathService.calc_sin(a: a)
        
        XCTAssertEqual(result, -0.95892427466, accuracy: 1e-10)
    }}
