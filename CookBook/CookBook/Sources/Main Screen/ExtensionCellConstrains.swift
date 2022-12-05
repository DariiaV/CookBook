import UIKit

extension MyOwnCell {

    private func setupConstraintsCell() {

        titleRecipe.translatesAutoresizingMaskIntoConstraints = false
        imageRecipe.translatesAutoresizingMaskIntoConstraints = false
     
       
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

    }

    func setupCell() {
        contentView.addSubview(titleRecipe)
        contentView.addSubview(imageRecipe)
    }

    func configureView() {
        setupCell()
        setupConstraintsCell()

    }
}
