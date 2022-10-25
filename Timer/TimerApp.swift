//
//  TimerApp.swift
//  Timer
//
//  Created by Степан Величко on 12.09.2022.
//

import SwiftUI
import Firebase

@main
struct TimerApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    @StateObject var timerModel: TimerModel = .init()
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeTabView()
            }
            .environmentObject(timerModel)
            .environmentObject(viewModel)
        }
    }
}
