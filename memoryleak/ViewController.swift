//
//  ViewController.swift
//  memoryleak
//
//  Created by Hojin Ryu on 09/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
// #########################################################
        // Case 1
        // memory leaks
        var hojin: Person? = Person(name: "Hojin") // n de referencia da instancia de Person : 1
        var room1: Room? = Room(number: "5A") // n de referencia da instancia de Room : 1

        room1?.host = hojin // n de referencia da instancia de Person : 2
        hojin?.room = room1 // n de referencia da instancia de Room : 2
        
        hojin = nil // n de referencia da instancia de Person  : 1
        room1 = nil // n de referencia da instancia de Room : 1
        
// #########################################################
        // Case 2
        // Resolver sem Weak.
        var lucca: Person? = Person(name: "Lucca") // n de referencia da instancia de Person : 1
        var room2: Room? = Room(number: "5A") // n de referencia da instancia de Room : 1

        room2?.host = lucca // n de referencia da instancia de Person : 2
        lucca?.room = room2 // n de referencia da instancia de Room : 2
        lucca?.room = nil // n de referencia da instancia de Room : 1
        lucca = nil // n de referencia da instancia de Person : 1
        
        room2?.host = nil // n de referencia da instancia de Person : 0
        // Lucca is being deinitialized
        room2 = nil // n de referencia da instancia de Room : 0
        // Room 5A is being deinitialized
        
// #########################################################
        // Case 3
        // Resolver com Weak.
        var willian: Person? = Person(name: "Willian") // n de referencia da instancia de Person : 1
        var room3: Room? = Room(number: "5A") // n de referencia da instancia de Room : 1

        room3?.host = willian // n de referencia da instancia de Person : 1
        willian?.room = room3 // n de referencia da instancia de Room : 2
        willian = nil
        // n de referencia da instancia de Person : 0 ,
        // n de referencia da instancia de Room : 1
        // Willian is being deinitialized
        room3 = nil
        // n de referencia da instancia de Room : 0
        // Room 5A is being deinitialized
    }
}

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var room: Room?
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Room {
    let number: String
    
    init(number: String) {
        self.number = number
    }
    
    // Para Resolver:
    // No caso de 2, mantém a variável host como strong.
    // No caso de 3, substitui para "weak var host: Person?".
    var host: Person?
    
    deinit {
        print("Room \(number) is being deinitialized")
    }
}

