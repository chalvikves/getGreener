//
//  DailyQuestions.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-01-17.
//

import SwiftUI

let transport = "Ange de resor du gjort idag och hur du transporterades"
let food = "Ange de måltider du ätit idag"
let consumption = "Ange konsumtion idag"



struct DailyQuestions: View {
    
    @State private var showingDetail = false
    
    
    var body: some View {
        
        Button(action: {
            self.showingDetail.toggle()
        }) {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("Green"))
                .frame(width: 250, height: 50)
                .padding()
                .overlay(
                    VStack(alignment: .leading){
                        Text("Besvara/Ändra dina vardagsfrågor")
                            .scaledToFill()
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                            .foregroundColor(Color("White"))
                            .padding()
                    }.padding()
                )
        }
        .sheet(isPresented: $showingDetail) {
           DailyWord()
        }
        
        
        
        
        
        
    }
}

struct DailyWord: View {
    
    @State private var doIWantThisViewToShow = false
    
    var body: some View {
        
        
        NavigationView{
            
            VStack(spacing: 20){
                
                //Text("Vardagsfrågor")
                //    .font(.title)
                //    .padding()
                
                Image("Ecology_Outline")
                    
                
                //Image(systemName: "globe")
                //    .resizable()
                //    .frame(width: 100, height: 100)
                //    .padding(.bottom, 30)
                //    .padding(.top, 30)
            
            ScrollView(showsIndicators: false){
                
                    VStack(spacing: 8){
                        
                        Divider()
                        
                        GroupBox(label: Label("Transport", systemImage: "car")){
                            HealthValueView(value: "50", unit: "Kg")
                        }
                        .groupBoxStyle(HealthGroupBoxStyle(color: Color("Green"), destination: TransportQuestion() ))
                        
                        
                        Divider()
                        
                        GroupBox(label: Label("Mat", systemImage: "leaf")){
                            HealthValueView(value: "50", unit: "Kg")
                        }.groupBoxStyle(HealthGroupBoxStyle(color: Color("Green"), destination: Text("Hello")))
                        
                        Divider()
                        
                        GroupBox(label: Label("Konsumption", systemImage: "case")){
                            HealthValueView(value: "50", unit: "Kg")
                        }.groupBoxStyle(HealthGroupBoxStyle(color: Color("Green"), destination: Text("Hello")))
                        
                        Divider()
                        
                    }.padding()
                    
                    
                    
                    
                }.edgesIgnoringSafeArea(.bottom)
            }.navigationTitle(Text("Vardagsfrågor"))
        }
    }
    
}

struct DailyQuestions_Previews: PreviewProvider {
    static var previews: some View {
        DailyQuestions()
    }
}
