//
//  Scene.swift
//  SwiftTUI
//
//  Created by Ihar Biaspalau on 6.02.25.
//

import Foundation
import ANSI

public protocol Scene: Inspectable {
    associatedtype Body: View
    var body: Body { get }
    func run()
}

extension Scene {
    public func render() -> String {
        body.render(maxWidth: Helpers.getTerminalWidth(), asPlain: false)
            .map { $0.joined(separator: "\n") }.joined(separator: "\n")
    }
}

extension Scene {
    public func inspectList(as type: InspectType = .name) -> [String] {
        body.inspectList(as: type)
    }

    public func inspect(as type: InspectType = .name) -> String {
        body.inspect(as: type)
    }
}

extension Scene {
    public func run() {
        print(render())
    }

    public func debug(as type: InspectType = .escaped) {
        print(inspect(as: type))
    }
}
