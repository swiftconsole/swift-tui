//
//  HStack.swift
//  SwiftTUI
//
//  Created by Ihar Biaspalau on 6.02.25.
//

import ANSI
import Foundation

public struct HStack {
    let views: [any View]
    let alignment: VerticalAlignment
    let spacing: Int
    var isFixedHorizontalSize: Bool = false

    public init(
        alignment: VerticalAlignment = .center, spacing: Int = 0,
        @ViewBuilder _ content: () -> [any View]
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.views = content()
    }
}

extension HStack {
    public func fixedSize(horizontal: Bool = false, vertical: Bool = false)
        -> Self {
        var new = self
        new.isFixedHorizontalSize = horizontal
        return new
    }
}

extension HStack: View {
    public func render(maxWidth: Int, asPlain: Bool = false) -> [[String]] {
        let columnWidth =
            isFixedHorizontalSize ? maxWidth / max(views.count, 1) : 0

        let renderedPlainViews = views.map {
            $0.render(maxWidth: columnWidth, asPlain: true)
        }
        let renderedViews = views.map {
            $0.render(maxWidth: columnWidth, asPlain: asPlain)
        }

        let maxLines = renderedPlainViews.map { $0.count }.max() ?? 0

        var result: [[String]] = Array(
            repeating: Array(repeating: "", count: views.count), count: maxLines
        )

        for (viewIndex, plainView) in renderedPlainViews.enumerated() {
            for line in 0..<maxLines {
                let plainContent =
                    line < plainView.count
                    ? plainView[line].joined(separator: " ") : ""
                let styledContent =
                    line < renderedViews[viewIndex].count
                    ? renderedViews[viewIndex][line].joined(separator: " ") : ""
                let plainLength = plainContent.count
                let paddingNeeded = max(0, columnWidth - plainLength)
                let adjustedContent =
                    styledContent + String(repeating: " ", count: paddingNeeded)

                result[line][viewIndex] = adjustedContent
            }
        }

        return result.map { row in
            [row.joined(separator: String(repeating: " ", count: spacing))]
        }
    }
}

extension HStack {
    public func inspectList(as type: InspectType) -> [String] {
        views.flatMap { $0.inspectList(as: type) }
    }
}
