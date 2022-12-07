import UIKit

// MARK: - Constant Constraints

extension CGFloat {
    
    static let headerViewHeightAnchor : CGFloat = -620
    static let myTableViewTrailingAnchor : CGFloat = 100
    static let myTableViewBottomAnchor : CGFloat = -0
}

class KitchenViewController: UIViewController  {
    
    let headerView = HeaderView()
    let myTableView = UITableView()
    let cellScreen = MyOwnCell()
    var items: [CellModel] = []
    
    private var manager = RecipeManager()
    private var cuisineRecipes = [CuisineRecipe]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        headerView.delegate = self
        
        setupTableView()
        setupConstraints()
        colorView()
        
        manager.fetchCuisineRecipe(cuisine: .european)
    }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.tabBarController?.tabBar.isHidden = false
        }
    //    override func viewWillDisappear(_ animated: Bool) {
    //        super.viewWillDisappear(animated)
    //        self.tabBarController?.tabBar.isHidden = false
    //    }
}

extension KitchenViewController: UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cuisineRecipes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? MyOwnCell  else {
            fatalError("Creating cell from HotelsListViewController failed")
            
        }
        
        cell.titleRecipe.text = cuisineRecipes[indexPath.row].title
        
        self.manager.downloadImage(from:cuisineRecipes[indexPath.row].image!) { [weak self] image in
            DispatchQueue.main.async {
                cell.imageRecipe.image = image
            }
        }
        
        return cell
    }
    
}

extension KitchenViewController: UITableViewDelegate {
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVC = DetailViewController()
        detailVC.id = cuisineRecipes[indexPath.row].id
        navigationController?.pushViewController(detailVC, animated: true)
    }
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
    
    func didCuisinesRecipe(recipes: [CuisineRecipe]) {
        DispatchQueue.main.async { [weak self] in
            guard let self else {
                return
            }
            
            self.cuisineRecipes = recipes
            self.myTableView.reloadData()
            
        }
    }
    
    func didUpdateDetailRecipe(recipe: DetailRecipe) {
        
    }
}

extension KitchenViewController: HeaderViewDelegate {
    func didTapCuisineButton(cuisine: Cuisine) {
        manager.fetchCuisineRecipe(cuisine: cuisine)
    }
    
    
}
