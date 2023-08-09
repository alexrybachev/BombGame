//
//  DataDelegate.swift
//  SM8Bomb
//
//  Created by Aleksandr Rybachev on 08.08.2023.
//

import UIKit

class DataDelegate: NSObject, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell else { return }
        cell.checkButtonTapped()
        collectionView.reloadItems(at: [indexPath])
    }
    
}
