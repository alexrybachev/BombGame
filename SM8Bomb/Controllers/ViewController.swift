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
        // Do any additional setup after loading the view.
    }

    @IBAction func taaped(_ sender: UIButton) {
        let vc = CategoryViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

