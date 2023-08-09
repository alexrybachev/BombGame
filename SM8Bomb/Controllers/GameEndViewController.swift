//
//  GameEndViewController.swift
//  SM8Bomb
//
//  Created by Артур  Арсланов on 08.08.2023.
//

import UIKit

class GameEndViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        
    }


    func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
      
        
    }

}
