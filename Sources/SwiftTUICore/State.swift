//
//  State.swift
//  SwiftTUI
//
//  Created by Ihar Biaspalau on 5.02.25.
//

@propertyWrapper
public struct State<T> {
    private var value: T

    public init(wrappedValue: T) {
        self.value = wrappedValue
    }

    public var wrappedValue: T {
        get { value }
        set { value = newValue }
    }
}
