//
//  TempLoggedView.swift
//  Timer
//
//  Created by Степан Величко on 18.10.2022.
//

import SwiftUI

struct TempLoggedView: View {
    let colorOne: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    let colorTwo: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    let colorThree: UIColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            ZStack {
                
                AngularGradient(
                    gradient: Gradient(colors: [Color(colorOne), Color(colorTwo)]),
                    //center: .topLeading,
                    center: .topTrailing,
                    angle: .degrees(180 + 45))
                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("""
                    Hey \(user.name),
                    now you're logged in 🎉
                    """)
                        .foregroundColor(.white)
                        .font(.system(size: 45, weight: .ultraLight, design: .rounded))
                        .lineLimit(2)
                        .minimumScaleFactor(0.1)
                        .padding()
                    
                    //Back home button
                    NavigationLink{
                        HomeTabView().onAppear{
                            //viewModel.userSession =
                        }
                            .navigationBarHidden(true)
                    } label: {
                        HStack {
                            Text("Back home")
                                .foregroundColor(.gray)
                            Spacer()
                        }
                    } .padding()
                    
                    Spacer()
                    
                    //Sign out button
                    Button{
                        viewModel.signOut()
                    } label: {
                        Text("Sign out")
                    } .padding() .foregroundColor(.gray)
                    
                }
            }
        }
    }
}

struct TempLoggedView_Previews: PreviewProvider {
    static var previews: some View {
        TempLoggedView()
            .environmentObject(AuthViewModel())
    }
}
