//
//  InstanceFactory.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/29/21.
//

protocol InstanceFactory: class {
    associatedtype T
    func get() -> T
    func create() -> T
}
