//
//  MainView.swift
//  Timer
//
//  Created by Степан Величко on 08.10.2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var timerModel: TimerModel
    
    var body: some View {
        VStack {
            Text("Hours: \(timerModel.hours)")
            Text("Minutes: \(timerModel.minutes)")
            Text("Seconds: \(timerModel.seconds)")
            Button{
                if timerModel.isStarted{
                    timerModel.isStarted.toggle()
                } else {
                    timerModel.isStarted.toggle()
                }
            } label: {
                Text("Timer")
            }
            .padding(.top, 50)
            
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            if timerModel.isStarted{
                timerModel.updateTimer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(TimerModel())
    }
}
