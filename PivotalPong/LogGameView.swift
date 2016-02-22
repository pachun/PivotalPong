//
//  LogGameView.swift
//  PivotalPong
//
//  Created by Pivotal on 2/22/16.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import UIKit

class LogGameView: UIView {
    
    let tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
    let cancelButton = UIBarButtonItem(barButtonSystemItem: .Cancel, target: nil, action: nil)
    let instructionsLabel = UILabel()
    
    private let bar = UINavigationBar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let navigationItem = UINavigationItem(title: "Log Game")
        navigationItem.leftBarButtonItem = cancelButton

        bar.setItems([navigationItem], animated: false)
        self.addSubview(bar)
        
        self.addSubview(tableView)
        
        instructionsLabel.text = "Select Who Won"
        instructionsLabel.backgroundColor = UIColor.whiteColor()
        self.addSubview(instructionsLabel)
        
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        bar.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[table]|", options: [], metrics: nil, views: ["table":tableView]))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[bar]|", options: [], metrics: nil, views: ["bar":bar]))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[instructions]|", options: [], metrics: nil, views: ["instructions":instructionsLabel]))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|[bar(64)][instructions][table]|",
            options: [],
            metrics: nil,
            views: ["bar":bar,"table":tableView,"instructions":instructionsLabel]
            )
        )
    }
}
