//
//  ModalViewController.swift
//  Swin_Example
//
//  Created by Oswaldo Leon on 6/15/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import Swin

class ModalViewController: UIViewController {
    @Scoped("vcScope") var cat: Cat
    @IBOutlet weak var nameCatLabel: UILabel!
    @IBOutlet weak var ageCatLabel: UILabel!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showCat()
    }

    // MARK: - private functions

    private func setupView() {
        showCat()
    }

    private func showCat() {
        nameCatLabel.text = "name: \(cat.name)"
        ageCatLabel.text = "age: \(cat.age)"
    }

    // MARK: - IBAction

    @IBAction func onDecrease(_ sender: Any) {
        cat.age -= 1
        showCat()
    }

    @IBAction func onClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
