//
//  Button.swift
//  Calculator
//
//  Created by Peter on 17.01.2025.
//

import Foundation
import UIKit

enum Button: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case dec = ","
    case equal = "="
    case plus = "+"
    case minus = "-"
    case multiple = "×"
    case divide = "÷"
    case percent = "%"
    case negative = "+/-"
    case clear = "C"
    
    var color: UIColor {
        switch self {
        case .plus, .minus, .equal, .multiple, .divide:
            return UIColor(named: "OrangeConvert") ?? .orange
        case .clear, .negative, .percent:
            return UIColor(named: "LightGrayConvert") ?? .lightGray
        default:
            return UIColor(named: "GrayConvert") ?? .gray
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .clear, .negative, .percent:
            return .black
        default:
            return .white
        }
    }
}
