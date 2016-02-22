//
//  RecentGamesView.swift
//  PivotalPong
//
//  Created by Pivotal on 2/22/16.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import UIKit

class RecentGamesView: UIView {
    let createGameButton = UIBarButtonItem(barButtonSystemItem: .Add, target: nil, action: nil)
    let gamesTable = UITableView()
    
    private let bar = UINavigationBar()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let navigationItem = UINavigationItem(title: "Pivotal Pong Rulerz!!")
        createGameButton.accessibilityLabel = "Create Game"
        navigationItem.rightBarButtonItem = createGameButton
        bar.setItems([navigationItem], animated: false)
        self.addSubview(bar)
        self.addSubview(gamesTable)
        configureConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureConstraints() {
        bar.translatesAutoresizingMaskIntoConstraints = false
        gamesTable.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[bar]|", options: [], metrics: nil, views: ["bar":bar]))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[table]|", options: [], metrics: nil, views: ["table":gamesTable]))
        self.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|[bar(64)][table]|",
                options: [],
                metrics: nil,
                views: ["bar":bar,"table":gamesTable]
            )
        )
    }
}