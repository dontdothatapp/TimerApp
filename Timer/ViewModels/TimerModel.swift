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
    let service = TimeLogService()
    
    
    func uploadCurrentTime(_ timeInSec: Int) {
        service.uploadTime(timeInSec: timeInSec)
    }
    
    //Updating total time + reset current timer
    func startTimer() {
        totalTime = totalTime + currentSeconds
        totalTimeCount(totalTime)
        uploadCurrentTime(currentSeconds)
        //currentSeconds = 0
    }
    
    func stopTimer(){
        
    }
    
    //func to convert seconds into three values
    func secondsToHoursMinutesSeconds(_ secondsFunc: Int) -> (Int, Int, Int) {
        return (secondsFunc / 3600, (secondsFunc % 3600) / 60, (secondsFunc % 3600) % 60)
    }
    
    //func to assign converted values to variables h : m : s
    func printSecondsToHoursMinutesSeconds(_ secondsFunc: Int) {
        let (h, m, s) = secondsToHoursMinutesSeconds (secondsFunc)
        hours = h
        minutes = m
        seconds = s
    }
    
    //Actual timer function
    func updateTimer(){
        currentSeconds += 1
        printSecondsToHoursMinutesSeconds(currentSeconds)
        //print("CurrentSec: \(currentSeconds), \(hours):\(minutes):\(seconds); Total time: \(totalTime)")
    }
    
    //Add 0 if the value (hours/minutes/seconds) less then 10
    func convertWithZero(_ value: Int) -> (String){
        let addString: String = "0"
        let stringValue = String(value)
        if value < 10 {
            return (addString+stringValue)
        } else {
            return (stringValue)
        }
    }
    
    //Returning elapsed time and combining it with adding 0
    func showCounter() -> (String) {
        let returnedString = String(convertWithZero(hours) + ":" + convertWithZero(minutes) + ":" + convertWithZero(seconds))
        return returnedString
    }
    
    //Show total spent time with adding 0
    func showTotalTime() -> String {
        let returnedString = String("Total time spent: " + convertWithZero(totalHours) + ":" + convertWithZero(totalMinutes) + ":" + convertWithZero(totalSeconds))
        return returnedString
    }
    
    //Converting total spent time into h:m:s format
    func totalTimeCount(_ totalTimeSpent: Int){
        let (h, m, s) = secondsToHoursMinutesSeconds (totalTimeSpent)
        totalHours = h
        totalMinutes = m
        totalSeconds = s
    }
}
