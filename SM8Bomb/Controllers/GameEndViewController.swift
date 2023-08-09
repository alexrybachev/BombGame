//
//  GameEndViewController.swift
//  SM8Bomb
//
//  Created by Артур  Арсланов on 08.08.2023.
//

import UIKit

class GameEndViewController: UIViewController {

    
    @IBOutlet weak var labelGame: UILabel!
    
    @IBOutlet weak var titleTask: UILabel!
    
    @IBOutlet weak var anotherTask: UIButton!
    @IBOutlet weak var startAgain: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelGame.text = "Проигравший выполняет \n задание"
        labelGame.font = UIFont(name: "DelaGothicOne-Regular", size: 24)
        
        titleTask.font = UIFont(name: "DelaGothicOne-Regular", size: 20)
        
        
        //setup button
        anotherTask.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 24)
        anotherTask.subtitleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 24)
        
        startAgain.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 24)
        startAgain.subtitleLabel?.font =  UIFont(name: "DelaGothicOne-Regular", size: 24)
        
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
        
        
        
        
        
        
        setupNavigationBar()
        
    }


    func setupNavigationBar() {
        // пробный вариант убрать фон
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "yellowText")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.lightText]
        appearance.shadowImage = UIImage()

        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        
        
        let label = UILabel()
        label.text = "Игра"
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 30)
        label.textColor = UIColor(named: "violetText")
        
        navigationItem.titleView = label
    }

}
