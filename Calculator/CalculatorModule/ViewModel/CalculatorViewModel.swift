//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Peter on 17.01.2025.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    // MARK: - Private variables
    @Published var value: String = "0"
    @Published var number: Double = 0
    @Published var currentOperation: Operation = .none
    
    // MARK: - Private fields
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dec, .equal]
    ]
    
    // MARK: - Button actions
    func didPressButton(_ button: CalcButton) {
            switch button {
            case .equal:
                value = String(format: "%g", operation(Double(value) ?? 0))
                number = 0
                currentOperation = .none
            case .plus, .minus, .multiple, .divide:
                if currentOperation != .none {
                    value = String(format: "%g", operation(Double(value) ?? 0))
                }
                let buttonInfo = button.operation
                currentOperation = buttonInfo.operation
                number = Double(value) ?? 0
                value += buttonInfo.sign
            case .clear:
                value = "0"
                number = 0
                currentOperation = .none
            case .percent:
                value = String(format: "%g", (Double(value) ?? 0) / 100.0)
            case .negative:
                value = String(format: "%g", -(Double(value) ?? 0))
            case .dec:
                if !value.contains(".") {
                    value += "."
                }
            default:
                if value == "0" || value.last == "+" || value.last == "-" || value.last == "×" || value.last == "÷" {
                    value = button.rawValue
                } else {
                    value += button.rawValue
                }
            }
        }
    
    func operation(_ currentValue: Double) -> Double {
        switch currentOperation {
        case .plus:
            return number + currentValue
        case .minus:
            return number - currentValue
        case .multiply:
            return number * currentValue
        case .divide:
            return number / currentValue
        default:
            return currentValue
        }
    }
}
