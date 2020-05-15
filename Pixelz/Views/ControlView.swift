//
//  ControlView.swift
//  Pixelz
//
//  Created by Dariusz Ciesla on 15/05/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import SwiftUI

struct ControlView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(0..<5, id: \.self) { item in
                return TileView(tile: Tile(value: item))
                    .aspectRatio(1, contentMode: .fit)
            }
        }
        .border(Color.primary, width: 5)
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView()
    }
}
