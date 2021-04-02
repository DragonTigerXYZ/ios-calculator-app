//
//  CalculatorButton.swift
//  Calculator
//
//  Created by YB on 2021/04/02.
//

import UIKit

@IBDesignable
class CalculatorButton: UIButton {

    
    override func draw(_ rect: CGRect) {
        // Drawing code
        layer.cornerRadius = rect.height / 2
        clipsToBounds = true
    }
}
