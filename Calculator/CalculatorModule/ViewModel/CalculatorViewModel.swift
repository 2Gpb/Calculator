//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Peter on 17.01.2025.
//

import Foundation

final class CalculatorViewModel: ObservableObject {
    // MARK: - Published variables
    @Published var value: String = "0"
    
    // MARK: - Private variables
    private var number: Double = 0
    private var currentOperation: Operation = .none
    private var count = 0
    
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
            pressEqual()
        case .plus, .minus, .multiple, .divide:
            pressCalculationSymbols(button)
        case .clear:
            pressClear()
        case .percent:
            pressPercent()
        case .negative:
            pressNegative()
        case .dec:
            pressDec()
        default:
            pressNumber(button)
        }
    }
    
    // MARK: - Private methods
    private func operation(_ currentValue: Double) -> Double {
        switch currentOperation {
        case .plus:
            return number + currentValue
        case .minus:
            return number - currentValue
        case .multiply:
            return number * currentValue
        case .divide:
            guard currentValue != 0 else { return 0 }
            return number / currentValue
        default:
            return currentValue
        }
    }
    
    private func pressEqual() {
        value = String(format: "%g", operation(Double(value) ?? 0))
        number = 0
        currentOperation = .none
    }
    
    private func pressCalculationSymbols(_ button: CalcButton) {
        if currentOperation != .none {
            value = String(format: "%g", operation(Double(value) ?? 0))
        }
        currentOperation = button.operation
        number = Double(value) ?? 0
        count += 1
    }
    
    private func pressClear() {
        value = "0"
        number = 0
        currentOperation = .none
    }
    
    private func pressPercent() {
        value = String(format: "%g", (Double(value) ?? 0) / 100.0)
    }
    
    private func pressNegative() {
        value = String(format: "%g", -(Double(value) ?? 0))
    }
    
    private func pressDec() {
        if !value.contains(".") {
            value += "."
        }
    }
    
    private func pressNumber(_ button: CalcButton) {
        if value == "0" || count > 0 {
            value = button.rawValue
            count = 0
        } else {
            value += button.rawValue
        }
    }
}
