//
//  Name.swift
//  CookBook
//
//  Created by Дария Григорьева on 28.11.2022.
//
import UIKit

// MARK: - Constant Constraints

extension CGFloat {
    
    static let headerViewHeightAnchor : CGFloat = -620
    static let myTableViewTrailingAnchor : CGFloat = 100
    static let myTableViewBottomAnchor : CGFloat = -0
}

class MainViewController: UIViewController,UITextFieldDelegate  {
    
  
    // MARK: - Lifecycle
    
    let headerView = HeaderView()
    let myTableView = UITableView(frame: .zero, style: .plain)
    let cellScreen = MyOwnCell()
    
    var items = ["Здесь будут рецепты","Здесь будут рецепты","Здесь будут рецепты","Здесь будут рецепты","Здесь будут рецепты","Здесь будут рецепты","Здесь будут рецепты","Здесь будут рецепты","Здесь будут рецепты","Здесь будут рецепты","Здесь будут рецепты"]
//    var items: [CellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupConstraints()
        colorView ()
        
    }
    
    
}

// MARK: - TableViewDataSource,TableViewDelegate

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? MyOwnCell  else {
            fatalError("Creating cell from HotelsListViewController failed")
            
        }
        cell.textLabel?.text = items [indexPath.row]
//        cell.setupContent(model: items[indexPath.row] )

        
        return cell
    }
    
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    print("таблица работает")
    
}
