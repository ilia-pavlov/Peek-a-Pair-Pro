//
//  CustomButton.swift
//  Peek-a-Pair Pro
//
//  Created by Ilia Pavlov on 9/19/23.
//

import SwiftUI

struct CustomButton: View {
    var buttonName: String
    var buttonImage: String
    var action: () -> ()

    var body: some View {
        Button(action: {
            withAnimation {
                action()
            }
        }) {
            VStack {
                Button(buttonName) {
                    withAnimation {
                        action()
                    }
                }
                .buttonStyle(SymbolButtonStyle(systemName: buttonImage))
                .frame(width: 64, height: 64)
                Text(buttonName)
                    .foregroundColor(.blue)
            }
        }
    }
}


