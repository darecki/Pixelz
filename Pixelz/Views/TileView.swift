//
//  TileView.swift
//  Pixelz
//
//  Created by Dariusz Ciesla on 15/05/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import SwiftUI


struct TileView: View {
    let tile: Tile

    func color(tile: Tile) -> Color {
        guard let value = tile.value else { return .gray }
        switch value {
        case 0: return .blue
        case 1: return .orange
        case 2: return .yellow
        case 3: return .red
        case 4: return .green
        default: return .random
        }
    }

    var body: some View {
        color(tile: tile)
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(tile: Tile(value: 1))
    }
}
