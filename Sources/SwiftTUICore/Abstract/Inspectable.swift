//
//  Inspectable.swift
//  SwiftTUI
//
//  Created by Ihar Biaspalau on 1.03.25.
//

import ANSI

public protocol Inspectable {
    func inspectList(as type: InspectType) -> [String]
}

extension Inspectable {
    public func inspect(as type: InspectType) -> String {
        inspectList(as: type).joined()
    }
}
