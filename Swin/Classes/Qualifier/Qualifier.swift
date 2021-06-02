//
//  Qualifier.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/29/21.
//

import Foundation

public protocol Qualifier {
    var value: QualifierValue { get set }
}

public typealias QualifierValue = String
