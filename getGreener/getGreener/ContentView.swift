//
//  ContentView.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2020-12-03.
//

import SwiftUI
import PartialSheet

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif


struct ContentView: View {
    
    let sheetManager: PartialSheetManager = PartialSheetManager()
    
    @State private var sel = 2
    
    var body: some View {
        TabView(selection: $sel){
            DailyQuestions()
                .tabItem{
                    Image(systemName: "pyramid")
                    Text("Questions")
                }.tag(1)
            
            Home()
                .tabItem{
                    Image(systemName: "house")
                    Text("Hem")
                }.tag(2)
            
            PersonView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Person")
                }.tag(3)
            
        }.accentColor(Color("Green"))
        .environmentObject(sheetManager)
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
