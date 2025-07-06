//
//  VibesHeader.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI

struct VibesHeader: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Tap the emoji that matches")
            Text("your today's mood.")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .font(.system(size: 24, weight: .bold))
        .padding(.top)
    }
}

#Preview {
    VibesHeader()
}
