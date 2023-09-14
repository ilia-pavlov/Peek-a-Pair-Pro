//
//  Pie.swift
//  Peek-a-Pair Pro
//
//  Created by Ilia Pavlov on 9/13/23.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle // Angle conform to protocol Animatable with var animatableData: Self.AnimatableData
    var endAngle: Angle
    var clockwise: Bool = false
     
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start: CGPoint = .init(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        
        var pen = Path()
        pen.move(to: center)
        pen.addLine(to: start)
        pen.addArc(center: center,
                   radius: radius,
                   startAngle: startAngle,
                   endAngle: endAngle,
                   clockwise: !clockwise)
        pen.addLine(to: center)
        
        return pen
    }
    
}
