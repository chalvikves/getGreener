//
//  ThirdTransportView.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-03-26.
//

import SwiftUI

struct ThirdTransportView: View {
    @EnvironmentObject var global: Global
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        
        NavigationView{
            
            VStack{
                
                HStack{
                    
                    NavigationLink(destination: Text("Hi")) {
                        Button(action: {
                            self.global.progress -= 1
                        }) {
                            HStack(spacing: 10){
                                Image(systemName: "chevron.backward")
                                Text("Back")
                            }
                            
                        }.opacity(self.global.progress == 1 ? 0 : 1)
                        .foregroundColor(Color(.systemGray))
                    }
                    
                    Spacer()
                    
                    //NavigationLink(destination: DailyQuestions()) {
                    Button(action: {
                        
                        self.global.progress = 1.0
                    }) {
                        ZStack{
                            
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color("Green"))
                            
                            Image(systemName: "arrow.forward")
                                .foregroundColor(.white)
                            
                            
                            
                        }
                    }
                }
                
                //}
                
                Spacer()
                
            }.padding()
            .navigationBarBackButtonHidden(true)
            
        }
        
    }
}
