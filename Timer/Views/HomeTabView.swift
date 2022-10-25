//
//  HomeTabView.swift
//  Timer
//
//  Created by Степан Величко on 09.10.2022.
//

import SwiftUI

struct HomeTabView: View {
    
    @EnvironmentObject var timerModel: TimerModel
    
    init(){
        UITabBar.appearance().barTintColor = .systemBackground
    }
    
    let colorOne: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    let colorTwo: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        //no user logged in
        if viewModel.userSession == nil {
            notLoggedInView
        } else {
            //have logged in user
            loggedInInterface
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
            .environmentObject(TimerModel())
            .environmentObject(AuthViewModel())
    }
}

extension HomeTabView {
    var loggedInInterface: some View {
        TabView{
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                }
                .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                    if timerModel.isStarted{
                        timerModel.updateTimer()
                    }
                }
            
            AnalyticsView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    //Image(systemName: "chart.line.uptrend.xyaxis")
                        .foregroundColor(.blue)
                }
            
            TempLoggedView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .accentColor(Color(colorTwo))
    }
    
    var notLoggedInView: some View {
        TabView{
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                }
                .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                    if timerModel.isStarted{
                        timerModel.updateTimer()
                    }
                }
            
            AnalyticsView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    //Image(systemName: "chart.line.uptrend.xyaxis")
                        .foregroundColor(.blue)
                }
            
            RegistrationView()
                .tabItem {
                    Image(systemName: "person")
                }
//            TempAuthView()
//                .tabItem {
//                    Image(systemName: "person")
//                }
        }
        .accentColor(Color(colorTwo))
    }
}
