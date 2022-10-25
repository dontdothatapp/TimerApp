//
//  AuthHeaderView.swift
//  Timer
//
//  Created by Степан Величко on 11.10.2022.
//

import SwiftUI

struct AuthHeaderView: View {
    let colorOne: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    let colorTwo: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    let title: String
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                ZStack{
                    
                    HStack{ Spacer() }
                    
                    AngularGradient(
                        gradient: Gradient(colors: [Color(colorOne), Color(colorTwo)]),
                        //center: .topLeading,
                        center: .topTrailing,
                        angle: .degrees(180 + 45))
                    //.ignoresSafeArea()
                    
                    HStack{ Spacer() }
                    
                    Text(title)
                        .foregroundColor(.white)
                        .font(.system(size: 65, weight: .ultraLight, design: .rounded))
                }
                
            }
            .frame(height: 260)
            //.padding(.leading)
            .background(.white)
            //.opacity(0.8)
            .clipShape(RoundedShape(corners: [.bottomRight]))
        }
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title: "sign up.")
    }
}
