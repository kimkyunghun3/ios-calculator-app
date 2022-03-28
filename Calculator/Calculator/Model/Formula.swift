//
//  Formula.swift
//  Calculator
//
//  Created by Eddy on 2022/03/20.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    private func result() -> Double {
        guard var operationResult = operands.dequeue() else {
            return .nan
        }
        
        while operands.isEmpty == false {
            guard let elementOperand = operands.dequeue(),
                  let elementOperator = operators.dequeue() else {
                return .nan
            }
            operationResult = elementOperator.calculate(lhs: operationResult, rhs: elementOperand)
        }
        return operationResult
    }
}
