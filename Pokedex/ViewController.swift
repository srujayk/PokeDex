//
//  ViewController.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    //Background Image
    var backgroundImageView : UIImageView!
    
    //Mater Search Results
    var searchResults : [Pokemon] = []
    var searchResultsTemp : [Pokemon] = []
    
    //The Textfield for the specific pokemon search
    var specificPokemon: UITextField!
    
    //The text field for the specific number pokemon search
    var specificNum: UITextField!
    
    //The text field for the general search (minAttack, minDefense, minHealth)
    var minAttack: UITextField!
    var minDefense: UITextField!
    var minHealth: UITextField!

    //The buttons for the type search
    var bug : UIButton!
    var grass : UIButton!
    var dark : UIButton!
    var ground : UIButton!
    var dragon : UIButton!
    var ice : UIButton!
    var electric : UIButton!
    var normal : UIButton!
    var fairy : UIButton!
    var poison : UIButton!
    var fighting : UIButton!
    var psychic : UIButton!
    var fire : UIButton!
    var rock : UIButton!
    var flying : UIButton!
    var steel : UIButton!
    var ghost : UIButton!
    var water : UIButton!
    
    //PickerView
    var pickTypes : UIPickerView!
    
    //Master Type List for reference during development
    var types : [String] = ["Bug", "Grass", "Dark", "Ground", "Dragon", "Ice", "Electric", "Normal", "Fairy", "Poison", "Fighting", "Psychic", "Fire", "Rock", "Flying", "Steel", "Ghost", "Water"]
    
    //Type array for the type search
    var typeSearch : [String] = []
    
    
    //Search and Random Button
    var searchButton : UIButton!
    var randomButton : UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let emptyPokemonArray : [String] = []
        let defaults = UserDefaults.standard
        defaults.set(emptyPokemonArray, forKey: "favorites")
        
        backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        backgroundImageView.image = #imageLiteral(resourceName: "images-1")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.transform.rotated(by: CGFloat(M_PI_2))
        view.addSubview(backgroundImageView)
        // Do any additional setup after loading the view, typically from a nib.
        
        //Create the first row of text fields (specific input and specific num
        firstRow()
        
        //Create the second row of text fields (min Attack/Defense/Health)
        secondRow()
        
        //Create the buttons for type selection
        thirdRow()
        
        //Create the forth row/the search button
        fourthRow()
    }
    
    
    //Create the first row of text fields
    func firstRow() {
        //Textfield to search for the specific pokemon name (allows all inputs)
        specificPokemon = UITextField(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.22, width: view.frame.width * 0.5, height: view.frame.height * 0.05))
        specificPokemon.backgroundColor = .white
        specificPokemon.placeholder = "Enter the Name"
        view.addSubview(specificPokemon)
        
        //TextField to search for the specific pokemon number (only allows number input)
        specificNum = UITextField(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.28, width: view.frame.width * 0.2, height: view.frame.height * 0.05))
        specificNum.backgroundColor = .white
        specificNum.placeholder = "Number"
        self.specificNum.delegate = self
        specificNum.keyboardType = .numberPad
        view.addSubview(specificNum)
    }
    
    
    //Create the second row of text fields
    func secondRow() {
        //TextField for the min attack search (only allows number input)
        minAttack = UITextField(frame: CGRect(x: view.frame.width * 0.75, y: view.frame.height * 0.25, width: view.frame.width * 0.2, height: view.frame.height * 0.05))
        minAttack.backgroundColor = .red
        minAttack.placeholder = "Attack"
        self.minAttack.delegate = self
        minAttack.keyboardType = .numberPad
        view.addSubview(minAttack)
    
        //TextField for the min defense search (only allows number input)
        minDefense = UITextField(frame: CGRect(x: view.frame.width * 0.75, y: view.frame.height * 0.31, width: view.frame.width * 0.2, height: view.frame.height * 0.05))
        minDefense.backgroundColor = .red
        minDefense.placeholder = "Defense"
        self.minDefense.delegate = self
        minDefense.keyboardType = .numberPad
        view.addSubview(minDefense)
    
        //TextField for the min health search (only allows number input)
        minHealth = UITextField(frame: CGRect(x: view.frame.width * 0.75, y: view.frame.height * 0.37, width: view.frame.width * 0.2, height: view.frame.height * 0.05))
        minHealth.backgroundColor = .red
        minHealth.placeholder = "Health"
        self.minHealth.delegate = self
        minHealth.keyboardType = .numberPad
        view.addSubview(minHealth)
    }
    
    
    //Create the third row of buttons
    func thirdRow() {
        
        pickTypes = UIPickerView(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.35, width: view.frame.width * 0.8, height: view.frame.height * 0.5))
        pickTypes.dataSource = self
        pickTypes.showsSelectionIndicator = true
        pickTypes.delegate = self
        
        view.addSubview(pickTypes)

        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeSearch += [types[row]]
        print(typeSearch)
    }
    
    
    
    
    //Create the fourth row
    func fourthRow() {
        
        //Create the search button
        searchButton = UIButton(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.85, width: view.frame.width * 0.4, height: view.frame.height * 0.1))
        searchButton.setTitle("Search", for: .normal)
        searchButton.setTitleColor(UIColor.black, for: .normal)
        searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        view.addSubview(searchButton)
        
        //Create the random button
        randomButton = UIButton(frame: CGRect(x: view.frame.width * 0.5, y: view.frame.height * 0.85, width: view.frame.width * 0.4, height: view.frame.height * 0.1))
        randomButton.setTitle("Random", for: .normal)
        randomButton.setTitleColor(UIColor.black, for: .normal)
        randomButton.addTarget(self, action: #selector(randomPokemon), for: .touchUpInside)
        view.addSubview(randomButton)
        
    }
    
    //Add the temporary filtered array to the search results
    func addtoSearchResults(){
        for i in searchResultsTemp {
            searchResults.append(i)
        }
    }
    
    func printSearch() {
        for i in searchResults{
            print(i.name)
        }
    }
    
    func randomPokemon(){
        var source = PokemonGenerator.getPokemonArray()
        var dest = [Pokemon]()
        for _ in 1...20 {
            let randomIndex = Int(arc4random_uniform(UInt32(source.count)))
            dest.append(source[randomIndex])
            source.remove(at: randomIndex)
        }
        
        searchResults = dest
        performSegue(withIdentifier: "toSearchResults", sender: self)
    }
    
    //Search Function
    func search(){
        
        //Filter for the specific name of the pokemon
        if specificPokemon.text != nil {
            
            searchResultsTemp = PokemonGenerator.getPokemonArray().filter(){
                if($0.name.lowercased().range(of: (specificPokemon.text?.lowercased())!) != nil){
                    return true
                }
                return false
            }
            //Add the filtered results of the name of the pokemon to the master search results
            addtoSearchResults()
        }
        
        
        
        
        //Add the specific number filtered results to the temporary filter array
        if specificNum.text != nil {
            
            searchResultsTemp = PokemonGenerator.getPokemonArray().filter(){
                if($0.number == Int(specificNum.text!)){
                    return true
                } else {
                    return false
                }
            }
            //Add the specific number temporary filtered array to the master search array
            addtoSearchResults()
        }
        
        
        
            
        //Add the minimum attack filtered results to the temporary filter array
        if minAttack.text != "" {
            
            searchResultsTemp = PokemonGenerator.getPokemonArray().filter(){
                if($0.attack > Int(minAttack.text!)!){
                    return true
                } else {
                    return false
                }
            }
            //Add the minimum attack temporary filtered array to the master search array
            addtoSearchResults()
        }
        
        
        
        //Add the minimum defense filtered results to the temporary filter array
        if minDefense.text != "" {
            
            searchResultsTemp = PokemonGenerator.getPokemonArray().filter(){
                if($0.defense > Int(minDefense.text!)!){
                    return true
                } else {
                    return false
                }
            }
            //Add the minimum defense temporary filtered array to master search array
            addtoSearchResults()
        }
        
        
        
        //Add the minimum defense filtered results to the temporary filter array
        if minHealth.text != "" {
            
            searchResultsTemp = PokemonGenerator.getPokemonArray().filter(){
                if($0.health > Int(minHealth.text!)!){
                    return true
                } else {
                    return false
                }
            }
            //Add the minimum health temporary filtered array to master search array
            addtoSearchResults()
        }
        
        
        
        
        
        //Add the type filtered results to the type temporary arrary
        if(typeSearch != []){
            searchResultsTemp = PokemonGenerator.getPokemonArray().filter(){
                if(Set(typeSearch).isSubset(of: Set($0.types))){
                    return true
                } else {
                    return false
                }
            }
            //Add the type temporary filtered array to the master search array
            addtoSearchResults()
        }
        
        
        
        
        typeSearch = []
        searchResultsTemp = []
        //Take the search list and then remove duplicates from it
        var notcontainedInList : Bool = true
        for i in searchResults{
            for j in searchResultsTemp{
                if(j.name == i.name){
                    notcontainedInList = false
                } else {
                    notcontainedInList = true
                }
            }
            if notcontainedInList {
                searchResultsTemp.append(i)
            }
        }
        
        for i in searchResultsTemp{
            print(i.name)
        }
        
        searchResults = searchResultsTemp
        
        
        printSearch()
        performSegue(withIdentifier: "toSearchResults", sender: self)
            
        
    }
    
    
    //Prepare for the segue and pass the search array to the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let searchResultsPage = segue.destination as! PokemonViewController
        searchResultsPage.pokemonResults = searchResults
    }
    
    
    
}

//Extension to limit the charecter to only numeric inputs
extension ViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
