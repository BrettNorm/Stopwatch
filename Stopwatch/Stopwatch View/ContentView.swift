//
//  ContentView.swift
//  Stopwatch
//
//  Created by Brett Bax on 9/28/21.
//
//  A stopwatch that I believe follows most guidelines.
//  I'm not great about dividing up into separate ViewModels
//  and files correctly. Some pointers would be appreciated.
//
//  I noticed my time format is "00:00.00" with a colon and then a period
//  and I'm having trouble fixing it. Unless that's the standard..?



import SwiftUI

struct ContentView: View {
    
    @ObservedObject var stopwatch = Stopwatch()
    
    var body: some View {
        VStack {
            Text("\(stopwatch.total.formatted)")
                .font(.custom("Avenir", size: 60))
                .padding(.bottom, 30)
                .padding(.top, 20)
                
            
            // Button Stack
            HStack{
                // Buttons whilepaused
                if stopwatch.mode == .paused {
                    // start timer
                    Button(action: {self.stopwatch.startTimer()}) {
                        TimerButton(label: "Start", buttonColor: .green)
                    }.buttonStyle(SwipeButtonStyle())
                        .buttonStyle(RoundedRectangleButtonStyle())
                    
                    // reset
                    Button(action: {self.stopwatch.reset()}) {
                        TimerButton(label: "Reset", buttonColor: .red)
                    }.buttonStyle(SwipeButtonStyle())
                        .buttonStyle(RoundedRectangleButtonStyle())
                }
                
                
                // Buttons while stopped/reset
                if stopwatch.mode == .stopped {
                    // start timer
                    Button(action: {self.stopwatch.startTimer()}) {
                        TimerButton(label: "Start", buttonColor: .green)
                    }.buttonStyle(SwipeButtonStyle())
                        .buttonStyle(RoundedRectangleButtonStyle())
                    
                    // nothing
                    Button(action: {print("Dead button.")}) {
                        TimerButton(label: "Lap", buttonColor: .gray)
                    }.buttonStyle(SwipeButtonStyle())
                        .buttonStyle(RoundedRectangleButtonStyle())
                }
                
                
                // Buttons while running
                if stopwatch.mode == .running {
                    // stop/pause
                    Button(action: {self.stopwatch.stopTimer()}) {
                        TimerButton(label: "Stop", buttonColor: .red)
                    }.buttonStyle(SwipeButtonStyle())
                        .buttonStyle(RoundedRectangleButtonStyle())
                    
                    // lap
                    Button(action: {self.stopwatch.addLap()}) {
                        TimerButton(label: "Lap", buttonColor: .blue)
                    }.buttonStyle(SwipeButtonStyle())
                        .buttonStyle(RoundedRectangleButtonStyle())
                }
            }
            
            // listing array of lap times, LIFO order
            List {
                ForEach(stopwatch.laps.enumerated().reversed(), id: \.offset) { value in
                    HStack {
                        Text("Lap \(value.offset + 1)")
                            .font(.headline).bold()
                        Spacer()
                        Text(value.element.formatted)
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}

//  Extension to call formatter & numberFormatter to, ya know..
//  format time.
extension TimeInterval {
    var formatted: String {
        let formattedTime = self.truncatingRemainder(dividingBy: 1)
        return formatter.string(from: self)! + numberFormatter.string(from:
            NSNumber(value: formattedTime))!
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


