//
//  Name.swift
//  CookBook
//
//  Created by Дария Григорьева on 28.11.2022.
//

import UIKit

final class DetailViewController: UIViewController {

    //MARK: - UIElements

    var id: String?
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "patato")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Жареная картошечка с укропом и лисичками"
        label.font = .systemFont(ofSize: 21)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var descriptionLabel: UILabel = {
           let label = UILabel()
           label.text = "чистим жарим кушаем"
           label.textAlignment = .left
           label.numberOfLines = 10
           label.backgroundColor = .red
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()

    private var manager = RecipeManager()
    private var ingredient = [Ingredient]()
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupHierarchy()
        setupLayout()
        setupView()
        manager.delegate = self
        id = "715594"
        manager.fetchRecipe(id: id)
    }

    // MARK: - Setups

    func setupView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupHierarchy() {
        view.addSubview(image)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(tableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: 260),

            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor),

            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -97),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

    var lpol = ["11", "22", "33", "44", "55", "66"]

}

extension DetailViewController: RecipeManagerDelegate {
    
    // MARK: - RecipeManagerDelegate
    
    func didFailWithError(error: String) {
        let alertVC = UIAlertController(title: error, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alertVC.addAction(okAction)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alertVC, animated: true)
        }
    }
    
    func didUpdateRecipe(recipe: DetailRecipe) {
        DispatchQueue.main.async { [weak self] in
            guard let self else {
                return
            }

            self.ingredient = recipe.extendedIngredients
            self.nameLabel.text = recipe.title
            
            self.manager.downloadImage(from: recipe.image) { [weak self] image in
                DispatchQueue.main.async {
                    self?.image.image = image
                }
            }
        }
    }
}

    //MARK: - UITableViewDataSource, UITableViewDelegate

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lpol.count
        //ingredient.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let lol = lpol[indexPath.row]
        cell.textLabel?.text = lol
        //let ingredient = ingredient[indexPath.row]
        //cell.textLabel?.text = ingredient.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
}
