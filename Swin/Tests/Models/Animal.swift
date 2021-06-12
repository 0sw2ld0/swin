//
//  Animal.swift
//  Swin_Example
//
//  Created by Oswaldo Leon on 5/31/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//
import Foundation
import Swin

protocol Animal {
    var name: String {get set}
    func say() -> String
}

struct Dog: Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func say() -> String {
        "Guau Guau"
    }
    
}

struct PetOwner {
    @Inject var dog: Animal
}

struct Watchman {
    @Inject(named: "Watchman") var dog: Animal
}


