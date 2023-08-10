//
//  GameViewController.swift
//  SM8Bomb
//
//  Created by Леонид Турко on 09.08.2023.
//

import UIKit
import SnapKit
import SwiftUI
import Lottie


class GameViewController: UIViewController {
  
  private lazy var frameView: UIView = {
    let element = UIView()
    element.isHidden = true
    return element
  }()
  
  private lazy var animationView: LottieAnimationView = {
    var element = LottieAnimationView()
    element = .init(name: "bombAnimation")
    element.contentMode = .scaleAspectFill
    element.loopMode = .loop
    element.animationSpeed = 0.5
    element.play()
    return element
  }()
  
  private lazy var backgroundColor: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "background")
    element.contentMode = .scaleAspectFill
    return element
  }()
  
  private lazy var textLabel: UILabel = {
    let element = UILabel()
    element.text = "Нажмите \"Запустить\" чтобы начать игру"
    element.textAlignment = .center
    element.numberOfLines = 3
    element.font = UIFont.boldSystemFont(ofSize: 35)
    element.textColor = .violetText
    return element
  }()
  
  private lazy var bombImage: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "bombSecond")
    element.backgroundColor = .clear
    return element
  }()
  
  private lazy var startButton: UIButton = {
    let element = UIButton(type: .system)
    element.setTitle("Запустить", for: .normal)
    element.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
    element.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    element.backgroundColor = .violetText
    element.tintColor = .yellowText
    element.layer.cornerRadius = 40
    return element
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
      setConstraints()
    }
  
  @objc private func startButtonPressed() {
    startButton.isHidden = true
    textLabel.text = "Назовите вид зимнего спорта"
    bombImage.isHidden = true
    frameView.isHidden = false
  }
}

extension GameViewController {
  private func setConstraints() {
    frameView.addSubview(animationView)
    view.addSubview(backgroundColor)
    view.addSubview(frameView)
    view.addSubview(textLabel)
    view.addSubview(startButton)
    view.addSubview(bombImage)
    
    
    bombImage.snp.makeConstraints { make in
      make.left.equalTo(74)
      make.top.equalTo(223)
      make.height.equalTo(352)
      make.width.equalTo(312)
    }
    
    startButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(669)
      make.width.equalTo(274)
      make.height.equalTo(79)
    }
    
    textLabel.snp.makeConstraints { make in
      make.top.equalTo(127)
      make.centerX.equalToSuperview()
      make.width.equalTo(329)
    }
    
    animationView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    frameView.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
      make.width.height.equalTo(400)
    }
    
    backgroundColor.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}

//  MARK: - Show Canvas
struct ContentViewController: UIViewControllerRepresentable {
  
  typealias UIViewControllerType = GameViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    return GameViewController()
  }
  
  func updateUIViewController(_ uiViewController: GameViewController, context: Context) {}
}

struct ContentViewController_Previews: PreviewProvider {
  static var previews: some View {
    ContentViewController()
      .edgesIgnoringSafeArea(.all)
      .colorScheme(.light) // or .dark
  }
}
