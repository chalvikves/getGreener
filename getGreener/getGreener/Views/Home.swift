//
//  home.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2020-12-21.
//

import SwiftUI
import PartialSheet
import PageView

struct Home: View {
    
    
    
    @StateObject var viewModel = HomeViewModel()
    @StateObject var model = PersonViewModel()

    // MARK: Lägg i viewmodel
    
    @State var pageIndex = 0
    let theme = PageControlTheme(backgroundColor: Color("Main"), dotActiveColor: Color("SecondaryText"), dotInactiveColor: Color(.systemGray5), dotSize: 7.0, spacing: 9.0, padding: 4.0, xOffset: 12.0, yOffset: -12.0)
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                Text("Hej")
                    .font(.largeTitle)
                    
                Text("Viktor")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(Color("Green"))
                    
                Text("👋")
                    .font(.largeTitle)
            }
            .padding(.top, 40)
            
            Spacer().frame(height: 15)

            
           
            HStack{
                Spacer()
                Button(action: {
                    viewModel.showDayWeekYear.toggle()
                }, label: {
                    HStack{
                        Text(viewModel.selectedRange)
                            .foregroundColor(Color("MainText"))
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color(.systemGray2))
                        
                    }
                })
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color(.systemGray2), lineWidth: 1)
                )
                .partialSheet(isPresented: $viewModel.showDayWeekYear){
                    
                    VStack(spacing: 0){
                        Text("Välj tidsperiod")
                            
                        
                        Spacer()
                        
                        Divider()
                        
                        Button(action: self.viewModel.setDay ){
                            HStack{
                                Text(viewModel.ranges[0])
                                
                                Spacer()
                                
                                Text("\( Int(150 / 24))")
                                
                                Text("kg/CO2")
                                    
                                Circle()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(viewModel.selectedRange == "Dag"  ? Color("Green") : Color(.clear))
                                    
                                    
                            }
                            .padding()
                            .background(viewModel.selectedRange == "Dag" ? Color(.systemGray6) : Color(.clear))
                            .foregroundColor(Color("MainText"))
                        }
                        
                        Divider()
                        
                        Button(action: self.viewModel.setWeek ){
                            HStack{
                                Text(viewModel.ranges[1])
                                
                                Spacer()
                                
                                Text("\( Int(150 / 24))")
                                
                                Text("kg/CO2")
                                    
                                Circle()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(viewModel.selectedRange == "Månad"  ? Color("Green") : Color(.clear))
                                    
                                    
                            }
                            .padding()
                            .background(viewModel.selectedRange == "Månad" ? Color(.systemGray6) : Color(.clear))
                            .foregroundColor(Color("MainText"))
                        }
                        
                        Divider()
                        
                        Button(action: self.viewModel.setYear ){
                            HStack{
                                Text(viewModel.ranges[2])
                                
                                Spacer()
                                
                                Text("\( Int(150 / 24))")
                                
                                Text("kg/CO2")
                                    
                                Circle()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(viewModel.selectedRange == "År"  ? Color("Green") : Color(.clear))
                                    
                                    
                            }
                            .padding()
                            .background(viewModel.selectedRange == "År" ? Color(.systemGray6) : Color(.clear))
                            .foregroundColor(Color("MainText"))
                        }
                        
                        Divider()
                        
                        Spacer()
                        
                    }
                    .frame(height: 300)
                }
            }
            
            Spacer().frame(height: 15)
            
            HStack{
                //Spacer()
                
                VStack{
                    ForEach(0..<viewModel.data.count, id: \.self) {index in
                        let element = viewModel.data[index]
                        
                        Button(action: {print("hi")}){
                            HStack{
                                Circle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(element.color)
                                
                                
                                Text("\( Int(100 * element.percentage)) %")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("SecondaryText"))
                                
                                Text(element.description)
                                    .foregroundColor(Color("SecondaryText"))
                                    .fontWeight(.semibold)
                                    .font(.subheadline)
                                
                                Spacer()
                                
                                
                            }
                        }.padding(.vertical, 5)
                        
                        
                    }
                }
                
                //PieChart(viewModel: viewModel, width: 225, height: 225)
                PieChart(viewModel: viewModel, width: 115, height: 115)
                    .frame(width: UIScreen.main.bounds.size.width/2.5)
                    //.padding(.all, 20)
                    //.shadow(color: Color("LightShadow"), radius: 5)
                    .padding(.bottom, 10)
                
                //Spacer()
            }
        
            Spacer()
            
            Text("Tips för att minska ditt utsläpp")
                .fontWeight(.semibold)
            
            
            HPageView(selectedPage: $pageIndex, theme: theme){
                TipsView(color: .black, title: "Hej", tips: "Din jfjfjfjjf")
                TipsView(color: .green, title: "Hss", tips: "Din jfsfjjf")
                TipsView(color: .blue, title: "Hqf", tips: "Din jfjfjfasdf")
            }.border(Color(.black), width: 2)
            
            Spacer()
                
            
        }
        .padding(.horizontal)
        .addPartialSheet()
    }
    
}

struct TipsView: View {
    var color: Color
    var title: String
    var tips: String
    
    var body: some View {
  
        VStack{
            
            HStack{
                Circle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(color)
                
                Text(title)
                    .foregroundColor(Color("SecondaryText"))
                    .fontWeight(.semibold)
                    .font(.subheadline)

            }
            
            Text(tips)
                .foregroundColor(Color("SecondaryText"))
                .fontWeight(.semibold)
                .font(.subheadline)
            
            Spacer()
            
        }
        .padding()
        
    
    }
}
