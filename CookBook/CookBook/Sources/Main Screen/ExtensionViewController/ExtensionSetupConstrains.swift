//
//  ExtensionalConstrains.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 15.11.2022.
//

import UIKit

extension KitchenViewController {
    
    func setupConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(headerView)
        view.addSubview(myTableView)

        headerView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor,constant: 10),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.heightAnchor.constraint(equalTo: view.heightAnchor,constant:.headerViewHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 5),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:.myTableViewTrailingAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:.myTableViewBottomAnchor)
        ])
        
    }
}
