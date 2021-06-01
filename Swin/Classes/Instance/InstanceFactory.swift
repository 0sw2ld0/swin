//
//  InstanceFactory.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/29/21.
//

import Foundation

protocol InstanceFactory: class {
    associatedtype T
    func get() -> T
    func create() -> T
    func isCreated() -> Bool
}
