//
//  ProfileViewController.swift
//  Pokedex
//
//  Created by Srujay Korlakunta on 9/20/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var pokemon : Pokemon?
    var profilePicture : UIImageView!
    var backgroundImageView : UIImageView!
    var addToFavorite : UIButton!
    var toFav : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        setupUI()
        
    }
    
    func setupUI(){
        
        //Set the backround view for the view
        backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        backgroundImageView.image = #imageLiteral(resourceName: "images-1")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.transform.rotated(by: CGFloat(M_PI_2))
        view.addSubview(backgroundImageView)
        
        //Set the profile picture
        profilePicture = UIImageView(frame: CGRect(x: view.frame.width*0.4, y: view.frame.height*0.325, width: view.frame.width*0.3, height: view.frame.height*0.3))
        if let pokemonPictureURL = URL(string: (pokemon?.imageUrl)!) {
            let data = try? Data(contentsOf: pokemonPictureURL)
            
            if data != nil{
                profilePicture.image = UIImage(data: data!)
            }
            
        } else {
            profilePicture.image = #imageLiteral(resourceName: "images")
        }
        profilePicture.contentMode = .scaleAspectFit
        view.addSubview(profilePicture)
        
        
        
        //Set the pokemon name for the specific pokemon
        let pokemonTitle = UILabel(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height*0.85, width: view.frame.width * 0.8, height: view.frame.height*0.1))
        pokemonTitle.text = (pokemon?.name)! + ": #" + String((pokemon?.number)!)
        pokemonTitle.textColor = UIColor.red
        pokemonTitle.font = UIFont(name: "HelveticaNueu", size:100)
        pokemonTitle.textAlignment = .center
        view.addSubview(pokemonTitle)
        
        
        //Set the pokemon statistics
        
        //The pokemon attack value
        let pokemonAttack = UILabel(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height*0.57, width: view.frame.width * 0.8, height: view.frame.height*0.1))
        pokemonAttack.text = "Attack:  \(String(describing: pokemon!.attack!))"
        pokemonAttack.font = UIFont(name: "HelveticaNueu", size:30)
        pokemonAttack.textColor = UIColor.red
        pokemonAttack.textAlignment = .center
        view.addSubview(pokemonAttack)
        
        //The pokemon defense value
        let pokemonDefense = UILabel(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height*0.63, width: view.frame.width * 0.8, height: view.frame.height*0.1))
        pokemonDefense.text = "Defense:  \(String(describing: pokemon!.attack!))"
        pokemonDefense.font = UIFont(name: "HelveticaNueu", size:30)
        pokemonDefense.textColor = UIColor.red
        pokemonDefense.textAlignment = .center
        view.addSubview(pokemonDefense)
        
        
        //The pokemon health value
        let pokemonHealth = UILabel(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height*0.69, width: view.frame.width * 0.8, height: view.frame.height*0.1))
        pokemonHealth.text = "Health:  \(String(describing: pokemon!.attack!))"
        pokemonHealth.font = UIFont(name: "HelveticaNueu", size:30)
        pokemonHealth.textColor = UIColor.red
        pokemonHealth.textAlignment = .center
        view.addSubview(pokemonHealth)
        
        
        //Create the addToFavorite button
        addToFavorite = UIButton(frame: CGRect(x: view.frame.width * 0.0001, y: view.frame.height * 0.082, width: view.frame.width * 0.35, height: view.frame.height * 0.1))
        addToFavorite.setTitle("Favorites", for: .normal)
        addToFavorite.setTitleColor(UIColor.black, for: .normal)
        addToFavorite.addTarget(self, action: #selector(addFavorite), for: .touchUpInside)
        view.addSubview(addToFavorite)
    }
    
    func addFavorite(){
        let defaults = UserDefaults.standard
        var oldFavorites = defaults.object(forKey: "favorites") as! [String]
        oldFavorites.append((pokemon?.name!)!)
        defaults.set(oldFavorites, forKey: "favorites")
        for i in defaults.object(forKey: "favorites") as! [String]{
            print(i)
        }
    }
    
    func toFavorites(){
        performSegue(withIdentifier: "toFavorites", sender: self)
    }
    
    
}
