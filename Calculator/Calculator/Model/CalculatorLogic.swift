//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Pramod Suthar on 04/06/2020.
//  Copyright © 2020 Pramod Suthar. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var iCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
       
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return twoNumCalculation(n2: n)
            default:
                iCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil 
    }
    
    private func twoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = iCalculation?.n1,
            let operation = iCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Error!, Invalid Operation Performed!.")
            }
        }
        return nil
    }
    
}
