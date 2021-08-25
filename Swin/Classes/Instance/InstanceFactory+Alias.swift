//
//  InstanceFactory+Alias.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

public typealias Definition<T> = () -> T
typealias FactoryInstanceFactory<T> = BaseInstanceFactory<T>

struct BeanDefinition<T> {
    let definition: Definition<T>
    
    init(definition: @escaping Definition<T>) {
        self.definition = definition
    }
}
