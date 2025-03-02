//
//  Helpers.swift
//  SwiftTUI
//
//  Created by Ihar Biaspalau on 3.03.25.
//

import Foundation

struct Helpers {
    static func getTerminalWidth() -> Int {
        var winsize = winsize()
        if ioctl(fileno(stdout), TIOCGWINSZ, &winsize) == 0 {
            return Int(winsize.ws_col)
        }
        return 80
    }
}
