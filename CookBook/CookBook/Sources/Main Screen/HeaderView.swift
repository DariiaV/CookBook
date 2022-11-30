//
//  HeadeView.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 13.11.2022.
//

protocol HeaderViewDelegate: AnyObject {
    func didTapAdd()
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
    
//    weak var delegate: HeaderViewDelegate?
    
    // MARK: - Costomize
    
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
        americanButton.setTitle("Американская", for: .normal)
        americanButton.setTitleColor(UIColor.blue, for: .normal)
        americanButton.layer.cornerRadius = 14
//        addButton.addTarget(self, action: #selector(addBut), for:.touchUpInside)
        americanButton.layer.masksToBounds = true
        americanButton.layer.cornerRadius = 20
        americanButton.layer.borderWidth = 1
        americanButton.layer.borderColor = UIColor.blue.cgColor
        return americanButton
    }()
    
    lazy var italianButton : UIButton = {
        let italianButton = UIButton ()
        italianButton.setTitle("Итальянская", for: .normal)
        italianButton.setTitleColor(UIColor.blue, for: .normal)
        italianButton.layer.cornerRadius = 14
//        addButton.addTarget(self, action: #selector(addBut), for:.touchUpInside)
        italianButton.layer.masksToBounds = true
        italianButton.layer.cornerRadius = 20
        italianButton.layer.borderWidth = 1
        italianButton.layer.borderColor = UIColor.blue.cgColor
        return italianButton
    }()
    
    lazy var japaneseButton : UIButton = {
        let japaneseButton = UIButton ()
        japaneseButton.setTitle("Японская", for: .normal)
        japaneseButton.setTitleColor(UIColor.blue, for: .normal)
        japaneseButton.layer.cornerRadius = 14
//        addButton.addTarget(self, action: #selector(addBut), for:.touchUpInside)
        japaneseButton.layer.masksToBounds = true
        japaneseButton.layer.cornerRadius = 20
        japaneseButton.layer.borderWidth = 1
        japaneseButton.layer.borderColor = UIColor.blue.cgColor
        return japaneseButton
    }()
    
    lazy var greekButton : UIButton = {
        let greekButton = UIButton ()
        greekButton.setTitle("Греческая", for: .normal)
        greekButton.setTitleColor(UIColor.blue, for: .normal)
        greekButton.layer.cornerRadius = 14
//        addButton.addTarget(self, action: #selector(addBut), for:.touchUpInside)
        greekButton.layer.masksToBounds = true
        greekButton.layer.cornerRadius = 20
        greekButton.layer.borderWidth = 1
        greekButton.layer.borderColor = UIColor.blue.cgColor
        return greekButton
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}
