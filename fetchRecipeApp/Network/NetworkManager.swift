//
//  NetworkManager.swift
//  fetchRecipeApp
//
//  Created by Adam Zabloudil on 11/13/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    func fetchMeals(completion: @escaping (MealList?) -> Void) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }

            do {
                var mealList = try JSONDecoder().decode(MealList.self, from: data)
                mealList.meals = mealList.meals.filter { !$0.strMeal.isEmpty }
                DispatchQueue.main.async {
                    completion(mealList)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
}
