import UIKit

// MARK: - Constant Constraints

extension CGFloat {
    
    static let titleRecipeLabelTopAnchor: CGFloat = 7
    static let titleRecipeLabelLeadingAnchor: CGFloat = 17
    static let titleRecipeLabelTrailingAnchor: CGFloat = -250
    static let titleRecipeLabelHeightAnchor : CGFloat = -75
    
    static let imageRecipeTopAnchor: CGFloat = 70
    static let imageRecipeLeadingAnchor: CGFloat = 17
    static let imageRecipeTrailingAnchor: CGFloat = -250
    static let imageRecipeHeightAnchor: CGFloat = -75
    
 
}

class MyOwnCell: UITableViewCell  {
    
    lazy var titleRecipe : UILabel = {
        let titleRecipe = UILabel()
        titleRecipe.text = "1"
        titleRecipe.font = UIFont.systemFont(ofSize: 30)
        titleRecipe.font = UIFont.boldSystemFont(ofSize: 30.0)
//        titleRecipe.textAlignment = .center
        titleRecipe.textColor = .black
        return titleRecipe
    } ()
    
    lazy var imageRecipe : UIImageView = {
        let imageRecipe = UIImageView ()
        imageRecipe.image = UIImage(named: "")
        imageRecipe.contentMode = .scaleAspectFill
        return imageRecipe
    }()
    
  
    // MARK: - Castomize Cell
    
    func castomizeCell () {
        
        contentView.backgroundColor = .clear
        contentView.layer.borderColor = UIColor.blue.cgColor
//        contentView.layer.cornerRadius = 50
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
    
  
    
}


