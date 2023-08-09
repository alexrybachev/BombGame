//
//  ViewController.swift
//  SM8Bomb
//
//  Created by Сергей П on 07.08.2023.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
    }


    @IBAction func nextButton(_ sender: UIButton) {
        let gameEndVC = GameEndViewController()
        navigationController?.pushViewController(gameEndVC, animated: true)
    }
    
    
}

