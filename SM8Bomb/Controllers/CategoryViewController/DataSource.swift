//
//  DataSource.swift
//  SM8Bomb
//
//  Created by Aleksandr Rybachev on 07.08.2023.
//

import UIKit

class DataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: - Test Data
    
    private let categories = ["Спорт", "Хобби", "Про Жизнь", "Личности", "Искусство и Кино", "Природа"]
    private let categoryImages = ["Sport", "Hobby", "Life", "Person", "Cinema", "Nature"]
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.cellID,
                                                            for: indexPath) as? CategoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        let category = categories[indexPath.item]
        let image = categoryImages[indexPath.item]
        
        cell.configure(for: category, with: image)
        
        return cell
    }
    
    
    
}
