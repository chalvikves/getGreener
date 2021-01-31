//
//  PieChart.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-01-08.
//

import SwiftUI

struct PieChart: View {
    let center = CGPoint.init(x: 187, y: 187)
    var body: some View {
        ZStack{
            Path { p in
                p.move(to: CGPoint(x: 187, y:187))
                p.addArc(center: center, radius: 150, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 190), clockwise: true)
            }.fill(Color("Green"))
            
            Path { p in
                p.move(to: CGPoint(x: 187, y:187))
                p.addArc(center: center, radius: 150, startAngle: Angle(degrees: 190), endAngle: Angle(degrees: 110), clockwise: true)
            }.fill(Color("LightGreen"))
            
            Path { p in
                p.move(to: CGPoint(x: 187, y:187))
                p.addArc(center: center, radius: 150, startAngle: Angle(degrees: 110), endAngle: Angle(degrees: 90), clockwise: true)
            }.fill(Color("WeirdGreen"))
            
            
            Path { p in
                p.move(to: CGPoint(x: 187, y:187))
                p.addArc(center: center, radius: 150, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 360), clockwise: true)
                p.closeSubpath()
            }
            .fill(Color("DarkGreen"))
            .offset(x: 20, y: 20)
            .overlay(
                Text("Hellu")
                    .offset(x: 80, y: -100)
            )
        }
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart()
    }
}
