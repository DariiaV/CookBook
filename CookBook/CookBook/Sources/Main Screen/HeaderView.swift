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
    static let americanButtonTrailingAnchor: CGFloat = -265
    static let americanButtonHeightAnchor : CGFloat = 50
    
    static let italianButtonTopAnchor: CGFloat = 60
    static let italianButtonLeadingAnchor: CGFloat = 10
    static let italianButtonTrailingAnchor: CGFloat = -265
    static let italianButtonHeightAnchor : CGFloat = 50
    
    static let japaneseButtonTopAnchor: CGFloat = 70
    static let japeneseButtonLeadingAnchor: CGFloat = 135
    static let japaneseButtonTrailingAnchor: CGFloat = -140
    static let japaneseButtonHeightAnchor : CGFloat = 50
    
    static let koreanButtonTopAnchor: CGFloat = 60
    static let koreanButtonTopAnchorButtonLeadingAnchor: CGFloat = 135
    static let koreanButtonTopAnchorButtonTrailingAnchor: CGFloat = -140
    static let koreanButtonTopAnchorButtonHeightAnchor : CGFloat = 50
    
    static let germanButtonTopAnchor: CGFloat = 70
    static let germanButtonLeadingAnchor: CGFloat = 260
    static let germanButtonTrailingAnchor: CGFloat = -10
    static let germanButtonHeightAnchor : CGFloat = 50
    
    static let europeanButtonTopAnchor: CGFloat = 60
    static let europeanButtonLeadingAnchor: CGFloat = 260
    static let europeanButtonTrailingAnchor: CGFloat = -10
    static let europeanButtonHeightAnchor : CGFloat = 50
    
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
        americanButton.layer.borderColor = UIColor.gray.cgColor
        americanButton.backgroundColor = .white
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
        italianButton.layer.borderColor = UIColor.gray.cgColor
        italianButton.backgroundColor = .white
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
        japaneseButton.layer.borderColor = UIColor.gray.cgColor
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
        europeanButton.layer.borderColor = UIColor.gray.cgColor
        europeanButton.backgroundColor = .white
        return europeanButton
    }()
    
    lazy var germanButton : UIButton = {
        let germanButton = UIButton ()
        germanButton.setTitle("German", for: .normal)
        germanButton.setTitleColor(UIColor.black, for: .normal)
        germanButton.layer.cornerRadius = 14
        germanButton.tag = 3
        germanButton.addTarget(self, action: #selector(didTapButtonGerman(_:)), for:.touchUpInside)
        germanButton.layer.masksToBounds = true
        germanButton.layer.cornerRadius = 20
        germanButton.layer.borderWidth = 1
        germanButton.layer.borderColor = UIColor.gray.cgColor
        germanButton.backgroundColor = .white
        return germanButton
    }()
    
    lazy var koreanButton : UIButton = {
        let koreanButton = UIButton ()
        koreanButton.setTitle("Korean", for: .normal)
        koreanButton.setTitleColor(UIColor.black, for: .normal)
        koreanButton.layer.cornerRadius = 14
        koreanButton.tag = 3
        koreanButton.addTarget(self, action: #selector(didTapButtonKorean(_:)), for:.touchUpInside)
        koreanButton.layer.masksToBounds = true
        koreanButton.layer.cornerRadius = 20
        koreanButton.layer.borderWidth = 1
        koreanButton.layer.borderColor = UIColor.gray.cgColor
        koreanButton.backgroundColor = .white
        return koreanButton
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
        case 3:
            delegate?.didTapCuisineButton(cuisine: .european)
        
        default:
            delegate?.didTapCuisineButton(cuisine: .european)
        }
        print("Выбор кухни работает")
    }
    // MARK: - Action
    
    @objc private func didTapButtonGerman(_ selector: UIButton) {
        delegate?.didTapCuisineButton(cuisine: .german)
        print("Выбор кухни работает")
    }
    @objc private func didTapButtonKorean(_ selector: UIButton) {
        delegate?.didTapCuisineButton(cuisine: .korean)
        print("Выбор кухни работает")
    }
        
}

