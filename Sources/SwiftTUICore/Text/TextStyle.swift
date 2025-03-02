//
//  TextStyle.swift
//  SwiftTUI
//
//  Created by Ihar Biaspalau on 7.02.25.
//

import ANSI

extension Text {
    public enum TextStyle: Sendable {
        case bold
        case dim
        case italic
        case underline
        case slowBlink
        case rapidBlink
        case invert
        case hide
        case strike
        case font(Font)
        case noBold
        case normal
        case noItalic
        case noUnderline
        case noBlink
        case proportionalSpacing
        case noInvert
        case noHide
        case noStrike
        case color(Color)
        case background(Color)
        case noProportionalSpacing
        case frame
        case encircle
        case overline
        case noFrameNoEncircle
        case noOverline
        case underlineColor(Color)
        case ideogramUnderline
        case ideogramDoubleUnderline
        case ideogramOverline
        case ideogramDoubleOverline
        case ideogramStressMarking
        case noIdeogram
        case superscript
        case `subscript`
        case noSuperscriptNoSubscript
    }
}

extension Text.TextStyle {
    var selectGraphicRendition: SelectGraphicRendition {
        switch self {
        case .bold: .bold
        case .dim: .dim
        case .italic: .italic
        case .underline: .underline
        case .slowBlink: .slowBlink
        case .rapidBlink: .rapidBlink
        case .invert: .invert
        case .hide: .hide
        case .strike: .strike
        case .font(let font): .font(font)
        case .noBold: .noBold
        case .normal: .normal
        case .noItalic: .noItalic
        case .noUnderline: .noUnderline
        case .noBlink: .noBlink
        case .proportionalSpacing: .proportionalSpacing
        case .noInvert: .noInvert
        case .noHide: .noHide
        case .noStrike: .noStrike
        case .color(let color): .foregroundColor(color)
        case .background(let color): .backgroundColor(color)
        case .noProportionalSpacing: .noProportionalSpacing
        case .frame: .frame
        case .encircle: .encircle
        case .overline: .overline
        case .noFrameNoEncircle: .noFrameNoEncircle
        case .noOverline: .noOverline
        case .underlineColor(let color): .underlineColor(color)
        case .ideogramUnderline: .ideogramOverline
        case .ideogramDoubleUnderline: .ideogramDoubleUnderline
        case .ideogramOverline: .ideogramOverline
        case .ideogramDoubleOverline: .ideogramDoubleOverline
        case .ideogramStressMarking: .ideogramStressMarking
        case .noIdeogram: .noIdeogram
        case .superscript: .superscript
        case .subscript: .subscript
        case .noSuperscriptNoSubscript: .noSuperscriptNoSubscript
        }
    }
}
