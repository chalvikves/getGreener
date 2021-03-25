//
//  PieChartPiece.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-02-06.
//

import SwiftUI

struct PieChartPiece: Shape {
    let startDegree: Angle
    let endDegree: Angle
    
    func path(in rect: CGRect) -> Path {
        
        Path { p in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            p.move(to: center)
            p.addArc(center: center, radius: rect.width / 2, startAngle: startDegree, endAngle: endDegree, clockwise: false)
            p.closeSubpath()
        }
        
    }
}
