//
//  MealListView.swift
//  fetchRecipeApp
//
//  Created by Adam Zabloudil on 11/13/23.
//

import SwiftUI

struct MealListView: View {
    @State private var meals = [Meal]()
    @State private var searchText = ""
    
    var filteredMeals: [Meal] {
        if searchText.isEmpty {
            return meals
        } else {
            return meals.filter { $0.strMeal.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        List(filteredMeals) { meal in
            NavigationLink(destination: MealDetailView(mealId: meal.idMeal)) {
                Text(meal.strMeal)
            }
        }
        .searchable(text: $searchText, prompt: "Search Desserts")
        .navigationTitle("Fetch Desserts")
        .onAppear {
            NetworkManager.shared.fetchMeals { mealList in
                self.meals = mealList?.meals.sorted { $0.strMeal < $1.strMeal } ?? []
            }
        }
    }
}
