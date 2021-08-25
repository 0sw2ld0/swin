//
//  InstanceFactory.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/29/21.
//

protocol InstanceFactory: AnyObject {
    
    associatedtype T // swiftlint:disable:this type_name
    func get<W>() -> W?
    func create(_ definition: Definition<T>) -> T
}
