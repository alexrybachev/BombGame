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
    private var audioPlayer: AVAudioPlayer?
    private var pauseButtonPressed = false
    
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
    
    private lazy var textLabel: UILabel = {
        let element = UILabel()
        element.text = "Нажмите \"Запустить\" чтобы начать игру"
        element.textAlignment = .center
        element.numberOfLines = 3
        element.adjustsFontSizeToFitWidth = true
        element.font = UIFont.boldSystemFont(ofSize: 35)
        element.textColor = .violetColor
        return element
    }()
    
    private lazy var bombImage: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "bombSecond")
        element.backgroundColor = .clear
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private lazy var startButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Запустить", for: .normal)
        element.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        element.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        element.backgroundColor = .violetColor
        element.tintColor = .yellowColor
        element.layer.cornerRadius = 40
        element.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
        return element
    }()
    
    private lazy var leftNavButton: UIBarButtonItem = {
        let bar = UIBarButtonItem()
        bar.image = UIImage(systemName: "chevron.left")
        bar.style = .plain
        bar.target = self
        bar.action = #selector(leftNavButtonTapped)
        return bar
    }()
    
    private lazy var rightNavButton: UIBarButtonItem = {
        let bar = UIBarButtonItem()
        bar.image = UIImage(named: "pause")
        bar.style = .plain
        bar.target = self
        bar.action = #selector(rightNavButtonTapped)
        return bar
    }()
    
    // MARK: - Life View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientColor()
        setupNavBar("Игра")
        addNavButton()
        setConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopMusic()
        animationView.stop()
    }
    
    // MARK: - Private Methods
    
    private func addNavButton() {
        navigationItem.leftBarButtonItem = leftNavButton
        navigationItem.rightBarButtonItem = rightNavButton
        if #available(iOS 16.0, *) {
            navigationItem.rightBarButtonItem?.isHidden = true
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    @objc private func startButtonPressed() {
        startButton.isHidden = true
        textLabel.text = DataManager.shared.getRandomQuestion().first
        bombImage.isHidden = true
        frameView.isHidden = false
    }
    
    @objc private func pushButton(sender: UIButton) {
        if #available(iOS 16.0, *) {
            navigationItem.rightBarButtonItem?.isHidden = false
        } else {
            navigationItem.rightBarButtonItem = rightNavButton
        }
        playSound()
    }
    
    @objc func rightNavButtonTapped() {
        pauseButtonPressed.toggle()
        rightNavButton.image = pauseButtonPressed ? UIImage(named: "play") : UIImage(named: "pause")
        resumeSound()
    }
    
    @objc func leftNavButtonTapped() {
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
    private func playSound() {
        guard let url = Bundle.main.url(forResource: "wick_wick_exp", withExtension: "wav") else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.play()
            
        } catch {
            print("Error loading sounds: \(error.localizedDescription)")
        }
    }
    
    private func resumeSound() {
        if pauseButtonPressed {
            audioPlayer?.pause()
            animationView.pause()
        } else {
            audioPlayer?.play()
            animationView.play()
        }
    }
    
    private func stopMusic() {
        audioPlayer?.stop()
        animationView.stop()
    }
    
    @objc func somethingDoing() {
        print(#function)
    }
    
    deinit {
        print("deinit Game")
    }
}

// MARK: - AVAudioPlayerDelegate

extension GameViewController: AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        let endVC = EndGameViewController()
        endVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(endVC, animated: true)
    }
}

// MARK: - Set Constraints

extension GameViewController {
    private func setConstraints() {
        frameView.addSubview(animationView)
        view.addSubview(frameView)
        view.addSubview(textLabel)
        view.addSubview(startButton)
        view.addSubview(bombImage)
        
        bombImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(UIScreen.main.bounds.width - 40)
        }
        
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-40)
            make.width.equalTo(274)
            make.height.equalTo(79)
        }
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(329)
        }
        
        animationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        frameView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(UIScreen.main.bounds.width - 40)
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
