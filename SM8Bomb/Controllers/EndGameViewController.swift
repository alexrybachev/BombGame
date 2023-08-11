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

        labelGame.text = "Проигравший выполняет \n задание"
        
        setupNavigationBar()
        setupButton()
    }

    func setupNavigationBar() {
        let label = UILabel()
        label.text = "Игра"
        label.textColor = UIColor(named: "violetText")
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        
        navigationItem.titleView = label
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
}
