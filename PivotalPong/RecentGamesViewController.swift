//
//  ViewController.swift
//  PivotalPong
//
//  Created by Pivotal on 2/19/16.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import UIKit

class RecentGamesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, LogGameDelegate {

    let playerService:PlayerService
    let recentGamesView: RecentGamesView
    var winners = [Player]()
    
    init(playerService:PlayerService) {
        self.playerService = playerService
        self.recentGamesView = RecentGamesView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = recentGamesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recentGamesView.gamesTable.delegate = self
        recentGamesView.gamesTable.dataSource = self
        
        recentGamesView.createGameButton.target = self
        recentGamesView.createGameButton.action = "showLogGameScreen"
    }
    
    func showLogGameScreen() {
        let playerService = PlayerService()
        let logGameViewController = LogGameViewController()
        playerService.delegate = logGameViewController
        logGameViewController.delegate = self
        self.presentViewController(logGameViewController, animated: true) {
            playerService.getAllPlayers()
        }
    }
    
    func logGameWinner(winner: Player) {
        winners.insert(winner, atIndex: 0)
        recentGamesView.gamesTable.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return winners.count
    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let reusedCell = tableView.dequeueReusableCellWithIdentifier("GameCell") {
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "GameCell")
        }
        
        cell.textLabel!.text = "\(winners[indexPath.row].name) is a ruler!!"
        
        return cell
    }   
}