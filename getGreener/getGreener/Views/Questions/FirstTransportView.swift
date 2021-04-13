//
//  FirstTransportView.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-01-17.
//

import SwiftUI
import ToastUI

struct FirstTransportView: View {
    
    // MARK: Göra en standard sida för alla frågor och skicka in content som variabel så man kan ändra utifrån det. Kolla mobbin.design patterns quizzes.
    // MARK: Använd PagesView för att visa alla sidor. 
    
    @State private var val = ""
    @State private var sel: Int? = 0
    @State private var isEditingText = false
    @State private var total = 0
    @StateObject var global: Global = Global()
    
    
    @Binding var showView: Bool
    
    let numFormatter = NumberFormatter()
    
    @Binding var pageIndex: Int
    @State var showToast = false
    
    var body: some View {
        
        
        VStack(alignment: .leading){
            
            Text("Hur många km har du transporterats idag?")
                .font(.title2)
                .fontWeight(.medium)
                .padding(.leading)
                .padding(.bottom, 80)
                .padding(.top, 40)
                
            TextField(
                "Ange antal km",
                text: $val
            ){ isEditing in
                self.isEditingText = isEditing
            } onCommit: {
                print(val)
            }
            .font(.title)
            .foregroundColor(Color("Pastel"))
            .accentColor(Color("Green"))
            .disableAutocorrection(true)
            .textContentType(.oneTimeCode)
            .keyboardType(.numbersAndPunctuation)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 50)
            
            Divider()
                .padding(.horizontal, 50)
            
            Spacer()
                .frame(height: 100)
            
            HStack{
                Spacer()
                
                VStack(alignment: .center){
                    
                    Button("Avbryt") {
                        hideKeyboard()
                        self.showView = false
                        withAnimation {
                            self.pageIndex = 0
                        }
                        
                    }
                    .frame(width: 200)
                    .foregroundColor(Color("Main"))
                    .padding()
                    .background(Color("Green"))
                    .cornerRadius(30)
                    
                    Button(action: {
                        if val.isEmpty {
                            showToast.toggle()
                        }
                        else {
                            hideKeyboard()
                            self.showView = false
                            print(val)
                            withAnimation {
                                self.pageIndex = 0
                            }
                        }
                    }){
                        Text("Spara")
                    }
                    .frame(width: 200)
                    .foregroundColor(Color("Main"))
                    .padding()
                    .background(Color("Green"))
                    .cornerRadius(30)
                    .toast(isPresented: $showToast, dismissAfter: 1.5){
                        ToastView("Du måste ange antal km"){
                            
                        } background: {
                            
                        }
                        .toastViewStyle(ErrorToastViewStyle())
                    }
                    
                    Spacer()
                    
                }
                Spacer()
            }
            //.padding(.horizontal)
            //.padding(.leading, UIScreen.main.bounds.size.width/2.5)
            
            Spacer()
            
        }
    }
    
}
