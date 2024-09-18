//
//  CardView.swift
//  Memorize
//
//  Created by Marco Trivisonno on 18/09/24.
//

import SwiftUI

// Views are read-only.
struct CardView: View {
    let content: String
    // This is a state variable, so it can change.
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            // local variable in @ViewBuilder
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 4)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }.onTapGesture(perform: {
            isFaceUp.toggle()
        })
    }
}
