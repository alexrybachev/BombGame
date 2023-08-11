//
//  Category.swift
//  SM8Bomb
//
//  Created by Aleksandr Rybachev on 10.08.2023.
//
import Foundation

struct Category {
    let nameCategory: String
    let imageCategory: String
    let questions: [String]
    var isSelected: Bool
}

extension Category {
    
    /// Формирует рандомно вопросы в зависимости от выбранной категории
    static func getRandomQuestion() -> [String] {
        let questions = DataManager.shared.categoriesData
            .filter { $0.isSelected == true }
            .reduce([]) { result, category in
                result + category.questions
            }
        
        return questions.shuffled()
    }
}
