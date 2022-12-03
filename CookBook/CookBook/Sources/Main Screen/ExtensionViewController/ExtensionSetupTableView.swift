//
//  ExtensionViewController.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 15.11.2022.
//

import UIKit

extension KitchenViewController {
    
    func setupTableView() {
        
        myTableView.backgroundColor = .orange
        myTableView.estimatedRowHeight = 50
//        myTableView.rowHeight = UITableViewA
        myTableView.register(MyOwnCell.self, forCellReuseIdentifier: "CellID")
        myTableView.dataSource = self
        myTableView.delegate = self
    }
}
