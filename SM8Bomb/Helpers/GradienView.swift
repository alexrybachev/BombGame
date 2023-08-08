//
//  GradienView.swift
//  SM8Bomb
//
//  Created by Aleksandr Rybachev on 07.08.2023.
//

import UIKit

extension UIView {
    
    func setGradientColor() {
        let topColor = #colorLiteral(red: 0.9667925239, green: 0.970928371, blue: 0.04086173326, alpha: 1)
        let bottomColor = #colorLiteral(red: 1, green: 0.7505164742, blue: 0.3823589981, alpha: 1)
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
