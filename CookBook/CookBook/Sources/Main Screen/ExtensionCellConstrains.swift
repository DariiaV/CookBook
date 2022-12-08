import UIKit

extension MyOwnCell {
    
    private func setupConstraintsCell() {
        
        titleRecipe.translatesAutoresizingMaskIntoConstraints = false
        imageRecipe.translatesAutoresizingMaskIntoConstraints = false
        favouritesButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleRecipe.topAnchor.constraint(equalTo: contentView.topAnchor,constant:.titleRecipeLabelTopAnchor),
            titleRecipe.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant:.titleRecipeLabelLeadingAnchor),
            titleRecipe.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant:.titleRecipeLabelTrailingAnchor),
            titleRecipe.heightAnchor.constraint(equalTo: contentView.heightAnchor,constant:.titleRecipeLabelHeightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageRecipe.topAnchor.constraint(equalTo: contentView.topAnchor,constant:.imageRecipeTopAnchor),
            imageRecipe.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant:.imageRecipeLeadingAnchor),
            imageRecipe.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant:.imageRecipeTrailingAnchor),
            imageRecipe.heightAnchor.constraint(equalTo: contentView.heightAnchor,constant:.imageRecipeHeightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            favouritesButton.topAnchor.constraint(equalTo: contentView.topAnchor,constant:.favouritesButtonLabelTopAnchor),
            favouritesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant:.favouritesButtonLabelLeadingAnchor),
            favouritesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant:.favouritesButtonLabelTrailingAnchor),
            favouritesButton.heightAnchor.constraint(equalTo: contentView.heightAnchor,constant:.favouritesButtonLabelHeightAnchor),
        ])
    }
    
    func setupCell() {
        contentView.addSubview(titleRecipe)
        contentView.addSubview(imageRecipe)
        contentView.addSubview(favouritesButton)
    }
    
    func configureView() {
        setupCell()
        setupConstraintsCell()
        
    }
}
