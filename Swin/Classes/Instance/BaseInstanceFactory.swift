//
//  BaseInstanceFactory.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/29/21.
//

class BaseInstanceFactory<T>: InstanceFactory{
    var definition: Definition<T>
    let key: String = String(describing: T.self)
    
    init(definition: @escaping Definition<T>) {
        self.definition = definition
    }
    func get() -> T {
        return create()
    }
    
    func create() -> T {
        return definition()
    }
    
}
