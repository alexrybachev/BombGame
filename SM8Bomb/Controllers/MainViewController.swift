//
//  MainViewController.swift
//  SM8Bomb
//
//  Created by Сергей П on 09.08.2023.
//

import UIKit
import SwiftUI
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    // Заголовок
    
    private lazy var titleGame: UILabel = {
        let label = UILabel()
        label.text = "Игра для компании"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 39, weight: .heavy)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        return label
    }()
    
    private lazy var nameGame: UILabel = {
        let label = UILabel()
        label.text = "БОМБА"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 60, weight: .heavy)
        label.textColor = .violetColor
        
        label.layer.shadowOffset = CGSize(width: 2, height: 4)
        label.layer.shadowColor = UIColor.lightGray.cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 1
        return label
    }()
    
    // Изображение
    
    private lazy var imageGame: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bombMain")
        return imageView
    }()
    
    // Кнопки
    
    private lazy var startButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Старт игры", for: .normal)
        button.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var continueButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Продолжить", for: .normal)
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var categoryButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Категории", for: .normal)
        button.addTarget(self, action: #selector(categoryButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    // кнопки для настроек и помощи
    
    private lazy var settingButton: CustomButton = {
        let button = CustomButton()
        button.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        button.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var rulesButton: CustomButton = {
        let button = CustomButton()
        button.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        button.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
#warning("Delete?")
    var startButtonStatus = true
    
    
    // MARK: - Life View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        
//        startButtonStatus = DataManager.shared.checkedIsSelectedStatus()
//        startButtonEnabled(startButtonStatus)
//
//        let leftNavBarItem = UIBarButtonItem()
//        leftNavBarItem.title = ""
//        navigationItem.leftBarButtonItem = leftNavBarItem
    }
    
    // MARK: - Methods
    
    @objc func startButtonPressed() {
        print(#function)
    }
    
    @objc func continueButtonTapped() {
        print(#function)
    }
    
    @objc func categoryButtonPressed() {
        print(#function)
    }
    
    @objc func rulesButtonPressed() {
        print(#function)
    }
    
    @objc func settingButtonTapped() {
        print(#function)
    }
    
    @objc func rulesButtonTapped() {
        print(#function)
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

// MARK: - Setup UI

extension MainViewController {
    
    private func setupUI() {
        view.setGradientColor()
        
        // заголовок
        
        view.addSubview(titleGame)
        titleGame.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(nameGame)
        nameGame.snp.makeConstraints { make in
            make.top.equalTo(titleGame.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        // изображение игры
        
        view.addSubview(imageGame)
        imageGame.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        // кнопки для настроек и помощи
        
        view.addSubview(settingButton)
        settingButton.snp.makeConstraints { make in
            make.width.height.equalTo(58)
            make.leading.bottom.equalToSuperview().inset(20)
        }
        
        view.addSubview(rulesButton)
        rulesButton.snp.makeConstraints { make in
            make.width.height.equalTo(58)
            make.trailing.bottom.equalToSuperview().inset(20)
        }
        
        // стэк кнопок
        
        buttonStack.addArrangedSubview(startButton)
        buttonStack.addArrangedSubview(continueButton)
        buttonStack.addArrangedSubview(categoryButton)
        view.addSubview(buttonStack)
        buttonStack.snp.makeConstraints { make in
            make.bottom.equalTo(settingButton.snp.top).offset(-20)
            make.width.equalTo(274)
            make.centerX.equalToSuperview()
        }
  
    }
}

