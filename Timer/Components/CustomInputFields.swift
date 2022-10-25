//
//  CustomInputFields.swift
//  Timer
//
//  Created by Степан Величко on 11.10.2022.
//

import SwiftUI

struct CustomInputFields: View {
    let placeholderText: String
    var isSecureField: Bool? = false
    var isEmailField: Bool? = false
    @Binding var text: String
    
    
    var body: some View {
        
        VStack{
            HStack {
                //TextField(placeholderText, text: $text)
                  //  .textContentType(.emailAddress)
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)
                } else {
                    if isEmailField ?? false {
                        TextField(placeholderText, text: $text)
                            .textContentType(.emailAddress)
                    } else {
                        TextField(placeholderText, text: $text)
                    }
                    
                }
            }
            
            Divider()
                //.background(.black)
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputFields_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputFields(placeholderText: "Email",
                          isSecureField: false,
                          text: .constant(""))
    }
}
