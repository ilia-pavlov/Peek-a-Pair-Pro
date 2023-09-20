//
//  Cardify.swift
//  Peek-a-Pair Pro
//
//  Created by Ilia Pavlov on 9/13/23.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if isFaceUp {
                shape.foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
//                content
            } else {
                shape
            }
            // to animate both card we need have `context` for implicit animation
            // on screen so we do a trick with .opacity where 0 is invisible
            content
                .opacity(isFaceUp ? 1 : 0)
        }
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
