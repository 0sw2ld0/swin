//
//  ViewController.swift
//  Swin
//
//  Created by Oswaldo Leon on 05/31/2021.
//  Copyright (c) 2021 Oswaldo Leon. All rights reserved.
//

import UIKit
import Swin
class ViewController: UIViewController {
    
    @Inject(named: "MyCat") var cat: Cat
    @Inject var mammal: Mammal
    var dog: Dog!

    //MARK: - IBOutlet
    
    @IBOutlet weak var nameDogLabel: UILabel!
    @IBOutlet weak var ageDogLabel: UILabel!
    
    @IBOutlet weak var nameCatLabel: UILabel!
    @IBOutlet weak var ageCatLabel: UILabel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupView()
    }
    
    //MARK: - private functions
    
    private func setup() {
        print("mammal say")
        mammal.say()
        print("mammal = \(mammal)")
        
        dog = DependencyContainer.resolve()
    }
    
    private func setupView() {
        showDog()
        showCat()
    }
    
    private func showDog() {
        nameDogLabel.text = "name: \(dog.name)"
        ageDogLabel.text = "age: \(dog.age)"
    }
    
    private func showCat() {
        nameCatLabel.text = "name: \(cat.name)"
        ageCatLabel.text = "age: \(cat.age)"
    }

    //MARK: - IBAction

    @IBAction func onGenerateDog(_ sender: Any) {
        dog = DependencyContainer.resolve()
        showDog()
    }
    
    @IBAction func onGenerateCat(_ sender: Any) {
        cat = DependencyContainer.resolve()
        showCat()
    }
}

