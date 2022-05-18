//
//  FormatTime.swift
//  Stopwatch
//
//  Created by Brett Bax on 10/3/21.
//
//
//  Formatting time for display
//  Stackoverflow makes a great coach



import Foundation
import SwiftUI

let formatter: DateComponentsFormatter = {
    let format = DateComponentsFormatter()
    format.allowedUnits = [.minute, .second]
    format.zeroFormattingBehavior = .pad
    return format
    
}()

let numberFormatter: NumberFormatter = {
    let format = NumberFormatter()
    format.minimumFractionDigits = 2
    format.maximumFractionDigits = 2
    format.maximumIntegerDigits = 0
    format.alwaysShowsDecimalSeparator = true
    return format
}()


