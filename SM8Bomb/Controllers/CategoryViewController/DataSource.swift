//
//  DataSource.swift
//  SM8Bomb
//
//  Created by Aleksandr Rybachev on 07.08.2023.
//

import UIKit

class DataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DataManager.shared.categoriesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.cellID,
                                                            for: indexPath) as? CategoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        let category = DataManager.shared.categoriesData[indexPath.item]
        print("status for button \(category.isSelected)")
        
        cell.configure(for: category.nameCategory, with: category.imageCategory, and: category.isSelected)
        print("cell button \(cell.checkButton.currentImage)")
        
        return cell
    }
    
}
