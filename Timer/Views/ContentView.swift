//
//  ContentView.swift
//  Timer
//
//  Created by Степан Величко on 12.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    let colorOne: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    let colorTwo: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    let colorThree: UIColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State var currentDate: Date = Date()
    var timeFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    @EnvironmentObject var timerModel: TimerModel
    
    var body: some View {
        ZStack {
            AngularGradient(
                gradient: Gradient(colors: [Color(colorOne), Color(colorTwo)]),
                //center: .topLeading,
                center: .topTrailing,
                angle: .degrees(180 + 45))
            .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                //Current Date
                Text(dateFormatter.string(from: currentDate))
                    .foregroundColor(.white)
                    .opacity(0.3)
                
                //Timer
                HStack{
                    Text(timerModel.showCounter())
                        .foregroundColor(.white)
                        .font(.system(size: 75, weight: .ultraLight, design: .rounded))
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                }
                
                
                
                Button {
                    if timerModel.isStarted{
                        timerModel.isStarted.toggle()
                        timerModel.startTimer()
                    } else {
                        timerModel.isStarted.toggle()
                    }
                    
                } label: {
                    if timerModel.isStarted{
                        Text("Stop")
                    } else {
                        Text("Start the journey")
                    }
                }
                .foregroundColor(.white)
                .opacity(0.7)
                .offset(y: 30)
                
                Spacer()
                
                //Total time spent
                HStack{
                    Text(timerModel.showTotalTime())
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                        .opacity(0.3)
                        .padding(.bottom, 60)
                }
            }
//            .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
//                if timerModel.isStarted{
//                    timerModel.updateTimer()
//                }
//            }
        }
        .onReceive(timer, perform: { value in
            currentDate = value
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TimerModel())
    }
}
