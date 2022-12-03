import UIKit

// MARK: - Constant Constraints

extension CGFloat {
    
    static let headerViewHeightAnchor : CGFloat = -620
    static let myTableViewTrailingAnchor : CGFloat = 100
    static let myTableViewBottomAnchor : CGFloat = -0
}

class KitchenViewController: UIViewController  {
    
    let apiKey = "e6ffd13c724e49f49a0a32615528c596"
    
    // MARK: - Lifecycle
    
    let headerView = HeaderView()
    let myTableView = UITableView(frame: .zero, style: .plain)
    let cellScreen = MyOwnCell()

    private var BestManager = BestRecipeManager()
    var cookBookArray = [CookBookElement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BestManager.delegate = self
        myTableView.delegate = self
        myTableView.dataSource = self
       
        
        setupTableView()
        setupConstraints()
        colorView ()
//        makeRequest()
    }
    
//    private func makeRequest() {
//        let request = URLRequest(url:URL(string: "https://api.spoonacular.com/recipes/6331/information?&apiKey=\(apiKey)")!)
//        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
//            if let data = data,
//
//               let cookBook = try? JSONDecoder().decode(CookBookElement.self, from: data) {
//
//                self.cookBookArray.append(cookBook)
//
//                DispatchQueue.main.async {
//                    self.myTableView.reloadData()
//                }
//            }
//            print(error as Any)
//            return
//
//        }
//        task.resume()
//
//    }
}

// MARK: - TableViewDataSource,TableViewDelegate

extension KitchenViewController: UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cookBookArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cookBookArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? MyOwnCell  else {
            fatalError("Creating cell from HotelsListViewController failed")
            
            
        }
        
        cell.textLabel?.text = "\(indexPath.row+1).\(String(describing: cookBookArray[indexPath.row].self))"

        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textAlignment = .justified
        
        return cell
    }
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    print("таблица работает")
    
}

extension KitchenViewController: RecipeManagerDelegate {
    
    // MARK: - RecipeManagerDelegate
    
    func didFailWithError(error: String) {
        let alertVC = UIAlertController(title: error, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alertVC.addAction(okAction)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alertVC, animated: true)
        }
    }
    
    func didUpdateRecipe(recipe: CookBook) {
        DispatchQueue.main.async { [weak self] in
            guard let self else {
                return
            }

//            self.titleRecipe.text = recipe.title
//
//            self.BestManager.downloadImage(from: recipe.image) { [weak self] image in
//                DispatchQueue.main.async {
//                    self?.image.image = image
                }
            }
        }
        
//    }
//}

