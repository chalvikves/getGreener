//
//  home.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2020-12-21.
//

import SwiftUI
import PartialSheet

struct Home: View {
    
    
    
    @StateObject var viewModel = HomeViewModel()
    @StateObject var model = PersonViewModel()

    
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
                Spacer()
                
                PieChart(viewModel: viewModel)
                    .frame(width: UIScreen.main.bounds.size.width/1.3, height: 300)
                    .padding(.all, 20)
                    .shadow(radius: 15)
                    .padding(.bottom, 10)
                
                Spacer()
            }
            
            Color("Main")
                .overlay(
                    ForEach(0..<viewModel.data.count, id: \.self) {index in
                        let element = viewModel.data[index]
                        
                        Button(action: {print("hi")}){
                            HStack{
                                Circle()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(element.color)
                                
                                Text(element.description)
                                    .foregroundColor(Color("MainText"))
                                
                                Spacer()
                                
                                Text("\( Int(150 * element.percentage))")
                                
                                Text("kg/CO2")
                                    .font(.caption)
                                    .padding(.leading, -5)
                                
                            }
                        }.padding(.vertical, 5)
                        
                        
                    }.padding()
                )
                .cornerRadius(15)
                .padding()
                .shadow(color: Color("LightShadow"), radius: 5)
                
            
           Spacer()
                
            
        }
        .padding(.horizontal)
        .addPartialSheet()
    }
    
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct DetailedView: View {
    var description: String
    var icon: String
    var information: String
    var color: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(color)
                .frame(width: 200, height: 100)
        
            HStack{
                Image(systemName: icon)
                Text(description)
                    
            }.foregroundColor(.white)
        }
    }
}

struct TipsView: View {
    var image: String
    var title: String
    var description: String
    
    var body: some View {
  
        HStack{
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.leading, -30)
                
            
            Spacer()
            
            Text(description)
                .padding(.trailing, 20)
                .rotationEffect(Angle(degrees: 30))
                
            
        }.padding(.horizontal)
        
    
    }
}
