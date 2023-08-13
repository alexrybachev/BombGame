//
//  MainViewController.swift
//  SM8Bomb
//
//  Created by Сергей П on 09.08.2023.
//

import UIKit

class MainViewController: UIViewController {

   
    @IBOutlet weak var startButton: UIButton!
    
    var startButtonStatus = true
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        startButtonStatus = DataManager.shared.checkedIsSelectedStatus()
        startButtonEnabled(startButtonStatus)
        
        let leftNavBarItem = UIBarButtonItem()
        leftNavBarItem.title = ""
        navigationItem.leftBarButtonItem = leftNavBarItem
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
    }
    
    @IBAction func rulesButtonPressed(_ sender: UIButton) {
        let rootVC = RulesViewController()
        rootVC.modalPresentationStyle = .fullScreen
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    func startButtonEnabled(_ enabled: Bool) -> () {
        if enabled {
            startButton.isHighlighted = false
            startButton.isEnabled = true
        } else {
            startButton.isHighlighted = true
            startButton.isEnabled = false
        }
    }
    
    deinit {
        print("deinit MainVC")
    }
    
}
