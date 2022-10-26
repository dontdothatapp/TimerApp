//
//  TempAuthView.swift
//  Timer
//
//  Created by Степан Величко on 18.10.2022.
//

import SwiftUI

struct TempAuthView: View {
    let colorOne: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    let colorTwo: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    let colorThree: UIColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    
    var body: some View {
        ZStack {
            AngularGradient(
                gradient: Gradient(colors: [Color(colorOne), Color(colorTwo)]),
                //center: .topLeading,
                center: .topTrailing,
                angle: .degrees(180 + 45))
            .ignoresSafeArea()
            
            //Log in and sign up nav links
            VStack {
                
                //LogIn
                NavigationLink{
                    AuthView()
                } label: {
                    Text("Open log in")
                } .padding()
                
                //Sign up
                NavigationLink{
                    RegistrationView()
                } label: {
                    Text("Open sign up")
                } .padding()
                
            }
            .font(.title)
            .foregroundColor(.gray)
        }
    }
}

struct TempAuthView_Previews: PreviewProvider {
    static var previews: some View {
        TempAuthView()
    }
}
