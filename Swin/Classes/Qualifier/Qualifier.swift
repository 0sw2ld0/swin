//
//  Qualifier.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/29/21.
//

public protocol Qualifier {
    
    var value: QualifierValue { get set }
}

public typealias QualifierValue = String
