//
//  Module.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

public final class Module: Equatable {
    
    let moduleId: String
    let closure: (DependencyContainerProxy) -> Void
    
    init(closure: @escaping (DependencyContainerProxy) -> Void) {
        moduleId = UUID().uuidString
        self.closure = closure
    }
    
    public func run() {
        closure(DependencyContainerProxy(moduleId: moduleId, container: DependencyContainer.shared))
    }
    
    public func remove() {
        DependencyContainer.shared.removeModule(moduleId)
    }
    
    public static func == (lhs: Module, rhs: Module) -> Bool {
        lhs.moduleId == rhs.moduleId
    }
    
    deinit {
        remove()
    }
}

@inline(__always)
public func module(using closure: @escaping (DependencyContainerProxy) -> Void) -> Module {
    return Module(closure: closure)
}

public func named(_ name: String) -> Qualifier {
    return StringQualifier(value: name)
}
