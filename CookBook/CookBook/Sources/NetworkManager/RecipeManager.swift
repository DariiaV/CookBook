//
//  RecipeManager.swift
//  CookBook
//
//  Created by Дария Григорьева on 30.11.2022.
//

import UIKit

protocol RecipeManagerDelegate {
    func didUpdateDetailRecipe(recipe: DetailRecipe)
    func didFailWithError(error: String)
    func didCuisinesRecipe(recipes: [CuisineRecipe])
}

enum Cuisine: String {
    case american = "American"
    case italian = "Italian"
    case japanese = "Japanese"
    case european = "European"
}

struct RecipeManager {
    
    private enum RecipeType {
        case cuisine
        case detailRecipe
    }
    
    var delegate: RecipeManagerDelegate?
    
    private let cache = NSCache<NSString, UIImage>()
    private let recipeURL = "https://api.spoonacular.com/recipes/%@/information?includeNutrition=false&e6ffd13c724e49f49a0a32615528c596"
    private let cuisinesURL = "https://api.spoonacular.com/recipes/complexSearch?Cuisines=%@&e6ffd13c724e49f49a0a32615528c596"
    
    func fetchDetailRecipe(id: String?) {
        guard let id else {
            delegate?.didFailWithError(error: "Not correct recipe!")
            return
        }
        let urlString = String(format: recipeURL, id)
        performRequest(with: urlString, and: .detailRecipe)
    }
    
    func fetchCuisineRecipe(cuisine: Cuisine) {
        let urlString = String(format: cuisinesURL, cuisine.rawValue)
        performRequest(with: urlString, and: .cuisine)
    }
    
    private func performRequest(with urlString: String, and type: RecipeType) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, _, error in
                if let error {
                    self.delegate?.didFailWithError(error: error.localizedDescription)
                    return
                }
                if let safeData = data {
                    switch type {
                    case .cuisine:
                        let cuisine = self.parseCuisineJSON(safeData)
                        self.delegate?.didCuisinesRecipe(recipes: cuisine)
                        
                    case .detailRecipe:
                        if let recipe = self.parseDetailJSON(safeData) {
                            self.delegate?.didUpdateDetailRecipe(recipe: recipe)
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
    
    private func parseDetailJSON(_ data: Data) -> DetailRecipe? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(DetailRecipe.self, from: data)
            
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error.localizedDescription)
            return nil
        }
    }
    
    private func parseCuisineJSON(_ data: Data) -> [CuisineRecipe] {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CookBookRecipes.self, from: data)
           
            return decodedData.cuisineRecipes
        } catch {
            delegate?.didFailWithError(error: error.localizedDescription)
            return []
        }
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil,
                  let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
