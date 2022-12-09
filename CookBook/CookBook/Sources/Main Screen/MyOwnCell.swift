//
//  MyOwnCell.swift
//  CookBook
//
//  Created by Александр Косяков on 08.12.2022.
//

import UIKit

// MARK: - Constant Constraints

extension CGFloat {
    static let imageRecipeTopAnchor: CGFloat = 20
    static let imageRecipeLeadingAnchor: CGFloat = 80
    static let imageRecipeTrailingAnchor: CGFloat = -180
    static let imageRecipeHeightAnchor: CGFloat = -70
    
    static let titleRecipeLabelTopAnchor: CGFloat = 130
    static let titleRecipeLabelLeadingAnchor: CGFloat = 10
    static let titleRecipeLabelTrailingAnchor: CGFloat = -120
    static let titleRecipeLabelHeightAnchor : CGFloat = -85
    
    static let favouritesButtonLabelTopAnchor: CGFloat = 16
    static let favouritesButtonLabelLeadingAnchor: CGFloat = 330
    static let favouritesButtonLabelTrailingAnchor: CGFloat = -130
    static let favouritesButtonLabelHeightAnchor : CGFloat = -200
    
}

final class MyOwnCell: UITableViewCell  {
    
    private var countTap = 0
    var model: CuisineRecipe
    
    
    func setModel(cuisineRecipe: CuisineRecipe) {
        model = cuisineRecipe
    }
    
    lazy var imageRecipe : UIImageView = {
        let imageRecipe = UIImageView ()
        imageRecipe.backgroundColor = .red
        imageRecipe.contentMode = .scaleAspectFill
        return imageRecipe
    }()
    
    lazy var titleRecipe : UILabel = {
        let titleRecipe = UILabel()
        titleRecipe.font = UIFont.systemFont(ofSize: 14)
        titleRecipe.font = UIFont.boldSystemFont(ofSize: 14)
        titleRecipe.numberOfLines = 10
        titleRecipe.textAlignment = .justified
        titleRecipe.textAlignment = .center
        titleRecipe.textColor = .black
        return titleRecipe
    } ()
    
    lazy var favouritesButton : UIButton = {
        let favouritesButton = UIButton ()
        favouritesButton.setImage(UIImage(named: "star(base).png"), for: .normal)
        favouritesButton.setImage(UIImage(named: "star.png"), for: .selected)
        favouritesButton.setTitleColor(UIColor.black, for: .normal)
        favouritesButton.addTarget(self, action: #selector(favouritesTapButton(_:)), for:.touchUpInside)
        return favouritesButton
    }()
    
    // MARK: - Castomize Cell
    
    func castomizeCell () {
        
        contentView.backgroundColor = UIColor(red: 240/255, green: 235/255, blue: 231/255, alpha: 1)
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1
    }
    
    func setupContent(model: CellModel) {
        
    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        castomizeCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func favouritesTapButton(_ sender: UIButton!) {
        var addedFavourite = ""
        countTap += 1
        
        if countTap % 2 != 0 {
            addedFavourite = ("Добавлено в избранное")
            print(addedFavourite)
            favouritesButton.isSelected = true
            model.isFavorit = true
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            if (appDelegate.favoriteRecipes.contains(where: model.isFavorit {
                appDelegate.favoriteRecipes.append(model)
            print(appDelegate.favoriteRecipes[0])
            // добавить проверку содержания элемента в массиве
            
            } else {
            //удалять элемент из массива appDelegate.favoriteRecipes
            addedFavourite = ("Удаленно из избранного")
            print(addedFavourite)
            favouritesButton.isSelected = false
            model.isFavorit = false
            appDelegate.favoriteRecipes.remove(at: model)
        }

    }
}
}
