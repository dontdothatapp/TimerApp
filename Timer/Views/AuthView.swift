//
//  AuthView.swift
//  Timer
//
//  Created by Степан Величко on 11.10.2022.
//

import SwiftUI

struct AuthView: View {
    let colorOne: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    let colorTwo: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    @State private var email = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            AuthHeaderView(title: "sign in...")
            
            //Fields
            VStack(spacing: 30){
                CustomInputFields(placeholderText: "Email",
                                  isEmailField: true,
                                  text: $email)
                CustomInputFields(placeholderText: "Password",
                                  isSecureField: true,
                                  text: $password)
            }
            .padding(32)
            
            //Sign in button
            Button{
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign in")
                    .font(.headline)
                    .frame(width: 320, height: 50)
                    .background(Color(colorTwo))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .padding(.top, 30)
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y:0)
            
            Spacer()
            
            //Temp button to dismiss the view
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Dismiss the view")
            } .padding(.bottom, 15) .foregroundColor(.gray)
            
            //Link to Sign up
            NavigationLink{
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account yet?")
                        .font(.footnote)
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarHidden(true)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
