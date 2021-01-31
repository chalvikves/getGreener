//
//  HealthGroupBoxStyle.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-01-17.
//

import SwiftUI

struct HealthGroupBoxStyle<V: View>: GroupBoxStyle {
    var color: Color
    var destination: V
    var date: Date?
    
    @ScaledMetric var size: CGFloat = 1
    
    func makeBody(configuration: Configuration) -> some View {
        NavigationLink(destination: destination) {
            GroupBox(label: HStack {
                configuration.label.foregroundColor(color)
                Spacer()
                if date != nil {
                    Text("\(date!)").font(.footnote).foregroundColor(.secondary).padding(.trailing, 4)
                }
                Image(systemName: "chevron.right").foregroundColor(Color(.systemGray4)).imageScale(.small)
            }) {
                configuration.content.padding(.top)
            }
            
        }.buttonStyle(PlainButtonStyle())
    }
}

struct HealthValueView: View {
    var value: String
    var unit: String
    
    @ScaledMetric var size: CGFloat = 1
    
    @ViewBuilder var body: some View {
        HStack {
            Text(value).font(.system(size: 24 * size, weight: .bold, design: .rounded)) + Text(" \(unit)").font(.system(size: 14 * size, weight: .semibold, design: .rounded)).foregroundColor(.secondary)
            Spacer()
        }
    }
}
