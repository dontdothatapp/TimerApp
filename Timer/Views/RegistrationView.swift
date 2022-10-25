//
//  RegistrationView.swift
//  Timer
//
//  Created by Степан Величко on 11.10.2022.
//

import SwiftUI

struct RegistrationView: View {
    let colorOne: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    let colorTwo: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    let colorThree: UIColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        ZStack {
            VStack{
                
                NavigationLink(destination: TempLoggedView().navigationBarBackButtonHidden(),
                               isActive: $viewModel.didAuthenticateUser,
                               label: { })
                
                AuthHeaderView(title: "sign up...")
                
                //Input fields
                VStack(spacing: 30){
                    CustomInputFields(placeholderText: "Name", text: $name)
                    CustomInputFields(placeholderText: "Email",
                                      isEmailField: true,
                                      text: $email)
                    CustomInputFields(placeholderText: "Password",
                                      isSecureField: true,
                                      text: $password)
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                .background(.white)
                .font(.headline)
                
                //Sign up button
                Button{
                    viewModel.register(withEmail: email, password: password, name: name)
                } label: {
                    Text("Sign up")
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
                
                //Link to Sign in
                NavigationLink{
                    AuthView()
                        .navigationBarHidden(true)
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                        Text("Sign In")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.bottom, 32)
            }
            .ignoresSafeArea(edges: .top)
            .navigationBarHidden(true)
            
//            Text("Sign up")
//                .foregroundColor(.white)
//                .font(.system(size: 65, weight: .ultraLight, design: .rounded))
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(AuthViewModel())
    }
}
