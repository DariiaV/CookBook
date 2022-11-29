//
//  ExtensionViewController.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 15.11.2022.
//

import UIKit

extension MainViewController {
    
    func setupTableView() {
        
        myTableView.backgroundColor = .orange
        myTableView.rowHeight = 60
        myTableView.register(MyOwnCell.self, forCellReuseIdentifier: "CellID")
        myTableView.dataSource = self
//        myTableView.delegate = self
    }
    
}
