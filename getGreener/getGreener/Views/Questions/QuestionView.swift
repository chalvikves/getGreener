//
//  QuestionView.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-03-29.
//

import SwiftUI
import PageView

let theme = PageControlTheme(backgroundColor: Color("Main"), dotActiveColor: Color("SecondaryText"), dotInactiveColor: Color(.systemGray5), dotSize: 7.0, spacing: 9.0, padding: 4.0, xOffset: 12.0, yOffset: -12.0)

struct QuestionView: View {
    @State var pageIndex = 0
    @State var showView = false
    @State var selectedWalk = false
    @State var selectedBike = false
    @State var selectedCar = false
    @State var selectedTrain = false
    @State var selectedBus = false
    @State var selectedNothing = false
    
    // MARK: Add pageIndex as variable to each view in pageview
    
    var body: some View {
        VStack(alignment: .center){
            Text("Dagliga frågor")
                .font(.headline)
                .padding(.top, -70)
            
            //Spacer()
            
            HPageView(selectedPage: $pageIndex, theme: theme){
                SecondTransportView(pageIndex: $pageIndex, selectedWalk: $selectedWalk, selectedBike: $selectedBike, selectedCar: $selectedCar, selectedTrain: $selectedTrain, selectedBus: $selectedBus, selectedNothing: $selectedNothing)
                FirstTransportView(showView: $showView, pageIndex: $pageIndex)
            }
            
            
            
        }
        
    }
    
}


