//
//  CalculatorView.swift
//  Calculator
//
//  Created by Peter on 17.01.2025.
//

import SwiftUI

struct CalculatorView: View {
    // MARK: - Constants
    private enum Constants {
        enum View {
            static let spacing: CGFloat = 12
            static let totalSpacing: CGFloat = 5 * spacing
        }
        
        enum Display {
            static let textColor: Color = .white
            static let fontSize: CGFloat = 90
            static let weight: Font.Weight = .light
            static let padding: CGFloat = 28
            static let typePadding: Edge.Set = .horizontal
            static let defaultValue: String = "0"
        }
        
        enum Buttons {
            static let fontSize: CGFloat = 36
            static let weight: Font.Weight = .regular
        }
    }
    
    // MARK: - Private variables
    @State private var value: String = "0"
    @State private var number: Double = 0
    @State private var currentOperation: Operation = .none
    
    // MARK: - Private fields
    private let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dec, .equal]
    ]
    
    // MARK: - Body
    var body: some View {
        ZStack {
            
            // MARK: - Background
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: Constants.View.spacing) {
                Spacer()
                
                // MARK: - Display
                HStack {
                    Spacer()
                    Text(value)
                        .foregroundColor(Constants.Display.textColor)
                        .font(.system(size: Constants.Display.fontSize,
                                      weight: Constants.Display.weight)
                        )
                        .padding(Constants.Display.typePadding,
                                 Constants.Display.padding)
                }
                
                // MARK: - Buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: Constants.View.spacing) {
                        ForEach(row, id: \.self) { button in
                            Button {
                                didPressButton(button)
                            } label: {
                                Text(button.rawValue)
                                    .frame(width: buttonWidth(button), height: buttonHeight(button))
                                    .font(.system(size: Constants.Buttons.fontSize, weight: Constants.Buttons.weight))
                                    .foregroundColor(button.textColor)
                                    .background(button.color)
                                    .cornerRadius(buttonHeight(button) / 2)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
    
    // MARK: - Private methods
    private func buttonWidth(_ button: CalcButton) -> CGFloat {
        switch button {
        case .zero:
            return (UIScreen.main.bounds.width - Constants.View.totalSpacing) / 2 + Constants.View.spacing
        default:
            return (UIScreen.main.bounds.width - Constants.View.totalSpacing) / 4
        }
    }
    
    private func buttonHeight(_ button: CalcButton) -> CGFloat {
        return (UIScreen.main.bounds.width - Constants.View.totalSpacing) / 4
    }
    
    // MARK: - Actions
    func didPressButton(_ button: CalcButton) {
        switch button {
        case .equal:
            value = String(format: "%g", operation(Double(value) ?? 0))
            number = 0
        case .plus:
            currentOperation = .plus
            number = Double(value) ?? 0
            value += "+"
        case .minus:
            currentOperation = .minus
            number = Double(value) ?? 0
            value += "-"
        case .multiple:
            currentOperation = .multiply
            number = Double(value) ?? 0
            value += "*"
        case .divide:
            currentOperation = .divide
            number = Double(value) ?? 0
            value += "÷"
        case .clear:
            value = "0"
        case .percent:
            value = String(format: "%g", (Double(value) ?? 0) / 100.0)
        case .negative:
            value = String(format: "%g", -(Double(value) ?? 0))
        case .dec:
            if !value.contains(".") {
                value += "."
            }
        default:
            if value == "0" || value.last == "+" || value.last == "-" || value.last == "*" || value.last == "÷" {
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

#Preview {
    CalculatorView()
}
