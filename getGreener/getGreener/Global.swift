//
//  EnvironmentObjects.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-01-18.
//

import SwiftUI

class Global: ObservableObject {
    @Published var progress = 0.0
    @Published var selectedPieChartElement: Int? = nil
    @Published var pieChartViewModel: PieChartViewModel = PieChartViewModel()
}
