//
//  SingleInstanceFactory.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

import Foundation

class SingleInstanceFactory<T>: BaseInstanceFactory<T>{
    var value: T?
    
    override func get() -> T {
        if isCreated() {
            
            guard let mValue = value else {
                let newValue = create()
                value = newValue
                return newValue
            }
            return mValue
            
        } else {
            
            let newValue = create()
            value = newValue
            return newValue
        }
    }
    
    override func isCreated() -> Bool {
        return value != nil
    }
}
