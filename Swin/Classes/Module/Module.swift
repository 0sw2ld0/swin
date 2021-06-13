//
//  Module.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

public struct Module: Equatable {
    let unique: String
    let closure: (DependencyContainerProxy) -> Void
    
    init(closure: @escaping (DependencyContainerProxy) -> Void) {
        unique = UUID().uuidString
        self.closure = closure
    }
    
    func run() {
        closure(DependencyContainerProxy(container: DependencyContainer.shared))
    }
    
    public static func == (lhs: Module, rhs: Module) -> Bool {
        lhs.unique == rhs.unique
    }
}

public func module(using closure: @escaping (DependencyContainerProxy) -> Void) -> Module {
    return Module(closure: closure)
}

public func named(_ name: String) -> Qualifier {
    return StringQualifier(value: name)
}
