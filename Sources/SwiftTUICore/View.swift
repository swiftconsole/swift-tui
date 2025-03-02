//
//  View.swift
//  SwiftTUI
//
//  Created by Ihar Biaspalau on 6.02.25.
//

import ANSI

public protocol View: Inspectable {
    associatedtype Body: View
    var body: Body { get }
    func render(maxWidth: Int, asPlain: Bool) -> [[String]]
    func render() -> String
}

extension View {
    public var body: some View { self }

    public func render(maxWidth: Int, asPlain: Bool) -> [[String]] {
        body.render(maxWidth: maxWidth, asPlain: asPlain)
    }

    public func render() -> String {
        render(maxWidth: Helpers.getTerminalWidth(), asPlain: false).map {
            $0.joined(separator: "\n")
        }.joined(separator: "\n")
    }
}

extension View {
    public func inspectList(as type: InspectType) -> [String] {
        body.inspectList(as: type)
    }
}
