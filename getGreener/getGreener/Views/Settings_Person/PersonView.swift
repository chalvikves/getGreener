//
//  PersonView.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-01-05.
//

import SwiftUI

struct PersonView: View {
    
    @StateObject var viewModel = PersonViewModel()
    
    
    var body: some View {
        
        VStack{
            VStack{
                CircleAvatar(height: 100, width: 100, firstname: "Viktor", lastname: "Vestlund", color: Color.pink)
                    .shadow(radius: 10)
                
                Text("\(viewModel.username)")
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
                
                Spacer().frame(height: 20)
                
                // MARK: USER INFO
                
                VStack(alignment: .leading){
                    Text("Användarinformation")
                        .foregroundColor(Color("Forest").opacity(0.6))
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
                                text: $viewModel.username
                            ){ isEditing in
                                viewModel.isEditingText = isEditing
                            }
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color.gray)
                            
                            Button(
                                action: { viewModel.username = "" }
                            ) {
                                Image(systemName: "x.circle")
                                    .foregroundColor(Color.gray)
                            }.opacity(viewModel.isEditingText ? 1 : 0)
                        
                        }.padding(.trailing, viewModel.isEditingText ? 0 : -20)
                           
                            
                    }.padding()
                    
                 
                }
                .background(Color.white)
                .cornerRadius(15)
                .padding()
                
                
                // MARK: ADD/REMOVE FRIENDS
                
                VStack(alignment: .leading){
                    Text("Vänner")
                        .foregroundColor(Color("Forest").opacity(0.6))
                        .padding(.bottom, -15)
                        .padding(.leading, 20)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    
                    Button(action: {}) {
                        EditAnswersBoxView(image: "person.badge.plus", text: "Lägg till vänner")
                    }.foregroundColor(Color.black)
                        
                    
                    Divider()
                 
                    Button(action: {
                        viewModel.showingFriends.toggle()
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
                    .sheet(isPresented: $viewModel.showingFriends) {
                        FriendView()
                    }
                    
                }
                .background(Color.white)
                .cornerRadius(15)
                .padding()
                
                
                // MARK: CO2/Month
                
                VStack(alignment: .leading){
                    Text("Mål CO2 utsläpp (kg/månad)")
                        .foregroundColor(Color("Forest").opacity(0.6))
                        .padding(.bottom, -15)
                        .padding(.leading, 20)
                }.frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                
                VStack{
                    
                    HStack{
                        Spacer()
                        
                        Text("\(Int(viewModel.val)) kg")
                            .foregroundColor(Color("Forest"))
                            .font(.title3)
                            .padding(.leading, 40)
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.showingDetail.toggle()
                        }) {
                            Image(systemName: "questionmark.circle")
                        }
                        .alert(isPresented: $viewModel.showingDetail) {
                            Alert(
                                title: Text("CO2 utsläpp/månad"),
                                message: Text(viewModel.textAboutSwedish),
                                dismissButton: .default(Text("Jag förstår"))
                            )
                            
                        }
                        .padding(.trailing, 10)
                        .foregroundColor(Color.black)
                        
                            
                    }.padding(.top, 5)
                        
                    SliderView(leadingImage: "aqi.low", trailingImage: "aqi.high", value: $viewModel.val, accentColor: Color("SGreen"), viewModel: viewModel)
                    
                }
                .background(Color.white)
                .cornerRadius(15)
                .padding()
                
            
                // MARK: EDIT EARLIER ANSWERS
                
                VStack(alignment: .leading){
                    Text("Redigera tidigare svar och utsläpp")
                        .foregroundColor(Color("Forest").opacity(0.6))
                        .padding(.bottom, -15)
                        .padding(.leading, 20)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    
                    EditAnswersBoxView(image: "airplane", text: "Flyg/Resor")
                    
                    Divider()
                    
                    EditAnswersBoxView(image: "leaf", text: "Mat")
                    
                    Divider()
                    
                    EditAnswersBoxView(image: "car", text: "Transport")
                    
                    Divider()
                    
                    EditAnswersBoxView(image: "bolt", text: "El")
                    
                }
                .background(Color.white)
                .cornerRadius(15)
                .padding()
                
                
                
                
            }
            .background(Color(.systemGray6))
            
            
        }
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        .padding(.bottom, -35)

            
    }
    
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}

struct SliderView: View {
    
    var leadingImage: String
    var trailingImage: String
    var value: Binding<Double>
    var accentColor: Color
    var viewModel: PersonViewModel
    
    var body: some View {
        HStack{
            Image(systemName: leadingImage)
                .foregroundColor(Color.black)
            Slider(
                value: value,
                in: 0...400,
                step: 1,
                onEditingChanged: {editing in
                    viewModel.isEditing = editing
                }
            )
            
            Image(systemName: trailingImage)
                .foregroundColor(Color.black)
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
        .accentColor(accentColor)
    }
}
