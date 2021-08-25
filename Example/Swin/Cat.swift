//
//  Cat.swift
//  Swin_Example
//
//  Created by Oswaldo Leon on 5/31/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

class Cat: Mammal {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func say() {
        print("Miau Miau")
    }
    
}
