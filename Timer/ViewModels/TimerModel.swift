//
//  TimerModel.swift
//  Timer
//
//  Created by Степан Величко on 08.10.2022.
//

import SwiftUI

class TimerModel: NSObject, ObservableObject {
    @Published var isStarted: Bool = false
    @Published var hours: Int = 0
    @Published var totalHours: Int = 0
    @Published var minutes: Int = 0
    @Published var totalMinutes: Int = 0
    @Published var seconds: Int = 0
    @Published var totalSeconds: Int = 0
    @Published var currentSeconds: Int = 0
    @Published var totalTime: Int = 0
    
    func startTimer() {
        totalTime = totalTime + currentSeconds
        totalTimeCount(totalTime)
        currentSeconds = 0
    }
    
    func stopTimer(){
        
    }
    
    func secondsToHoursMinutesSeconds(_ secondsFunc: Int) -> (Int, Int, Int) {
        return (secondsFunc / 3600, (secondsFunc % 3600) / 60, (secondsFunc % 3600) % 60)
    }
    
    func printSecondsToHoursMinutesSeconds(_ secondsFunc: Int) {
        let (h, m, s) = secondsToHoursMinutesSeconds (secondsFunc)
        hours = h
        minutes = m
        seconds = s
    }
    
    func updateTimer(){
        currentSeconds += 1
        printSecondsToHoursMinutesSeconds(currentSeconds)
        print("CurrentSec: \(currentSeconds), \(hours):\(minutes):\(seconds); Total time: \(totalTime)")
    }
    
    func convertWithZero(_ value: Int) -> (String){
        let addString: String = "0"
        let stringValue = String(value)
        if value < 10 {
            return (addString+stringValue)
        } else {
            return (stringValue)
        }
    }
    
    func showCounter() -> (String) {
        let returnedString = String(convertWithZero(hours) + ":" + convertWithZero(minutes) + ":" + convertWithZero(seconds))
        return returnedString
    }
    
    func showTotalTime() -> String {
        let returnedString = String("Total time spent: " + convertWithZero(totalHours) + ":" + convertWithZero(totalMinutes) + ":" + convertWithZero(totalSeconds))
        return returnedString
    }
    
    func totalTimeCount(_ totalTimeSpent: Int){
        let (h, m, s) = secondsToHoursMinutesSeconds (totalTimeSpent)
        totalHours = h
        totalMinutes = m
        totalSeconds = s
    }
}
