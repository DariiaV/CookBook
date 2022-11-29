import UIKit


class MyOwnCell: UITableViewCell  {
    

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
        
//        configureView()
        castomizeCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
}


