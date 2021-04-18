//
//  SelectTransportView.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-03-26.
//

import SwiftUI
import ToastUI

struct SelectTransportView: View {
    
    // Viewmodel
    @StateObject var model: DailyQuestionsViewModel
    
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
                TransportationMethod(image: "figure.walk", title: "   Gå", selected: $model.selectedWalk)
                
                TransportationMethod(image: "bicycle", title: "Cykel", selected: $model.selectedBike)
                
                TransportationMethod(image: "car", title: "  Bil", selected: $model.selectedCar)
                
                TransportationMethod(image: "tram", title: "   Tåg", selected: $model.selectedTrain)
                
                TransportationMethod(image: "bus.fill", title: "   Buss", selected: $model.selectedBus)
                
                TransportationMethod(image: "bed.double", title: "   Inget", selected: $model.selectedNothing)
                
            }.padding(.bottom)
            .padding(.horizontal)
            
            
            HStack{
                Spacer()
                
                Button(action: {
                    if model.errorHandleCheck() {
                        model.showToast.toggle()
                    }
                    else{
                        model.setPageIndex(1)
                    }
                }){
                    Text("Gå vidare")
                }
                .frame(width: 200)
                .foregroundColor(Color("Main"))
                .padding()
                .background(Color("Green"))
                .cornerRadius(30)
                .toast(isPresented: $model.showToast, dismissAfter: 1.5){
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


