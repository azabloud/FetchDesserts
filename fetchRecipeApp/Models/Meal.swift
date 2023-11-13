//
//  Meal.swift
//  fetchRecipeApp
//
//  Created by Adam Zabloudil on 11/13/23.
//

import Foundation

struct MealList: Codable {
    var meals: [Meal]
}

struct Meal: Codable, Identifiable {
    var id: String { idMeal }
    var idMeal: String
    var strMeal: String
}

struct MealDetail: Codable {
    var meals: [MealInfo]
}

struct MealInfo: Codable {
    var strMeal: String
    var strInstructions: String
    var strMealThumb: String?
    var strCategory: String?
    var strArea: String?
    var strTags: String?
    var strYoutube: String?
    var strSource: String?

    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?

    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?

    func ingredient(for index: Int) -> String? {
        switch index {
        case 1: return strIngredient1
        case 2: return strIngredient2
        case 3: return strIngredient3
        case 4: return strIngredient4
        case 5: return strIngredient5
        case 6: return strIngredient6
        case 7: return strIngredient7
        case 8: return strIngredient8
        case 9: return strIngredient9
        case 10: return strIngredient10
        case 11: return strIngredient11
        case 12: return strIngredient12
        case 13: return strIngredient13
        case 14: return strIngredient14
        case 15: return strIngredient15
        case 16: return strIngredient16
        case 17: return strIngredient17
        case 18: return strIngredient18
        case 19: return strIngredient19
        case 20: return strIngredient20
        default: return nil
        }
    }

    func measure(for index: Int) -> String? {
        switch index {
        case 1: return strMeasure1
        case 2: return strMeasure2
        case 3: return strMeasure3
        case 4: return strMeasure4
        case 5: return strMeasure5
        case 6: return strMeasure6
        case 7: return strMeasure7
        case 8: return strMeasure8
        case 9: return strMeasure9
        case 10: return strMeasure10
        case 11: return strMeasure11
        case 12: return strMeasure12
        case 13: return strMeasure13
        case 14: return strMeasure14
        case 15: return strMeasure15
        case 16: return strMeasure16
        case 17: return strMeasure17
        case 18: return strMeasure18
        case 19: return strMeasure19
        case 20: return strMeasure20
        default: return nil
        }
    }
    
    var capitalizedIngredients: [String] {
        var ingredients = [String]()

        for index in 1...20 {
            if let ingredient = ingredient(for: index), !ingredient.isEmpty {
                ingredients.append(ingredient.capitalized)
            }
        }

        return ingredients
    }
}
