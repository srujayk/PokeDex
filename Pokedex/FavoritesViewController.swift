//
//  FavoritesViewController.swift
//  Pokedex
//
//  Created by Vineeth Yeevani on 9/21/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    var pokemonNames : [String]!
    var tableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        loadFavoritesInfo()
        setupTableView()
        reload()
    }

    
    //Loads the favorites information from the user defaults
    func loadFavoritesInfo(){
        let defaults = UserDefaults.standard
        pokemonNames = defaults.object(forKey: "favorites") as! [String]
    }
    
    
    //Creates a table view for the names of the favorite pokemon
    func setupTableView(){
        //Initialize TableView Object here
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        //Register the tableViewCell you are using
        tableView.register(NameTableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        
        //Set properties of TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50/2, right: 0)
        //Add tableView to view
        view.addSubview(tableView)
        
        
    }
    
    
    //Reloads the favorites images
    func reload() {
        tableView.reloadData()
    }
}



//MARK: Required TableView Methods will go here

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! NameTableViewCell
        
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        cell.nameLabel.text = pokemonNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
