//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Peter on 17.01.2025.
//

import SwiftUI

@main
struct CalculatorApp: App {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(viewModel)
        }
    }
}
