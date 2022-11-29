
import UIKit

class Name3: UIViewController {
    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupButton()
        view.backgroundColor = .systemBackground
        title = "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
        //        createView1Constraint()
    }
//    func setupButton() {
//        view.addSubview(nextButton)
//
//        nextButton.configuration = .filled()
//        nextButton.configuration?.baseBackgroundColor = .systemCyan
//        nextButton.configuration?.title = "Next"
//
//        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
//
//        nextButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            nextButton.widthAnchor.constraint(equalToConstant: 200),
//            nextButton.heightAnchor.constraint(equalToConstant: 50)])
//
    }




