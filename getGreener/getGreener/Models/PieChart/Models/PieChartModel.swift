//
//  PieChartModel.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-02-06.
//

import SwiftUI

protocol PieChartModelProvidable {
    var emission: Emissions { get }
    var percentage: Double { get }
    var color: Color { get }
    //var id: UUID { get }
}

protocol PieChartViewModelProvidable : ObservableObject {
    var data: [PieChartModel] { get }
}

enum Emissions {
    case el, transport, mat, konsumtion
}

struct PieChartModel: Identifiable {
    var id: String {
        nameID
    }
    let nameID: String
    let emission: Emissions
    let percentage: Double
    let description: String
    let color: Color
    let icon: String
}
