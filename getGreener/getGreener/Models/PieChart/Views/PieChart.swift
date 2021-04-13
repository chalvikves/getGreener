//
//  PieChart.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-02-06.
//

import SwiftUI

struct PieChart: View {
    @StateObject var viewModel: HomeViewModel
    @Environment(\.colorScheme) var colorScheme
    var width: CGFloat?
    var height: CGFloat?
    
    var body: some View {
        
            ZStack{
                ForEach(0..<viewModel.data.count, id: \.self) { index in
                    let currentData = viewModel.data[index]
                    let currentEndDegree = currentData.percentage * 360
                    let lastDegree = viewModel.data.prefix(index).map {$0.percentage}.reduce(0, +) * 360
                    
                    ZStack{
                        
                        PieChartPiece(startDegree: Angle(degrees: lastDegree), endDegree: Angle(degrees: (lastDegree + currentEndDegree)))
                            .fill(currentData.color)
                            //.scaleEffect(index == viewModel.selectedElement ? 1.1 : 1.0)
                        
                        //GeometryReader { geometry in
                            //Text(currentData.description)
                              //  .font(.custom("System", size: 14))
                                //.foregroundColor(.white)
                            //Image(systemName: currentData.icon)
                            //    .foregroundColor(.white)
                            //    .position(getLabelCoordinate(in: geometry.size, for: lastDegree + (currentEndDegree / 2)))
                            //    .scaleEffect(index == viewModel.selectedElement ? 1.1 : 1.0)
                        //}
                        
                    }
//                    .onTapGesture(count: 1, perform: {
//                        withAnimation{
//                            if index == viewModel.selectedElement {
//                                viewModel.selectedElement = nil
//                            } else {
//                                viewModel.selectedElement = index
//                                viewModel.selected = true
//                            }
//                        }
//                    })
                    
                }
                .shadow(color: Color("LightShadow"), radius: 5)
                Circle()
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .frame(width: width, height: height)
                    .overlay(
                        VStack{
                            
//                            HStack{
//                                Spacer()
//                                Button(action: {
//                                    viewModel.alertShow.toggle()
//                                }) {
//                                    Image(systemName: "questionmark.circle")
//                                }
//                                .alert(isPresented: $viewModel.alertShow) {
//                                    Alert(
//                                        title: Text("CO2 utsläpp/månad"),
//                                        message: Text("viewModel.textAboutSwedish"),
//                                        dismissButton: .default(Text("Jag förstår"))
//                                    )
//                                    
//                                }
//                                .padding(.trailing, 30)
//                                .foregroundColor(Color.black)
//                            }
                            
                            Text("150")
                                //.font(.largeTitle)
                                .font(.title2)
                            
                            Text("kg/CO2")
                                //.font(.title3)
                                .font(.subheadline)
                        }
                    )
            }
        
        
    }
    
    private func getLabelCoordinate(in geoSize: CGSize, for degree: Double) -> CGPoint {
        let center = CGPoint(x: geoSize.width / 2, y: geoSize.height / 2)
        let radius = geoSize.width / 2.7
        
        let yCoordinate = radius * sin(CGFloat(degree) * (CGFloat.pi / 180))
        let xCoordinate = radius * cos(CGFloat(degree) * (CGFloat.pi / 180))
        
        return CGPoint(x: xCoordinate + center.x, y: yCoordinate + center.y)
    }
    
}
