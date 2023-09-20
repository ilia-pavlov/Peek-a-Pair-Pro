//
//  SymbolButtonStyle.swift
//  Peek-a-Pair Pro
//
//  Created by Ilia Pavlov on 9/19/23.
//

import SwiftUI

struct SymbolButtonStyle: ButtonStyle {
    let systemName: String
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
           Circle()
                .foregroundColor(configuration.isPressed ? Color.red : Color.blue)
            
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.white)
                .padding(8)
        }
        
        .accessibilityRepresentation { configuration.label }
    }
}
