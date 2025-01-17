//
//  CalculatorView.swift
//  Calculator
//
//  Created by Peter on 17.01.2025.
//

import SwiftUI

struct CalculatorView: View {
    
    let buttons: [[CalcButton]] = [
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
            
            VStack {
                // MARK: - Display
                HStack {
                    Spacer()
                    Text("0")
                        .foregroundColor(.white)
                        .font(.system(size: 90, weight: .light))
                }
                
                // MARK: - Buttons
                ForEach(buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { item in
                            Button {
                                // action
                            } label: {
                                Text(item.rawValue)
                                    .frame(width: 80, height: 80)
                                    .font(.system(size: 37, weight: .regular))
                                    .foregroundColor(item.textColor)
                                    .background(item.color)
                                    .cornerRadius(40)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CalculatorView()
}
