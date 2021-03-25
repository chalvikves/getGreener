//
//  DailyQuestions.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-01-17.
//

import SwiftUI

let transport = "Ange de resor du gjort idag och hur du transporterades"
let food = "Ange de måltider du ätit idag"
let consumtion = "Ange konsumtion idag"



struct DailyQuestions: View {

    
    @State private var doIWantThisViewToShow = false
    @State private var stageTransport = 2.0
    private var totalStage = 3.0
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading, spacing: 20){
                
                Text("Dagliga frågor")
                    .font(.largeTitle)
                    .padding(.top, 40)
                
                
                ScrollView(showsIndicators: false){
                    Spacer().frame(height: 20)
                    
                    VStack{
                        
                        NavigationLink(destination: FirstView()){
                            VStack{
                                DailyQuestionBox(title: "Transport", image: "car", color: Color("Green"), stageQuestion: stageTransport, totalQuestion: totalStage, value: 30, unit: "Kg")
                            }
                            .background(Color("Main"))
                            .cornerRadius(15)
                            .shadow(color: Color("MainShadow"), radius: 5)
                        }
                        
                        Spacer().frame(height: 20)
                        
                        NavigationLink(destination: Text("Hi")){
                            VStack{
                                DailyQuestionBox(title: "Mat", image: "leaf", color: Color("SGreen"), stageQuestion: stageTransport, totalQuestion: totalStage, value: 150, unit: "Kg")
                            }
                            .background(Color("Main"))
                            .cornerRadius(15)
                            .shadow(color: Color("MainShadow"), radius: 5)
                        }
                        
                        Spacer().frame(height: 100)
                        
                        HStack(spacing: 100){
                            
                            Button(action: {stageTransport = 1.0}, label: {
                                Text("1.0")
                            })
                            
                            Button(action: {stageTransport = 2.0}, label: {
                                Text("2.0")
                            })
                            
                            Button(action: {stageTransport = 3.0}, label: {
                                Text("3.0")
                            })
                            
                        }
                        
                    }
                    .padding(.horizontal)
                    
                }
                
                
            }.padding(.horizontal)
            
            .navigationBarHidden(true)
            
        }
        
        
        
        
    }
}

struct DailyQuestions_Previews: PreviewProvider {
    static var previews: some View {
        DailyQuestions()
    }
}
