//
//  SwinStart.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

import Foundation

public class Swin {
    private var modules: [Module]
    public static var shared = Swin()

    init() {
        modules = []
    }
    
    public func modules(_ args: Module...) {
        modules = args
    }
    
    public func startSwin() {
        modules.forEach { $0.run() }
    }
}


