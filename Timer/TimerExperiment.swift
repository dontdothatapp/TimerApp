//
//  TimerExperiment.swift
//  Timer
//
//  Created by Степан Величко on 21.09.2022.
//

import SwiftUI

struct TimerExperiment: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State var date: Date = Date()
    @State var hours: Int = 0
    @State var seconds: Int = 0
    
    var body: some View {
        VStack {
            Text(date.description)
                .font(.title)
            .fontWeight(.semibold)
        }
        .onReceive(timer) { value in
            //hours = value
        }
    }
}

struct TimerExperiment_Previews: PreviewProvider {
    static var previews: some View {
        TimerExperiment()
    }
}
