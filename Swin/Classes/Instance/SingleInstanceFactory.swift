//
//  SingleInstanceFactory.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

class SingleInstanceFactory<T>: BaseInstanceFactory<T>{
    var value: T?
    
    override func get() -> T {
        if !isCreated() {
            value = create()
        }
        return getValue()
    }
    
    private func isCreated() -> Bool {
        return value != nil
    }
    
    private func getValue() -> T {
        precondition(value != nil, "Single instance created couldn't return value")
        return value!
    }

}
