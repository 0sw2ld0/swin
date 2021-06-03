//
//  Module.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

import Foundation

public struct Module {
    let closure: (DependencyContainerProxy) -> Void
    
    func run() {
        closure(DependencyContainerProxy(container: DependencyContainer.shared))
    }
}

public func module(using closure: @escaping (DependencyContainerProxy) -> Void) -> Module {
    return Module(closure: closure)
}

public func named(_ name: String) -> Qualifier {
    return StringQualifier(value: name)
}
