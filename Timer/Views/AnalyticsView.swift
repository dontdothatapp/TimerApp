//
//  AnalyticsView.swift
//  Timer
//
//  Created by Степан Величко on 09.10.2022.
//

import SwiftUI

struct AnalyticsView: View {
    let colorOne: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    let colorTwo: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    let colorThree: UIColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            AngularGradient(
                gradient: Gradient(colors: [Color(colorOne), Color(colorTwo)]),
                //center: .topLeading,
                center: .topTrailing,
                angle: .degrees(180 + 45))
            .ignoresSafeArea()
            VStack {
                Text("Your analytics")
                    .foregroundColor(.white)
                    .font(.system(size: 65, weight: .ultraLight, design: .rounded))
                
            }
        }
    }
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
    }
}
