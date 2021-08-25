//
//  Animal.swift
//  Swin_Example
//
//  Created by Oswaldo Leon on 6/12/21.

import Foundation
import Swin

protocol Animal {
    var name: String {get set}
    func say() -> String
}

struct Dog: Animal {
    var name: String
    var medal: Int

    init(name: String) {
        self.name = name
        medal = 0
    }
    
    func say() -> String {
        "Guau Guau"
    }
}

class Tiger: Animal {
    var name: String

    init(name: String) {
        self.name = name
    }
    
    func say() -> String {
        "Grrr Grrr"
    }
}

class ShowDog: Animal {
    var name: String
    var medal: Int
    var hairstyle: String
    
    init(name: String, medal: Int, hairstyle: String) {
        self.name = name
        self.medal = medal
        self.hairstyle = hairstyle
    }
    
    func say() -> String {
        "Guau Guau Guau"
    }
}

struct PetOwner {
    @Inject var dog: Animal
}

struct PetTeam {
    @Inject var petOwner: PetOwner
}

struct Watchman {
    @Inject(named: "Watchman") var dog: Animal
}

struct PetTrainer {
    @Scoped("TScope") var dog: ShowDog
}

struct GuardZoo {
    @Scoped("zooScope") var tiger: Tiger
}

class BeautyParlor {
    @Scoped("TScope") var dog: ShowDog
    
    func make(hairstyle: String) {
        dog.hairstyle = hairstyle
    }
}

class Zoo {
    @RetainedClass("zooScope") var scope: RetainedScope
    @Scoped("zooScope") var tiger: Tiger
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
