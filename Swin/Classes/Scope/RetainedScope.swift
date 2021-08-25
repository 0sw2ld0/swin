//
//  SwinStart.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

public class RetainedScope {
    
    private let qualifier: Qualifier
    
    init(name: String) {
        qualifier = named(name)
    }
    
    deinit {
        DependencyContainer.shared.cleanScope(qualifier)
    }
    
    public func cleanScope() {
        DependencyContainer.shared.cleanScope(qualifier)
    }
}
