//
//  LogGameViewController.swift
//  PivotalPong
//
//  Created by Pivotal on 2/22/16.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import UIKit

class LogGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PlayerServiceDelegate {
    let logGameView = LogGameView()
    weak var delegate: LogGameDelegate?
    var players = [Player]()
   
    override func loadView() {
        view = logGameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logGameView.tableView.delegate = self
        logGameView.tableView.dataSource = self
        
        logGameView.cancelButton.target = self
        logGameView.cancelButton.action = "cancel"
    }
    
    func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func gotAllPlayers(players: [Player]) {
        self.players = players
        logGameView.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let reusedCell = tableView.dequeueReusableCellWithIdentifier("PlayerCell") {
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "PlayerCell")
        }
        
        cell.textLabel?.text = players[indexPath.row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let selectedPlayer = players[indexPath.row]
        self.dismissViewControllerAnimated(true) {
            self.delegate?.logGameWinner(selectedPlayer)
        }
    }
}