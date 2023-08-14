//
//  CustomButton.swift
//  SM8Bomb
//
//  Created by Aleksandr Rybachev on 13.08.2023.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .violetColor
        
        
//        config.attributedTitle = .a
//        config.titleAlignment = .center
//        config.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        
        // form
        backgroundColor = .violetColor
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        
        // shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 2)
        
        // text
        tintColor = .yellow
        setTitleColor(.yellowColor, for: .normal)
        
        titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
