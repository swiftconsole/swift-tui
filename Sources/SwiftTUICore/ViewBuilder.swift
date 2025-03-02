//
//  ViewBuilder.swift
//  SwiftTUI
//
//  Created by Ihar Biaspalau on 6.02.25.
//

@resultBuilder
public struct ViewBuilder {
    public static func buildBlock() -> [any View] {
        []
    }

    public static func buildBlock(_ components: any View...) -> [any View] {
        components
    }

    public static func buildBlock(_ components: [any View]...) -> [any View] {
        components.flatMap { $0 }
    }

    public static func buildArray(_ components: [[any View]]) -> [any View] {
        components.flatMap { $0 }
    }

    public static func buildExpression(_ expression: any View) -> [any View] {
        [expression]
    }

    public static func buildOptional(_ component: [any View]?) -> [any View] {
        component ?? []
    }

    public static func buildEither(first component: [any View]) -> [any View] {
        component
    }

    public static func buildEither(second component: [any View]) -> [any View] {
        component
    }
}
