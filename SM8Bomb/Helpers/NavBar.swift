//
//  NavBar.swift
//  SM8Bomb
//
//  Created by Сергей П on 12.08.2023.
//

import UIKit

extension UIViewController {
    
    func setupNavBar(_ labelText:String) {
        let label = UILabel()
        label.text = labelText
        label.textColor = UIColor(named: "violetText")
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)

        navigationItem.titleView = label
    }
}
