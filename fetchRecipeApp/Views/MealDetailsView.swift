//
//  MealDetailsView.swift
//  fetchRecipeApp
//
//  Created by Adam Zabloudil on 11/13/23.
//

import SwiftUI

struct MealDetailView: View {
    var mealId: String
    @State private var mealDetail: MealInfo?
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        Group {
            if isLoading {
                Text("Loading...")
            } else if let mealDetail = mealDetail {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        if let imageURL = mealDetail.strMealThumb, let url = URL(string: imageURL) {
                            AsyncImage(url: url) { image in
                                image.resizable()
                                     .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 200)
                            .cornerRadius(8)
                        }

                        Text(mealDetail.strMeal)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        VStack(alignment: .leading) {
                            Text("Ingredients").font(.headline)
                            ForEach(1...20, id: \.self) { index in
                                if let ingredient = mealDetail.ingredient(for: index)?.capitalized,
                                   let measure = mealDetail.measure(for: index) {
                                    if ingredient != "" {
                                        Text("\(ingredient): \(measure)")
                                    }
                                }
                            }
                        }

                        Text("Instructions")
                            .font(.headline)

                        Text(mealDetail.strInstructions)
                            .font(.body)
                        
                    }
                    .padding()
                }
            } else if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
            }
        }
        .onAppear {
            fetchMealDetails()
        }
        .navigationBarTitle("Fetch Desserts", displayMode: .inline)
    }

    private func fetchMealDetails() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") else {
            self.errorMessage = "Invalid URL"
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                self.isLoading = false

                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }

                guard let data = data else {
                    self.errorMessage = "No data received"
                    return
                }

                do {
                    let mealDetailResponse = try JSONDecoder().decode(MealDetail.self, from: data)
                    self.mealDetail = mealDetailResponse.meals.first {
                        !$0.strMeal.isEmpty && !$0.strInstructions.isEmpty
                    }
                } catch {
                    self.errorMessage = "Failed to decode response"
                }
            }
        }.resume()
    }
}
