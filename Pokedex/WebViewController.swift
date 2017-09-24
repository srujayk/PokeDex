//
//  WebViewController.swift
//  Pokedex
//
//  Created by Vineeth Yeevani on 9/21/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    var pokemon : Pokemon?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpWebView()
        
        //let pokemonPictureURL = URL(string: pokemonResults[indexPath.row].imageUrl)
    }
    
    func setUpWebView() {
        let webView = UIWebView(frame: CGRect(x: 0, y:0, width: view.frame.width, height: view.frame.height))
        let pokemonName = pokemon!.name!
        let pokemonURL = "https://google.com/search?q=\(pokemonName)"
        print(pokemonURL)
        webView.loadRequest(NSURLRequest(url: NSURL(string: pokemonURL) as! URL) as URLRequest)
        view.addSubview(webView)
    }
}
