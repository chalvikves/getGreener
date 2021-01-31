//
//  home.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2020-12-21.
//

import SwiftUI
//import SunburstDiagram
//
//let configuration = SunburstConfiguration(nodes: [
//    Node(name: "Food", showName: true, value: 10.0, backgroundColor: .systemBlue),
//    Node(name: "Living", showName: false, value: 5.0, backgroundColor: .systemRed),
//    Node(name: "Consumation", showName: false, value: 10.0, backgroundColor: .systemPurple),
//    Node(name: "Transportation", showName: false, value: 50.0, backgroundColor: .systemTeal),
//])

struct Home: View {
    
    var body: some View {
        
        VStack{
            Text("GetGreener")
                .font(.largeTitle)
                .foregroundColor(Color("Green"))
            
            ScrollView{
                
                //HStack{
                //    Text("Översikt över dina utsläpp")
                //        .foregroundColor(.primary)
                    
                //    Spacer()
                //}.padding()
                
                //Divider()
                //    .frame(width: UIScreen.main.bounds.width, height: 2)
                //    .background(Color("DarkGreen"))
                
                Circle()
                    .frame(width: 300, height: 300)
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color("Green"))
                    .frame(height: 200)
                    .padding()
                    .overlay(
                        VStack(alignment: .leading){
                            Text("Tips för att minska ditt utsläpp")
                                .font(.title3)
                                .foregroundColor(Color("White"))
                                .padding()
                            
                            Spacer()
                        }.padding()
                    ).padding(.bottom, 50)
                    
                DailyQuestions()
                //addToView()
                
                
            }
            
            
        }
        .padding(.bottom, 20)
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        
        
        
        
        
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct addToView : View {
    
    var body: some View {
        
        VStack(spacing: 20){
            
            Text("Vardagsfrågor")
                .font(.title)
                .padding()
            
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
        
    }
    
}
}
