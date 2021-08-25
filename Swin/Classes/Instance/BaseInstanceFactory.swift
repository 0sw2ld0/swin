//
//  BaseInstanceFactory.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/29/21.
//

class BaseInstanceFactory<T>: InstanceFactory {
    
    let moduleId: String
    var beanDefinition: BeanDefinition<T>
    
    let key: String = String(describing: T.self)
    
    init(moduleId: String, definition: @escaping Definition<T>) {
        self.moduleId = moduleId
        beanDefinition = BeanDefinition(definition: definition)
    }
    
    func get<W>() -> W? {
        return create(beanDefinition.definition) as? W
    }
    
    func create<W>(_ definition: Definition<W>) -> W {
        return definition()
    }
    
}
