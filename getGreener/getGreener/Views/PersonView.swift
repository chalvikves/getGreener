//
//  PersonView.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-01-05.
//

import SwiftUI

struct PersonView: View {
    @State private var val = 200.0
    @State private var isEditing = false
    @State private var isEditingText = false
    @State private var username = "Viktor Vestlund"
    @State private var showingDetail = false
    @State private var showingFriends = false
    private var textAboutSwedish = "Snittsvensken är ansvarig för elva ton koldioxidutsläpp per år, eller 30 kilo per dag, enligt Naturvårdsverkets beräkningar. Detta blir ca 900 kilo per månad. För att minska ditt fotavtryck och hålla dig inom ramen en jordglob måste du ha ett mål på mindre än 600 kilo CO2 per månad."
    
    var body: some View {
        
        VStack{
            VStack{
                CircleAvatar(height: 100, width: 100, firstname: "Viktor", lastname: "Vestlund", color: Color.pink)
                    .shadow(radius: 10)
                
                Text("\(username)")
                    .font(.title2)
                    .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity)
            .background(
                ZStack{
                    
                    Image("Mountain").resizable().scaledToFill().padding(.top, 20)
                    Rectangle().foregroundColor(Color("Green").opacity(0.5))
                }
            )
            
            //.cornerRadius(30)
                
            ScrollView(showsIndicators: false){
                
                // MARK: USER INFO
                
                VStack(alignment: .leading){
                    Text("Användarinformation")
                        .foregroundColor(Color("WeirdGreen").opacity(0.6))
                        .padding(.bottom, -15)
                        .padding(.leading, 20)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    
                    HStack(spacing: 20){
                        
                        Image(systemName: "person")
                        
                        Text("Namn")
                        
                        Spacer()
                        
                        HStack{
                            
                            TextField(
                                "Namn",
                                text: $username
                            ){ isEditing in
                                self.isEditingText = isEditing
                            }
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color.gray)
                            
                            Button(
                                action: { username = "" }
                            ) {
                                Image(systemName: "x.circle")
                                    .foregroundColor(Color.gray)
                                }.opacity(isEditingText ? 1 : 0)
                        
                        }.padding(.trailing, isEditingText ? 0 : -20)
                           
                            
                    }.padding()
                    
                 
                }
                .background(Color.white)
                .cornerRadius(15)
                .padding()
                
                
                // MARK: ADD/REMOVE FRIENDS
                
                VStack(alignment: .leading){
                    Text("Vänner")
                        .foregroundColor(Color("WeirdGreen").opacity(0.6))
                        .padding(.bottom, -15)
                        .padding(.leading, 20)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    
                    Button(action: {}) {
                        HStack(spacing: 20){
                            
                            Image(systemName: "person.badge.plus")
                            Text("Lägg till vänner")
                            Spacer()
                            //Image(systemName: "arrowshape.zigzag.right")
                            Image(systemName: "chevron.right")
                                
                        }.padding()
                    }.foregroundColor(Color.black)
                        
                    
                    Divider()
                 
                    Button(action: {
                        self.showingFriends.toggle()
                    }) {
                        HStack(spacing: 20){
                            
                            Image(systemName: "person.2")
                            Text("Vänner").padding(.leading, -7)
                            Spacer()
                            //Image(systemName: "arrowshape.zigzag.right")
                            Image(systemName: "chevron.right")
                                
                        }.padding()
                    }
                    .foregroundColor(Color.black)
                    .sheet(isPresented: $showingFriends) {
                        FriendView()
                    }
                    
                }
                .background(Color.white)
                .cornerRadius(15)
                .padding()
                
                
                // MARK: CO2/Month
                
                VStack(alignment: .leading){
                    Text("Mål CO2 utsläpp (kg/månad)")
                        .foregroundColor(Color("WeirdGreen").opacity(0.6))
                        .padding(.bottom, -15)
                        .padding(.leading, 20)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    
                    HStack{
                        Spacer()
                        
                        Text("\(Int(val)) kg")
                            .foregroundColor(Color("WeirdGreen"))
                            .font(.title3)
                            .padding(.leading, 40)
                        
                        Spacer()
                        
                        Button(action: {
                            self.showingDetail.toggle()
                        }) {
                            Image(systemName: "questionmark.circle")
                        }
                        .alert(isPresented: $showingDetail) {
                            Alert(title: Text("CO2 utsläpp/månad"), message: Text(textAboutSwedish), dismissButton: .default(Text("Jag förstår")))
                            
                        }
                        .padding(.trailing, 10)
                        .foregroundColor(Color.black)
                        
                            
                    }.padding(.top, 5)
                        
                    HStack{
                        Image(systemName: "aqi.low")
                            .foregroundColor(Color.black)
                        Slider(
                            value: $val,
                            in: 0...400,
                            step: 1,
                            onEditingChanged: {editing in
                                isEditing = editing
                            }
                        )
                        
                        Image(systemName: "aqi.high")
                            .foregroundColor(Color.black)
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                    .accentColor(Color("Blue"))
                    
                }
                .background(Color.white)
                .cornerRadius(15)
                .padding()
                
            
                // MARK: EDIT EARLIER ANSWERS
                
                VStack(alignment: .leading){
                    Text("Redigera tidigare svar och utsläpp")
                        .foregroundColor(Color("WeirdGreen").opacity(0.6))
                        .padding(.bottom, -15)
                        .padding(.leading, 20)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    
                    HStack(spacing: 20){
                        Image(systemName: "airplane")
                        Text("Flyg/Resor")
                        Spacer()
                        //Image(systemName: "arrowshape.zigzag.right")
                        Image(systemName: "chevron.right")
                            
                    }.padding()
                    
                    Divider()
                    
                    HStack(spacing: 20){
                        Image(systemName: "leaf")
                        Text("Mat")
                        Spacer()
                        //Image(systemName: "arrowshape.zigzag.right")
                        Image(systemName: "chevron.right")
                            
                    }.padding()
                    
                    Divider()
                    
                    HStack(spacing: 20){
                        Image(systemName: "car")
                        Text("Transport")
                        Spacer()
                        //Image(systemName: "arrowshape.zigzag.right")
                        Image(systemName: "chevron.right")
                            
                    }.padding()
                    
                    Divider()
                    
                    HStack(spacing: 20){
                        Image(systemName: "bolt")
                        Text("El")
                        Spacer()
                        //Image(systemName: "arrowshape.zigzag.right")
                        Image(systemName: "chevron.right")
                            
                    }.padding()
                    
                    
                    
                }
                .background(Color.white)
                .cornerRadius(15)
                .padding()
                
                
                
                
            }
            .padding(.top, 20)
            .background(Color("grey"))
            .ignoresSafeArea(.all, edges: .bottom)
            
            
        }
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .padding(.bottom, 50)

            
    }
    
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
