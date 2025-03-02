//
//  VStack.swift
//  SwiftTUI
//
//  Created by Ihar Biaspalau on 6.02.25.
//

import ANSI

public struct VStack: View {
    let views: [any View]
    let alignment: HorizontalAlignment
    let spacing: Int

    public init(
        alignment: HorizontalAlignment = .leading, spacing: Int = 0,
        @ViewBuilder content: () -> [any View]
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.views = content()
    }

    public func render(maxWidth: Int, asPlain: Bool = false) -> [[String]] {
        let renderedViews = views.map {
            $0.render(maxWidth: maxWidth, asPlain: asPlain)
        }
        let renderedPlainViews = views.map {
            $0.render(maxWidth: maxWidth, asPlain: true)
        }

        var result: [[String]] = []

        for (viewIndex, viewLines) in renderedViews.enumerated() {
            for (lineIndex, line) in viewLines.enumerated() {
                let styledContent = line.joined(separator: " ")
                let plainContent = renderedPlainViews[viewIndex][lineIndex]
                    .joined(separator: " ")
                let plainLength = plainContent.count
                let paddingNeeded = max(0, maxWidth - plainLength)

                let adjustedContent =
                    switch alignment {
                    case .leading:
                        styledContent
                            + String(repeating: " ", count: paddingNeeded)
                    case .center:
                        String(repeating: " ", count: paddingNeeded / 2)
                            + styledContent
                            + String(repeating: " ", count: paddingNeeded / 2)
                    case .trailing:
                        String(repeating: " ", count: paddingNeeded)
                            + styledContent
                    }

                result.append([adjustedContent])
            }
        }

        return result
    }
}

extension VStack {
    public func inspectList(as type: InspectType) -> [String] {
        views.flatMap { $0.inspectList(as: type) }
    }
}
