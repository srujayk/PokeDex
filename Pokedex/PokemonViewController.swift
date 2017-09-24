//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Srujay Korlakunta on 9/20/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit



class PokemonViewController: UIViewController{

    var segmentedControl: UISegmentedControl!   //What we will use to switch between the table and collection views
    var tableView: UITableView!   //Our tableView
    var collectionView: UICollectionView!   //Our collectionView

    //The results that we receive from ViewController.swift compiled into an array of pokemon
    var pokemonResults : [Pokemon] = []
    
    //The specific pokemon that we are going to pass to the profile view of the pokemon
    var pokemonToPass: Pokemon?
    
    //Call the segmented control and the table view funtions (collection view will be added later in the segmented control)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentedControl()
        setupTableView()
    }
    
    func setupSegmentedControl() {
        //Initialize SegmentedControl
        segmentedControl = UISegmentedControl(frame: CGRect(x: 0, y: view.frame.height*0.05, width: view.frame.width, height: view.frame.height * 0.05))
        segmentedControl.insertSegment(withTitle: "Search", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Table", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Grid", at: 2, animated: true)
        segmentedControl.layer.cornerRadius = 3
        segmentedControl.addTarget(self, action: #selector(switchView), for: .valueChanged)
        view.addSubview(segmentedControl)
    }
    
    func setupTableView(){
        segmentedControl.selectedSegmentIndex = 1
        
        //Initialize TableView Object here
        tableView = UITableView(frame: CGRect(x: 0, y: view.frame.height*0.1, width: view.frame.width, height: view.frame.height - UIApplication.shared.statusBarFrame.maxY))
        //Register the tableViewCell you are using
        tableView.register(NameTableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        
        //Set properties of TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50/2, right: 0)
        //Add tableView to view
        view.addSubview(tableView)
    }
    
    func setupCollectionView() {
        segmentedControl.selectedSegmentIndex = 2
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY + view.frame.height * 0.1 + 10, width: view.frame.width, height: view.frame.height * 0.9 - UIApplication.shared.statusBarFrame.maxY - 10), collectionViewLayout: layout)
        collectionView.register(NameCollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor =  UIColor.black //UIColor(hexString: "544e3c")
        view.addSubview(collectionView)
    }
    
    func switchView(sender: UISegmentedControl) {
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
        view.addSubview(segmentedControl)
        if (sender.selectedSegmentIndex == 1) {
            setupTableView()
        } else if (sender.selectedSegmentIndex == 2){
            setupCollectionView()
        } else {
            performSegue(withIdentifier: "returnToSearch", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToPokemonProfile" {
            let pokemonProfileView = segue.destination as! TabBarController
            pokemonProfileView.pokemon = pokemonToPass
        }
    }
    
    
}

//MARK: Required TableView Methods will go here

extension PokemonViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! NameTableViewCell
        
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        cell.nameLabel.text = pokemonResults[indexPath.row].name + " #" + String(pokemonResults[indexPath.row].number)
        if let pokemonPictureURL = URL(string: pokemonResults[indexPath.row].imageUrl) {
            let data = try? Data(contentsOf: pokemonPictureURL)
            
            if data != nil{
                
                cell.cellImg.image = UIImage(data: data!)
            }
            
        } else {
            cell.cellImg.image = #imageLiteral(resourceName: "images")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pokemonToPass = pokemonResults[indexPath.row]
        performSegue(withIdentifier: "segueToPokemonProfile", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

extension PokemonViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! NameCollectionViewCell
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        if let pokemonPictureURL = URL(string: pokemonResults[indexPath.row].imageUrl) {
            let data = try? Data(contentsOf: pokemonPictureURL)
        
            if data != nil{
                cell.fruitImage.image = UIImage(data: data!)
            }
            
        } else {
            cell.fruitImage.image = #imageLiteral(resourceName: "images")
        }
        cell.myLabel.text = pokemonResults[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pokemonToPass = pokemonResults[indexPath.row]
        performSegue(withIdentifier: "segueToPokemonProfile", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3, height: 100)
    }
    
}



