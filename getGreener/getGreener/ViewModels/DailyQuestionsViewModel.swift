//
//  DailyQuestionsViewModel.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-04-16.
//

import Foundation

class DailyQuestionsViewModel: ObservableObject {
    
    // Index that controls what page the questions are on
    @Published var pageIndex: Int = 0
    
    // For the first question SelectTransportView
    @Published var selectedWalk: Bool = false
    @Published var selectedBike: Bool = false
    @Published var selectedCar: Bool = false
    @Published var selectedTrain: Bool = false
    @Published var selectedBus: Bool = false
    @Published var selectedNothing: Bool = false
    
    // Show success or error toast
    @Published var showToast = false
    
    // For second transport question page
    @Published var showView: Bool = false
    @Published var val = ""
    @Published var sel: Int? = 0
    @Published var isEditingText = false
    @Published var total = 0
    
    // Functions for first question SelectTransportView
    func errorHandleCheck() -> Bool {
        return !(self.selectedBus || self.selectedBike || self.selectedCar || self.selectedWalk || self.selectedTrain || self.selectedNothing)
    }
    
   func setPageIndex(_ i: Int) {
        self.pageIndex = i
    }
}
