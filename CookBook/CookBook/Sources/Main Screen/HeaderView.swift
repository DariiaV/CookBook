//
//  HeadeView.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 13.11.2022.
//

protocol HeaderViewDelegate: AnyObject {
    func didTapCuisineButton(cuisine: Cuisine)
}

import UIKit

// MARK: - Constant Constraints

extension CGFloat {
    
    static let welcomeTitleTopAncor: CGFloat = 40
    static let welcomeTitleHeightAnchor: CGFloat = 80.0
    
    static let americanButtonTopAnchor: CGFloat = 70
    static let americanButtonLeadingAnchor: CGFloat = 10
    static let americanButtonTrailingAnchor: CGFloat = -210
    static let americanButtonHeightAnchor : CGFloat = 50
    
    static let italianButtonTopAnchor: CGFloat = 60
    static let italianButtonLeadingAnchor: CGFloat = 10
    static let italianButtonTrailingAnchor: CGFloat = -210
    static let italianButtonHeightAnchor : CGFloat = 50
    
    static let japaneseButtonTopAnchor: CGFloat = 70
    static let japeneseButtonLeadingAnchor: CGFloat = 210
    static let japaneseButtonTrailingAnchor: CGFloat = -10
    static let japaneseButtonHeightAnchor : CGFloat = 50
    
    static let greecButtonTopAnchor: CGFloat = 60
    static let greecButtonLeadingAnchor: CGFloat = 210
    static let greecButtonTrailingAnchor: CGFloat = -10
    static let greecButtonHeightAnchor : CGFloat = 50
}

class HeaderView : UIView {
    
    weak var delegate: HeaderViewDelegate?
    
    // MARK: - Customize
    
    lazy var welcomeTitle : UILabel = {
        let welcomeTitle = UILabel()
        welcomeTitle.text = "Выбор кухни:"
        welcomeTitle.font = UIFont.systemFont(ofSize: 30)
        welcomeTitle.font = UIFont.boldSystemFont(ofSize: 30.0)
        welcomeTitle.textAlignment = .center
        welcomeTitle.textColor = .black
        return welcomeTitle
    } ()
    
    lazy var americanButton : UIButton = {
        let americanButton = UIButton ()
        americanButton.setTitle("American", for: .normal)
        americanButton.setTitleColor(UIColor.black, for: .normal)
        americanButton.layer.cornerRadius = 14
        americanButton.tag = 0
        americanButton.addTarget(self, action: #selector(didTapButton(_:)), for:.touchUpInside)
        americanButton.layer.masksToBounds = true
        americanButton.layer.cornerRadius = 20
        americanButton.layer.borderWidth = 1
        americanButton.layer.borderColor = UIColor.blue.cgColor
        americanButton.backgroundColor = .red
        return americanButton
    }()
    
    lazy var italianButton : UIButton = {
        let italianButton = UIButton ()
        italianButton.setTitle("Italian", for: .normal)
        italianButton.setTitleColor(UIColor.black, for: .normal)
        italianButton.layer.cornerRadius = 14
        italianButton.tag = 1
        italianButton.addTarget(self, action: #selector(didTapButton(_:)), for:.touchUpInside)
        italianButton.layer.masksToBounds = true
        italianButton.layer.cornerRadius = 20
        italianButton.layer.borderWidth = 1
        italianButton.layer.borderColor = UIColor.blue.cgColor
        italianButton.backgroundColor = .yellow
        return italianButton
    }()
    
    lazy var japaneseButton : UIButton = {
        let japaneseButton = UIButton ()
        japaneseButton.setTitle("Japanese", for: .normal)
        japaneseButton.setTitleColor(UIColor.black, for: .normal)
        japaneseButton.layer.cornerRadius = 14
        japaneseButton.tag = 2
        japaneseButton.addTarget(self, action: #selector(didTapButton(_:)), for:.touchUpInside)
        japaneseButton.layer.masksToBounds = true
        japaneseButton.layer.cornerRadius = 20
        japaneseButton.layer.borderWidth = 1
        japaneseButton.layer.borderColor = UIColor.blue.cgColor
        japaneseButton.backgroundColor = .white
        return japaneseButton
    }()
    
    lazy var europeanButton : UIButton = {
        let europeanButton = UIButton ()
        europeanButton.setTitle("European", for: .normal)
        europeanButton.setTitleColor(UIColor.black, for: .normal)
        europeanButton.layer.cornerRadius = 14
        europeanButton.tag = 3
        europeanButton.addTarget(self, action: #selector(didTapButton(_:)), for:.touchUpInside)
        europeanButton.layer.masksToBounds = true
        europeanButton.layer.cornerRadius = 20
        europeanButton.layer.borderWidth = 1
        europeanButton.layer.borderColor = UIColor.blue.cgColor
        europeanButton.backgroundColor = .systemBlue
        return europeanButton
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapButton(_ selector: UIButton) {
        switch selector.tag {
        case 0 :
            delegate?.didTapCuisineButton(cuisine: .american)
        case 1:
            delegate?.didTapCuisineButton(cuisine: .italian)
        case 2:
            delegate?.didTapCuisineButton(cuisine: .japanese)
        default:
            delegate?.didTapCuisineButton(cuisine: .european)
        }
    }
        
}
