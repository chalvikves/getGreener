//
//  TransportQuestion.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-01-17.
//

import SwiftUI
import iTextField

struct TransportQuestion: View {
    
    @StateObject var global: Global = Global()
    
    var body: some View {
        
        NavigationView{
        
            VStack{
                
                VStack(alignment: .trailing){
                    ProgressView(value: self.global.progress, total: 3.0)
                        .accentColor(Color("LightGreen"))
                        
                    
                    Text("\(Int(self.global.progress)) / 3")
                    
                }.padding(.top, -90)
                
                
                Spacer()
                
                FirstView().opacity(self.global.progress == 1 ? 1 : 0)
                
                SecondView().opacity(self.global.progress == 2 ? 1 : 0)
                  
                ThirdView().opacity(self.global.progress == 3 ? 1 : 0)
                
                Spacer()
                
            }.padding()
            
            
        }.navigationTitle(Text("Transport"))
        .navigationBarBackButtonHidden(true)
        .environmentObject(global)
        
        
        
        
        
    }
    
}
    
struct TransportQuestion_Previews: PreviewProvider {
    static var previews: some View {
        TransportQuestion().environmentObject(Global())
    }
}

struct FirstView: View {
    
    @State private var val = ""
    @State private var sel: Int? = 0
    @State private var isEditingText = false
    @State private var total = 0
    @StateObject var global: Global = Global()
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("Ange antal km transporterats:")
                .font(.title2)
            
            TextField(
                "Km",
                text: $val
            ){ isEditing in
                self.isEditingText = isEditing
            }
            .font(.title2)
            .foregroundColor(Color("LightGreen"))
            .accentColor(Color("Green"))
            .multilineTextAlignment(.leading)

        }.padding(.top, -90)
        
        Spacer()
        
        HStack{
            
            Button(action: {}) {
                HStack(spacing: 10){
                    Image(systemName: "chevron.backward")
                    Text("Back")
                }
                
            }.opacity(self.global.progress == 1 ? 0 : 1)
            .foregroundColor(Color(.systemGray))
            
            Spacer()
            
            //NavigationLink(destination: SecondView(), tag: 1, selection: $sel) {}
            Button(action: {
               // self.sel = 1
                self.global.progress += 1
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
        
        
    }
    
}

struct SecondView: View {
    
    @EnvironmentObject var global: Global
    @State private var hee = 1.0
    @State private var isEditin = false
    @State private var sel: Int? = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
    
            VStack{
                

                VStack(spacing: 20){
            
                    Slider(
                        value: $hee,
                        in: 1...5,
                        step: 1,
                        onEditingChanged: { editing in
                            isEditin = editing
                        }
            
                    ).padding()
                    .accentColor(Color("LightGreen"))
            
                    HStack(spacing: 50){
            
                        TransportationMethod(image: "figure.walk", title: "Gå")
            
                        TransportationMethod(image: "bicycle", title: "Cykel")
            
                        TransportationMethod(image: "car", title: "Bil")
            
                        TransportationMethod(image: "tram", title: "Tåg")
            
                        TransportationMethod(image: "bus.fill", title: "Buss")
            
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                    .padding(.trailing, 20)
                    .padding(.leading, 10)
            
                }
                
                Spacer()
                
                HStack{
                    
                    
                    Button(action: {
                        self.global.progress -= 1
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack(spacing: 10){
                            Image(systemName: "chevron.backward")
                            Text("Back")
                        }
                        
                    }.opacity(self.global.progress == 1 ? 0 : 1)
                    .foregroundColor(Color(.systemGray))
                    
                    Spacer()
                    
                    //NavigationLink(destination: ThirdView(), tag: 1, selection: $sel) {}
                    Button(action: {
                        //self.sel = 1
                        self.global.progress += 1
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
                
                Spacer()
                
            }.padding()
            .navigationBarBackButtonHidden(true)
    }
}

struct ThirdView: View {
    @EnvironmentObject var global: Global
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
       
        
            VStack{
                
                HStack{
                    
                    NavigationLink(destination: SecondView()) {
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

//VStack{
//
//    Text("\(total)")
//        .font(.system(size: 60, weight: .regular, design: .rounded))
//        .foregroundColor(Color("Green"))
//        .padding(.top, -80)
//
//
//
//
//    HStack(alignment: .center){
//        Text("Ange antal km transporterats:")
//            .scaledToFill()
//            .minimumScaleFactor(0.5)
//            .lineLimit(1)
//
//        TextField(
//            "Km",
//            text: $val
//
//        ){ isEditing in
//            self.isEditingText = isEditing
//        }
//        .font(.title3)
//        .foregroundColor(Color("LightGreen"))
//        .multilineTextAlignment(.leading)
//
//        Button(
//            action: { val = "" }
//        ) {
//            Image(systemName: "x.circle")
//                .foregroundColor(Color.gray)
//        }.opacity(isEditingText ? 1 : 0)
//        .padding(.trailing, isEditingText ? 0 : -40)
//
//
//    }.padding()
//    .padding(.bottom, 20)
//
//    Divider()
//        .frame(width: UIScreen.main.bounds.width, height: 1.5)
//        .background(Color("DarkGreen"))
//
//    VStack(spacing: 20){
//
//        Text("Transportmedel")
//            .padding()
//
//        Slider(
//            value: $hee,
//            in: 1...5,
//            step: 1,
//            onEditingChanged: { editing in
//                isEditin = editing
//            }
//
//        ).padding()
//        .accentColor(Color("LightGreen"))
//
//        HStack(spacing: 50){
//
//            TransportationMethod(image: "figure.walk", title: "Gå")
//
//            TransportationMethod(image: "bicycle", title: "Cykel")
//
//            TransportationMethod(image: "car", title: "Bil")
//
//            TransportationMethod(image: "tram", title: "Tåg")
//
//            TransportationMethod(image: "bus.fill", title: "Buss")
//
//        }
//        .padding(.horizontal, 10)
//        .padding(.bottom, 10)
//        .padding(.trailing, 20)
//        .padding(.leading, 10)
//
//    }
//
//    Spacer()
//}
