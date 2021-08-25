//
//  Module.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

public struct Module: Equatable {
    let moduleId: String
    let closure: (DependencyContainerProxy) -> Void
    
    init(closure: @escaping (DependencyContainerProxy) -> Void) {
        moduleId = UUID().uuidString
        self.closure = closure
    }
    
    func run() {
        closure(DependencyContainerProxy(moduleId: moduleId, container: DependencyContainer.shared))
    }
    
    func remove() {
        DependencyContainer.shared.removeModule(moduleId)
    }
    
    public static func == (lhs: Module, rhs: Module) -> Bool {
        lhs.moduleId == rhs.moduleId
    }
}

public func module(using closure: @escaping (DependencyContainerProxy) -> Void) -> Module {
    return Module(closure: closure)
}

public func named(_ name: String) -> Qualifier {
    return StringQualifier(value: name)
}
