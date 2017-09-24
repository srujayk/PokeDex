//
//  TabBarController.swift
//  Pokedex
//
//  Created by Vineeth Yeevani on 9/21/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    var pokemon : Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabOne = ProfileViewController()
        tabOne.pokemon = pokemon
        tabOne.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        let tabTwo = FavoritesViewController()
        tabTwo.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let tabThree =  WebViewController()
        tabThree.pokemon = pokemon
        tabThree.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        self.viewControllers = [tabOne, tabTwo, tabThree]
    }
}
