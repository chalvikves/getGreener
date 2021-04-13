//
//  SecondTransportView.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-03-26.
//

import SwiftUI
import ToastUI

struct SecondTransportView: View {
    
    @Binding var pageIndex: Int
    @Binding var selectedWalk: Bool
    @Binding var selectedBike: Bool
    @Binding var selectedCar: Bool
    @Binding var selectedTrain: Bool
    @Binding var selectedBus: Bool
    @Binding var selectedNothing: Bool
    @State var showToast = false
    
    var body: some View {
        
        
        VStack(alignment: .leading){
            
            Text("Vilka transportmedel använde du idag?")
                .font(.title2)
                .fontWeight(.medium)
                .padding(.leading)
                .padding(.bottom, 5)
             
            Text("Du kan välja flera alternativ")
                .font(.subheadline)
                .fontWeight(.regular)
                .padding(.leading)
                .padding(.bottom, 20)
                .foregroundColor(Color("SecondaryText"))
            
            
            VStack(spacing: 10){
                TransportationMethod(image: "figure.walk", title: "   Gå", selected: $selectedWalk)
                
                TransportationMethod(image: "bicycle", title: "Cykel", selected: $selectedBike)
                
                TransportationMethod(image: "car", title: "  Bil", selected: $selectedCar)
                
                TransportationMethod(image: "tram", title: "   Tåg", selected: $selectedTrain)
                
                TransportationMethod(image: "bus.fill", title: "   Buss", selected: $selectedBus)
                
                TransportationMethod(image: "bed.double", title: "   Inget", selected: $selectedNothing)
                
            }.padding(.bottom)
            .padding(.horizontal)
            
            
            HStack{
                Spacer()
                
                Button(action: {
                    if !(selectedBus || selectedBike || selectedCar || selectedWalk || selectedTrain || selectedNothing) {
                        showToast.toggle()
                    }
                    else{
                        withAnimation {
                            self.pageIndex = 1
                        }
                    }
                }){
                    Text("Gå vidare")
                }
                .frame(width: 200)
                .foregroundColor(Color("Main"))
                .padding()
                .background(Color("Green"))
                .cornerRadius(30)
                .toast(isPresented: $showToast, dismissAfter: 1.5){
                    ToastView("Du måste välja minst ett alternativ"){
                        
                    } background: {
                        
                    }
                    .toastViewStyle(ErrorToastViewStyle())
                }
                
                
                
                Spacer()
            }
                
            
            
            Spacer()
            
        }
        
        
        
    }
}


