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
    
    static let titleRecipeLabelTopAnchor: CGFloat = 130
    static let titleRecipeLabelLeadingAnchor: CGFloat = 10
    static let titleRecipeLabelTrailingAnchor: CGFloat = -120
    static let titleRecipeLabelHeightAnchor : CGFloat = -85
    
}

class MyOwnCell: UITableViewCell  {
    
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
        favouritesButton.setTitle("European", for: .normal)
//        favouritesButton.addTarget(self, action: #selector(favouriteTapButton(_:)), for:.touchUpInside)
        favouritesButton.backgroundColor = .systemBlue
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

}


