//
//  SingleInstanceFactory.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

class SingleInstanceFactory<T>: BaseInstanceFactory<T> {
    
    var value: T?
    
    override func get<W>() -> W? {
        if !isCreated() {
            value = create(beanDefinition.definition)
        }
        return getValue() as? W
    }
    
    private func isCreated() -> Bool {
        return value != nil
    }
    
    private func getValue() -> T? {
        return value
    }

}
