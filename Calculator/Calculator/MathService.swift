//
//  MathService.swift
//  Calculator
//
//  Created by Rafał on 14/10/2023.
//

import Foundation

struct MathService {
    static func add(a: Int, b: Int) -> Double {
        return Double(a + b)
    }
    
    static func subtract(a: Int, b: Int) -> Double {
        return Double(a - b)
    }
    static func multiply(a: Int, b: Int) -> Double {
        return Double(a * b)
    }
    static func divide(a: Int, b: Int) -> Double? {
        guard b != 0 else {
            return nil
        }
        return Double(a) / Double(b)
    }
    static func calc_sin(a: Int) -> Double {
        return sin(Double(a))
    }
}
