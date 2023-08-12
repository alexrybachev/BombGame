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
import AVFoundation

class GameViewController: UIViewController {
  
  private var audioPlayers: [AVAudioPlayer] = []
  
  private lazy var frameView: UIView = {
    let element = UIView()
    element.isHidden = true
    return element
  }()
  
  private lazy var animationView: LottieAnimationView = {
    var element = LottieAnimationView()
    element = .init(name: "bombAnimation")
    element.contentMode = .scaleAspectFill
    element.animationSpeed = 0.2492
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
    element.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
    return element
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Игра"
    setConstraints()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    stopMusic()
    animationView.stop()
  }
  
    func stopMusic() {
        audioPlayers.forEach { $0.stop() }
        animationView.stop()
    }
    
  @objc private func startButtonPressed() {
    startButton.isHidden = true
    textLabel.text = "Назовите вид зимнего спорта"
    bombImage.isHidden = true
    frameView.isHidden = false
  }
  
  @objc private func pushButton(sender: UIButton) {
    playSound()
    playNextSound(index: 0)
  }
  
  private func playSound() {
    guard let urlOne = Bundle.main.url(forResource: "wick", withExtension: "wav"),
          let urlTwo = Bundle.main.url(forResource: "wick", withExtension: "wav"),
          let urlThree = Bundle.main.url(forResource: "exp", withExtension: "wav") else { return }

    do {
      let audioOne = try AVAudioPlayer(contentsOf: urlOne)
      let audioTwo = try AVAudioPlayer(contentsOf: urlTwo)
      let audioThree = try AVAudioPlayer(contentsOf: urlThree)
      audioPlayers = [audioOne, audioTwo, audioThree]
      audioPlayers.forEach { $0.prepareToPlay() }
      
    } catch {
      print("Error loading sounds: \(error.localizedDescription)")
    }
  }
  
  private func playNextSound(index: Int) {
    guard index < audioPlayers.count else {
      let endVC = EndGameViewController()
      endVC.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(endVC, animated: true)
      return
    }
    let audioPlayer = audioPlayers[index]
    audioPlayer.play()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + audioPlayer.duration) { [weak self] in
      guard self == self else { return }
      self?.playNextSound(index: index + 1)
    }
  }
  
  deinit {
    print("Game")
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
