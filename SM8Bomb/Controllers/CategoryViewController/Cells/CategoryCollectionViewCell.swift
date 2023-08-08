//
//  CategoryCollectionViewCell.swift
//  SM8Bomb
//
//  Created by Aleksandr Rybachev on 07.08.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "CategoryCollectionViewCell"
    
    // MARK: - Privare Properties
    
    private lazy var titleCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .yellowText
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var checkButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseForegroundColor = .white
        configuration.baseBackgroundColor = .clear
        
        let button = UIButton(configuration: configuration)
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        backgroundColor = .violetText
        layer.cornerRadius = 50
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        
        layer.shadowRadius = 3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 1, height: 2)
        
        stackView.addArrangedSubview(categoryImageView)
        stackView.addArrangedSubview(titleCategoryLabel)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            
            titleCategoryLabel.heightAnchor.constraint(equalToConstant: 46)
        ])
        
        contentView.addSubview(checkButton)
        NSLayoutConstraint.activate([
            checkButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            checkButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            checkButton.widthAnchor.constraint(equalToConstant: 40),
            checkButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    // MARK: - Configure Cell
    func configure(for category: String, with image: String) {
        titleCategoryLabel.text = category
        categoryImageView.image = UIImage(named: image)
    }
    
    
}
