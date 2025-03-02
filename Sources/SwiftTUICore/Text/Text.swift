//
//  Text.swift
//  SwiftTUI
//
//  Created by Ihar Biaspalau on 6.02.25.
//

import ANSI
import ASCII

public struct Text: View {
    var content: String
    public var styles: [TextStyle] = []

    public init(_ content: String) {
        self.content = content
    }

    var styleEscapeSequence: EscapeSequence {
        let selectGraphicRenditions = styles.map(\.selectGraphicRendition)
        return EscapeSequence.controlSequence(
            .selectGraphicRendition(selectGraphicRenditions)
        )
    }

    var resetEscapeSequence: EscapeSequence {
        EscapeSequence.controlSequence(.selectGraphicRendition([.reset]))
    }

    public func inspectList(as type: InspectType = .name) -> [String] {
        styleEscapeSequence.inspectList(as: type) + [content]
            + resetEscapeSequence.inspectList(as: type)
    }

    public func render(maxWidth: Int, asPlain: Bool = false) -> [[String]] {
        if asPlain { return [[content]] }
        let result =
            "\(styleEscapeSequence.sequence.string())\(content)\(resetEscapeSequence.sequence.string())"
        return [[result]]
    }
}

extension Text {
    private func addingStyle(_ style: TextStyle) -> Text {
        var new = self
        new.styles.append(style)
        return new
    }

    public func style(_ style: TextStyle) -> Text {
        addingStyle(style)
    }

    public func style(_ styles: [TextStyle]) -> Text {
        var new = self
        styles.forEach { new.styles.append($0) }
        return new
    }

    public func style(_ styles: TextStyle...) -> Text {
        self.style(styles)
    }

    public func bold() -> Text {
        addingStyle(.bold)
    }

    public func bold(_ isActive: Bool) -> Text {
        isActive ? addingStyle(.bold) : self
    }

    public func italic() -> Text {
        addingStyle(.italic)
    }

    public func italic(_ isActive: Bool) -> Text {
        isActive ? addingStyle(.italic) : self
    }

    public func monospaced(_ isActive: Bool = true) -> Text {
        self
    }

    public func strikethrough(_ isActive: Bool = true) -> Text {
        self
    }

    public func underline() -> Text {
        addingStyle(.underline)
    }

    public func underline(_ isActive: Bool = true) -> Text {
        isActive ? addingStyle(.underline) : self
    }
}
