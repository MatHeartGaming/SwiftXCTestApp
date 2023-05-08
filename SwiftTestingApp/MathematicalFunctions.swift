//
//  MathematicalFunctions.swift
//  SwiftTestingApp
//
//  Created by Matteo Buompastore on 08/05/23.
//

import Foundation

class MathFunctions {
    
    func addIntegers(x: Int, y : Int) -> Int {
        return x + y
    }
    
    func subtractIntegers(x: Int, y : Int) -> Int {
        return x - y
    }
    
    func multiplyIntegers(x: Int, y : Int) -> Int {
        return x * y
    }
    
    func divideIntegers(x: Int, y : Int) -> Int {
        if y == 0 {
            return 0
        }
        return x / y
    }
    
}
