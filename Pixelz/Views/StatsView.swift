//
//  StatsView.swift
//  Pixelz
//
//  Created by Dariusz Ciesla on 15/05/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        HStack {
            Text("Moves:").bold()
            Text("23")
            Spacer()
            Text("Time:").bold()
            Text("03:00.342")
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
