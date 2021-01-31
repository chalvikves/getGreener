//
//  ContentView.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2020-12-03.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif


struct ContentView: View {
    
    var body: some View {
      
        TabBar()
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





struct TabBar: View {
    
    @State private var selectedTab = "car"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var xAxis: CGFloat = 0
    @Namespace var animation
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $selectedTab) {
                
                DailyQuestions()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("car")
                
                Home()
                    .tag("house")
                
                PersonView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("person")
                
            }
            
            HStack(spacing: 0) {
                
                ForEach(tabs, id: \.self){image in
                    
                    GeometryReader { reader in
                        
                        Button(action: {
                            withAnimation(.spring()){
                                selectedTab = image
                                xAxis = reader.frame(in: .global).minX
                            }
                        }, label: {
                        
                            Image(systemName: image)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(selectedTab == image ? Color("Green") : Color("darkerGrey"))
                                .padding(selectedTab == image ? 15 : 0)
                                .background(Color.white.opacity(selectedTab == image ? 1 : 0).clipShape(Circle()))
                                .matchedGeometryEffect(id: image, in: animation)
                                .offset(x: selectedTab == image ? (reader.frame(in: .global).minX - reader.frame(in: .global).midX) : 0, y: selectedTab == image ? -14 : 0)
                        
                        })
                        .onAppear(perform: {
                            if image == tabs[1]{
                                xAxis = reader.frame(in: .global).minX
                            }
                        })
                }
                    .frame(width: 25, height: 30)
                        
                    if image != tabs.last { Spacer(minLength: 0) }
                        
                }
                
            }
            .padding(.horizontal, 30)
            .padding(.vertical)
            .background(Color("WeirdGreen").cornerRadius(12))
                            //.clipShape(CustomShape(xAxis: xAxis)).cornerRadius(12))
            .padding(.horizontal)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

var tabs = ["car", "house", "person"]

struct CustomShape: Shape {
    
    var xAxis: CGFloat
    
    var animatableData: CGFloat{
        get{return xAxis}
        set{xAxis = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = xAxis
            
            path.move(to: CGPoint(x: center - 50, y: 0))
            
            let to1 = CGPoint(x: center, y: 35)
            let control1 = CGPoint(x: center - 25, y: 0)
            let control2 = CGPoint(x: center - 25, y: 35)
            
            let to2 = CGPoint(x: center + 50, y: 0)
            let control3 = CGPoint(x: center + 25, y: 35)
            let control4 = CGPoint(x: center + 25, y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}
