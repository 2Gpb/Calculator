//
//  CalculatorView.swift
//  Calculator
//
//  Created by Peter on 17.01.2025.
//

import SwiftUI

struct CalculatorView: View {
    // MARK: - ViewModel
    @EnvironmentObject var viewModel: CalculatorViewModel
    
    // MARK: - Constants
    private enum Constants {
        enum View {
            static let spacing: CGFloat = 12
            static let totalSpacing: CGFloat = 5 * spacing
        }
        
        enum Display {
            static let textColor: Color = .white
            static let fontSize: CGFloat = 84
            static let weight: Font.Weight = .regular
            static let padding: CGFloat = 28
            static let typePadding: Edge.Set = .trailing
            static let defaultValue: String = "0"
            static let alignment: Alignment = .trailing
            static let lineLimit: Int = 1
        }
        
        enum Buttons {
            static let fontSize: CGFloat = 36
            static let weight: Font.Weight = .regular
            static let numberButtonsInRow: CGFloat = 4
        }
    }
    
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
                    Text(viewModel.value)
                        .foregroundColor(Constants.Display.textColor)
                        .font(.system(size: Constants.Display.fontSize,
                                      weight: Constants.Display.weight)
                        )
                        .frame(width: UIScreen.main.bounds.width - Constants.Display.padding, alignment: Constants.Display.alignment)
                        .padding(Constants.Display.typePadding,
                                 Constants.Display.padding)
                        .lineLimit(Constants.Display.lineLimit)
                }
                
                // MARK: - Buttons
                ForEach(viewModel.buttons, id: \.self) { row in
                    HStack(spacing: Constants.View.spacing) {
                        ForEach(row, id: \.self) { button in
                            Button {
                                viewModel.didPressButton(button)
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
            return (UIScreen.main.bounds.width - Constants.View.totalSpacing) / Constants.Buttons.numberButtonsInRow
        }
    }
    
    private func buttonHeight(_ button: CalcButton) -> CGFloat {
        return (UIScreen.main.bounds.width - Constants.View.totalSpacing) / Constants.Buttons.numberButtonsInRow
    }
}

#Preview {
    CalculatorView()
        .environmentObject(CalculatorViewModel())
}
