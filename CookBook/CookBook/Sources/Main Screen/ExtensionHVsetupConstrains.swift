import UIKit

extension HeaderView {
    
    func setupView() {
        
        self.addSubview(welcomeTitle)
        self.addSubview(americanButton)
        self.addSubview(italianButton)
        self.addSubview(japaneseButton)
        self.addSubview(europeanButton)
    }
    
    func setupConstraints () {
        
        welcomeTitle.translatesAutoresizingMaskIntoConstraints = false
        americanButton.translatesAutoresizingMaskIntoConstraints = false
        italianButton.translatesAutoresizingMaskIntoConstraints = false
        japaneseButton.translatesAutoresizingMaskIntoConstraints = false
        europeanButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: .welcomeTitleTopAncor),
            welcomeTitle.heightAnchor.constraint(equalToConstant: .welcomeTitleHeightAnchor),
            welcomeTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor)])
        
        NSLayoutConstraint.activate([
            americanButton.topAnchor.constraint(equalTo: welcomeTitle.topAnchor, constant:.americanButtonTopAnchor),
            americanButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .americanButtonLeadingAnchor),
            americanButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .americanButtonTrailingAnchor),
            americanButton.heightAnchor.constraint(equalToConstant: .americanButtonHeightAnchor)])
        
        NSLayoutConstraint.activate([
            italianButton.topAnchor.constraint(equalTo: americanButton.topAnchor, constant:.italianButtonTopAnchor),
            italianButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .italianButtonLeadingAnchor),
            italianButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .italianButtonTrailingAnchor),
            italianButton.heightAnchor.constraint(equalToConstant: .italianButtonHeightAnchor)])
        
        NSLayoutConstraint.activate([
            japaneseButton.topAnchor.constraint(equalTo: welcomeTitle.topAnchor, constant:.japaneseButtonTopAnchor),
            japaneseButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .japeneseButtonLeadingAnchor),
            japaneseButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .japaneseButtonTrailingAnchor),
            japaneseButton.heightAnchor.constraint(equalToConstant: .japaneseButtonHeightAnchor)])
        
        NSLayoutConstraint.activate([
            europeanButton.topAnchor.constraint(equalTo: japaneseButton.topAnchor, constant:.greecButtonTopAnchor),
            europeanButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .greecButtonLeadingAnchor),
            europeanButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .greecButtonTrailingAnchor),
            europeanButton.heightAnchor.constraint(equalToConstant: .greecButtonHeightAnchor)])
        

            }
        
        func configureView() {
            setupView()
            setupConstraints()
        }
    }
    
    

