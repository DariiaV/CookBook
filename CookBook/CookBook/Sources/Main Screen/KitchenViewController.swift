import UIKit

// MARK: - Constant Constraints

extension CGFloat {
    
    static let headerViewHeightAnchor : CGFloat = -620
    static let myTableViewTrailingAnchor : CGFloat = 100
    static let myTableViewBottomAnchor : CGFloat = -0
}

class KitchenViewController: UIViewController  {
    
    let apiKey = "e6ffd13c724e49f49a0a32615528c596"
    
    //    var cookBookModel:CookBookElement? = nil
    
    
    // MARK: - Lifecycle
    
    let headerView = HeaderView()
    let myTableView = UITableView(frame: .zero, style: .plain)
    let cellScreen = MyOwnCell()

    var cookBookArray = [CookBookElement]()
//    var cookRecipes: CookBook2?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupConstraints()
        colorView ()
        makeRequest()
    }
    
    private func makeRequest() {
        let request = URLRequest(url:URL(string: "https://api.spoonacular.com/recipes/715538/information?apiKey=\(apiKey)&YOUR-API-KEY&includeNutrition=true")!)
        
        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
            if let data = data,
               
               let cookBook = try? JSONDecoder().decode(CookBookElement.self, from: data) {
                
                self.cookBookArray.append(cookBook)
//                print(self.cookBookArray.first)
               
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
            }
            print(error as Any)
            return
            
        }
        task.resume()
    
    }
}

// MARK: - TableViewDataSource,TableViewDelegate

extension KitchenViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cookBookArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? MyOwnCell  else {
            fatalError("Creating cell from HotelsListViewController failed")
            
            
        }
        cell.textLabel?.text = "\(indexPath.row+1).\(String(describing: cookBookArray[indexPath.row].title!))"
        
//        cell.detailTextLabel?.text = "\(cookBookArray[indexPath.row].title)"
        
        //        cell.textLabel?.text = items [indexPath.row]
        //        cell.setupContent(model: items[indexPath.row] )
        
        
        return cell
    }
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    print("таблица работает")
    
}
