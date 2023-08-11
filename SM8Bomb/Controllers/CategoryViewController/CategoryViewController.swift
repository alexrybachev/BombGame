//
//  CategoryViewController.swift
//  SM8Bomb
//
//  Created by Aleksandr Rybachev on 07.08.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    // MARK: - PRivate Properties
    
    private let dataSource = DataSource()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.cellID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Initial
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        guard let cells = collectionView.visibleCells as? [CategoryCollectionViewCell] else { return }
        
        for cell in cells {
            guard let indexPath = collectionView.indexPath(for: cell) else { return }
            guard let currentImage = cell.checkButton.currentImage else { return }
            if currentImage == UIImage(systemName: "checkmark.circle.fill") {
                DataManager.shared.setupSelectionStatus(for: indexPath.item, with: true)
            } else {
                DataManager.shared.setupSelectionStatus(for: indexPath.item, with: false)
            }
        }
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.setGradientColor()
        
        collectionView.dataSource = dataSource
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
    }
    
    private func setupNavBar() {
        title = "Категории"
        
        let navBar = navigationController?.navigationBar
        
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 36, weight: .heavy)]
        
        navBar?.compactScrollEdgeAppearance = appearance
    }
    
    // MARK: - UICollectionViewLayout
    
    private func createLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.5))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
        
    }
    

}

