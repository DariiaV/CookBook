//
//  ExtensionViewController.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 15.11.2022.
//

import UIKit

extension KitchenViewController {
    
    func setupTableView() {
        
        myTableView.backgroundColor = UIColor(red: 244/255, green: 201/255, blue: 70/255, alpha: 1)
        myTableView.rowHeight = 230
        
        myTableView.register(MyOwnCell.self, forCellReuseIdentifier: "CellID")
        myTableView.dataSource = self
        myTableView.delegate = self
    }
}
