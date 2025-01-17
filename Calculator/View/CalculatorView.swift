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
    
    // MARK: - Private fields
    private let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dec, .equal]
    ]
    
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
                    Text(Constants.Display.defaultValue)
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
                        ForEach(row, id: \.self) { item in
                            Button {
                                print(item.rawValue)
                            } label: {
                                Text(item.rawValue)
                                    .frame(width: buttonWidth(item), height: buttonHeight(item))
                                    .font(.system(size: Constants.Buttons.fontSize, weight: Constants.Buttons.weight))
                                    .foregroundColor(item.textColor)
                                    .background(item.color)
                                    .cornerRadius(buttonHeight(item) / 2)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
    
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
    }

#Preview {
    CalculatorView()
}
