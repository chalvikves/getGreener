//
//  HomeViewModel.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-02-04.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var data: [PieChartModel] = [
        PieChartModel(nameID: "el" ,emission: .el, percentage: 0.1, description: "El", color: .blue, icon: "bolt"),
        PieChartModel(nameID: "kons", emission: .konsumtion, percentage: 0.3, description: "Konsumtion", color: .green, icon: "case"),
        PieChartModel(nameID: "mat", emission: .mat, percentage: 0.4, description: "Mat", color: .red, icon: "leaf"),
        PieChartModel(nameID: "transport", emission: .transport, percentage: 0.2, description: "Transport", color: .purple, icon: "car")
    ]
    
    let ranges = ["Dag", "Månad", "År"]
    
    @Published var selectedElement: Int? = nil
    @Published var selected: Bool = false
    @Published var alertShow: Bool = false
    @Published var selectedPie: PieChartModel? = nil
    @Published var showDayWeekYear: Bool = false
    @Published var selectedRange: String = "Dag"
    
    func dismissSheet() {
        selected = false
        selectedElement = nil
    }
    
    func setDay() {
        selectedRange = ranges[0]
    }
    
    func setWeek() {
        selectedRange = ranges[1]
    }
    
    func setYear() {
        selectedRange = ranges[2]
    }
    
}
