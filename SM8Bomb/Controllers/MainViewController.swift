//
//  MainViewController.swift
//  SM8Bomb
//
//  Created by Сергей П on 09.08.2023.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func startButtonPressed(_ sender: UIButton) {
        let rootVC = GameViewController()
        rootVC.modalPresentationStyle = .fullScreen
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    @IBAction func categoryButtonPressed(_ sender: UIButton) {
        let rootVC = CategoryViewController()
        rootVC.modalPresentationStyle = .fullScreen
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        navigationController?.pushViewController(rootVC, animated: true)
//        present(rootVC, animated: true)
    }
    
    @IBAction func rulesButtonPressed(_ sender: UIButton) {
        let rootVC = RulesViewControllerTwo()
        rootVC.modalPresentationStyle = .fullScreen
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
}
