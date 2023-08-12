//
//  EndGameViewController.swift
//  SM8Bomb
//
//  Created by Артур  Арсланов on 10.08.2023.
//

import UIKit

class EndGameViewController: UIViewController {
    
    
    @IBOutlet weak var labelGame: UILabel!
    @IBOutlet weak var titleTask: UILabel!
    
    @IBOutlet weak var anotherTask: UIButton!
    @IBOutlet weak var startAgain: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        labelGame.text = "Проигравший выполняет задание"
        titleTask.text = DataManager.shared.getRandomPanishment()[0]
        
        setupNavBar("Игра")
        setupButton()
    }
    
    
    func setupButton(){
        startAgain.layer.cornerRadius = 40
        startAgain.layer.borderWidth = 1
        
        anotherTask.layer.cornerRadius = 40
        anotherTask.layer.borderWidth = 1
        
        // Shodow Button
        anotherTask.layer.shadowColor = UIColor.black.cgColor
        anotherTask.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        anotherTask.layer.shadowRadius = 5
        anotherTask.layer.shadowOpacity = 0.7
        
        startAgain.layer.shadowColor = UIColor.black.cgColor
        startAgain.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        startAgain.layer.shadowRadius = 5
        startAgain.layer.shadowOpacity = 0.7
    }
    
    @IBAction func anotherTaskButtonPressed(_ sender: UIButton) {
        titleTask.text = DataManager.shared.getRandomPanishment()[0]
    }
    
    @IBAction func startAgainButtonPressed(_ sender: UIButton) {
//        let rootVC = GameViewController()
//        rootVC.modalPresentationStyle = .fullScreen
//        self.navigationItem.title = ""
//        self.navigationController?.navigationBar.tintColor = .black
//        navigationController?.pushViewController(rootVC, animated: true)
        
        

    }
    
}
