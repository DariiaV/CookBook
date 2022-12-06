//
//  ExtensionViewController.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 15.11.2022.
//

import UIKit

extension KitchenViewController {
    
    func setupTableView() {
        
        myTableView.backgroundColor = UIColor(red: 240/255, green: 235/255, blue: 231/255, alpha: 1)
        myTableView.rowHeight = 230
        
        myTableView.register(MyOwnCell.self, forCellReuseIdentifier: "CellID")
        myTableView.dataSource = self
        myTableView.delegate = self
    }
}
