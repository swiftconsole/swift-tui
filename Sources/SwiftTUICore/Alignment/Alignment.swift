//
//  Alignment.swift
//  SwiftTUI
//
//  Created by Ihar Biaspalau on 7.02.25.
//

public struct Alignment: Equatable {
    public var horizontal: HorizontalAlignment
    public var vertical: VerticalAlignment

    public init(horizontal: HorizontalAlignment, vertical: VerticalAlignment) {
        self.horizontal = horizontal
        self.vertical = vertical
    }

    public static func == (left: Alignment, right: Alignment) -> Bool {
        false
    }
}
