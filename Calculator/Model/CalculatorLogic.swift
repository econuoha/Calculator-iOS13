//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Emmanuel Onouha on 8/17/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {

    private var number: Double?

    private var intermediateCalculaton: (n1: Double, calcMethod: String)?

    mutating func setNumber(_ number: Double){
        self.number = number
    }

    mutating func calculate(symbol: String) -> Double? {
        guard let validNumber = number else { fatalError("A valid number was not passed in to calculator logic.") }
        if symbol == "+/-"{

            return validNumber * -1
        }
        else if symbol == "AC"{
            return 0
        }
        else if symbol == "%"{
            return validNumber / 100
        }

        else if symbol == "="{
            return performTwoNumCalculation(n2: validNumber)
        }
        else {
            intermediateCalculaton = (n1: validNumber, calcMethod: symbol)
        }

        return validNumber
    }

    private func performTwoNumCalculation(n2: Double) -> Double? {

        guard let n1 = intermediateCalculaton?.n1, let operation = intermediateCalculaton?.calcMethod else {

            return nil
        }

        switch operation{
            case "+":
                return n1 + n2

            case "-":
                return n1 - n2

            case "×":
                return n1 * n2
            case "÷":
                if n2 == 0{
                    //Return Not a Number
                    return nil
                }
                return n1 / n2

            default:
                fatalError("Reached else in performTwoNumberCalculation")
        }

    }
}
