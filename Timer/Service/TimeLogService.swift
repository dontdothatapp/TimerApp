//
//  TimeLogService.swift
//  Timer
//
//  Created by Степан Величко on 27.10.2022.
//

import Firebase

struct TimeLogService {
    
    //👇That's doesn't work 👇
    //let timerModel = TimerModel()
    
    func uploadTime(timeInSec: Int) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "timeInSec": timeInSec,
                    "Timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("timeSpent").document()
            .setData(data) { _ in
                print("DEBUG: data: \(data)")
            }
    }
}
