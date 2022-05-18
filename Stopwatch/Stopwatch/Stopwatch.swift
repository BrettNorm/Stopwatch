//
//  StopwatchManager.swift
//  Stopwatch
//
//  Created by Brett Bax on 9/28/21.
//
//  The skeleton for our stopwatch and lap data.


import Foundation
import SwiftUI


final class Stopwatch: ObservableObject {
    @Published private var data: StopwatchData = StopwatchData()
    @Published var mode: stopwatchMode = .stopped
    @Published var timer: Timer?
    var laps: [TimeInterval] {
        data.laps
    }
    
    var total: TimeInterval {
        data.totalTime
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {
            [unowned self] timer in
            self.data.currentTime = Date().timeIntervalSinceReferenceDate
        })
        data.startTimer(at: Date().timeIntervalSinceReferenceDate)
        mode = .running
        
    }
    
    func stopTimer() {
        timer?.invalidate()
        data.stopTimer()
        timer = nil
        mode = .paused
    }
    
    func addLap() {
        data.addLap()
    }
    
    func reset() {
        stopTimer()
        data = StopwatchData()
        data.currentLap = 0
    }
}

// stop watch modes
enum stopwatchMode {
    case running
    case stopped
    case paused
}

// Data for stopwatch
struct StopwatchData {
    var startTime: TimeInterval?
    var currentTime: TimeInterval = 0
    var currentLap: Int = 0
    var laps: [TimeInterval] = []
    var lastLapTime: TimeInterval = 0
    var totalTime: TimeInterval {
        guard let start = startTime else {return otherTime}
        return otherTime + currentTime - start
    }
    var otherTime: TimeInterval = 0
    
    mutating func startTimer(at time: TimeInterval) {
        currentTime = Date().timeIntervalSinceReferenceDate
        startTime = currentTime
    }
    
    mutating func addLap() {
        laps.append(totalTime - lastLapTime)
        lastLapTime = totalTime
        currentLap += 1
    }
    
    mutating func stopTimer() {
        otherTime = totalTime
        startTime = nil
    }
}
