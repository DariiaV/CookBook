import UIKit

extension CGFloat {
    
    static let imageViewButtonTopAnchor: CGFloat = 250
    static let imageViewButtonLeadingAnchor: CGFloat = 0
    static let imageViewButtonTrailingAnchor: CGFloat = -0
    static let imageViewButtonHeightAnchor : CGFloat = 1

    static let nextButtonTopAnchor: CGFloat = 410
    static let nextButtonLeadingAnchor: CGFloat = 40
    static let nextButtonTrailingAnchor: CGFloat = -40
    static let nextButtonHeightAnchor : CGFloat = 60
    
    static let commandLabelTopAnchor: CGFloat = 310
    static let commandLabelLeadingAnchor: CGFloat = 40
    static let commandLabelTrailingAnchor: CGFloat = -40
    static let commandLabelHeightAnchor : CGFloat = 60
    
    
    
}

class FistScreenViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewFistScreen()
        view.backgroundColor = UIColor(red: 60/255, green: 64/255, blue: 63/255, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
//        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    lazy var nextButton : UIButton = {
        
        let nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 244/255, green: 201/255, blue: 70/255, alpha: 1)
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        nextButton.setTitle("Start cooking  -> -> -> ", for: .normal)
        nextButton.setTitleColor(UIColor.black, for: .normal)
        nextButton.layer.cornerRadius = 14
        return nextButton
    } ()
    
    lazy var commandLabel : UILabel = {
        let commandLabel = UILabel()
        commandLabel.text = "КОМАНДА №2"
        commandLabel.font = UIFont.systemFont(ofSize: 30)
        commandLabel.font = UIFont.boldSystemFont(ofSize: 30)
        commandLabel.backgroundColor = UIColor(red: 244/255, green: 201/255, blue: 70/255, alpha: 1)
        commandLabel.numberOfLines = 10
        commandLabel.textAlignment = .justified
        commandLabel.textAlignment = .center
        commandLabel.textColor = .black
        return commandLabel
    } ()
    lazy var imageViewFirstScreen : UIImageView = {
        let imageViewFirstScreen = UIImageView()
        imageViewFirstScreen.image = UIImage(named: "cooking")
        imageViewFirstScreen.contentMode = .scaleAspectFill
        imageViewFirstScreen.contentMode = .scaleAspectFill
        
        return imageViewFirstScreen
    } ()
    
    @objc func goToNextScreen() {
        
        let nextScreen = KitchenViewController()
        nextScreen.modalPresentationStyle = .fullScreen
        self.present(nextScreen, animated: true)
        print("Start cooking")

      
   
//        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
}

extension FistScreenViewController {
    
    private func setupConstraintsFirstScreen() {
        
        imageViewFirstScreen.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        commandLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageViewFirstScreen.topAnchor.constraint(equalTo: view.topAnchor, constant:.imageViewButtonTopAnchor),
            imageViewFirstScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .imageViewButtonLeadingAnchor),
            imageViewFirstScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .imageViewButtonTrailingAnchor),
            imageViewFirstScreen.heightAnchor.constraint(equalToConstant: .imageViewButtonHeightAnchor)
        ])
        NSLayoutConstraint.activate([
            commandLabel.topAnchor.constraint(equalTo: imageViewFirstScreen.bottomAnchor, constant:.commandLabelTopAnchor),
            commandLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .commandLabelLeadingAnchor),
            commandLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .commandLabelTrailingAnchor),
            commandLabel.heightAnchor.constraint(equalToConstant: .commandLabelHeightAnchor)
        ])
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: imageViewFirstScreen.bottomAnchor, constant:.nextButtonTopAnchor),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .nextButtonLeadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .nextButtonTrailingAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: .nextButtonHeightAnchor)
        ])
        
      
    }
    
    func setupFirstScreen() {
        view.addSubview(nextButton)
        view.addSubview(imageViewFirstScreen)
        view.addSubview(commandLabel)
        
    }
    
    func configureViewFistScreen() {
        setupFirstScreen()
        setupConstraintsFirstScreen()
        
    }
}

