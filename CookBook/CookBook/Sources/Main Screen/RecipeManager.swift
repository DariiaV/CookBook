//
//  RecipeManager.swift
//  CookBook
//
//  Created by Дария Григорьева on 30.11.2022.
//

import UIKit

protocol RecipeManagerDelegate {
    func didUpdateRecipe(recipe: CookBook)
    func didFailWithError(error: String)
}

struct RecipeManager {
    
    var delegate: RecipeManagerDelegate?
    
    private let cache = NSCache<NSString, UIImage>()
    private let recipeURL = "https://api.spoonacular.com/recipes/%@/information?includeNutrition=false&apiKey=e6ffd13c724e49f49a0a32615528c596"
    
    func fetchRecipe(id: String?) {
        guard let id else {
            delegate?.didFailWithError(error: "Not correct recipe!")
            return
        }
        let urlString = String(format: recipeURL, id)
        performRequest(with: urlString)
    }
    
    private func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, _, error in
                if let error {
                    self.delegate?.didFailWithError(error: error.localizedDescription)
                    return
                }
                if let safeData = data {
                    if let recipe = self.parseJSON(safeData) {
                        self.delegate?.didUpdateRecipe(recipe: recipe)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    private func parseJSON(_ weatherData: Data) -> CookBook? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CookBook.self, from: weatherData)
            
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error.localizedDescription)
            return nil
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
