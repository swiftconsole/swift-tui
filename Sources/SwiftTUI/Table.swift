//
//  Table.swift
//  SwiftTUI
//
//  Created by Ihar Biaspalau on 2.03.25.
//

import ANSI

public struct Table: View {
    var rows: [[String]]

    public init(_ rows: [[String]]) {
        self.rows = rows
    }

    public var body: some View {
        VStack {
            for cells in rows {
                HStack {
                    for cell in cells {
                        Text(cell).italic()
                    }
                }
                .fixedSize(horizontal: true, vertical: false)
            }
        }
    }
}
