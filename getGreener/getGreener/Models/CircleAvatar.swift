//
//  CircleAvatar.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2020-12-16.
//

import SwiftUI


/// Shows first letter of first and lastname inside a circle.
///
/// Use this to show an circular avatar that shows the first and last name with a specified color.
///
/// - Author: Viktor Vestlund
///
/// - Returns: A cirleavatar
///
/// - Parameters:
///     - height: The heihgt of the circle
///     - width: The width of the circle
///     - firstname: The firstname that should be visible
///     - lastname: The lastname that should be visible
///     - color: The background color of the circle
///
/// - Version: 0.1


struct CircleAvatar: View {
    
    @State var height: CGFloat
    @State var width: CGFloat
    @State var firstname: String
    @State var lastname: String
    @State var color: Color
    
    
    var body: some View {
        ZStack(alignment: .center){
            Circle()
                .frame(width: width, height: height)
                .foregroundColor(color)
                
            
            HStack(spacing:0){
                Text(firstname.first!.uppercased())
                    .foregroundColor(.white)
                    .font(.title2)
                Text(lastname.first!.uppercased())
                    .foregroundColor(.white)
                    .font(.title2)
            }
            
                
                
            
        }
    }
}

struct CircleAvatar_Previews: PreviewProvider {
    static var previews: some View {
        CircleAvatar(height: 100, width: 100, firstname: "Vera", lastname: "Vegan", color: Color.white)
    }
}
