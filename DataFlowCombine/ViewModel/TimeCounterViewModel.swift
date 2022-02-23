//
//  TimeCounter.swift
//  DataFlowCombine
//
//  Created by Snow Lukin on 23.02.2022.
//

import Combine
import SwiftUI

class TimeCounterViewModel: ObservableObject {
    
    let objectWillChange = PassthroughSubject<TimeCounterViewModel, Never>()
    
    var counter = 3
    var timer: Timer?
    var buttonTitle = "Start"
    var isWaiting = false
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        buttonDidTapped()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
            isWaiting = false
        }
        
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
            isWaiting = true
        }
        
        objectWillChange.send(self)
    }
}
