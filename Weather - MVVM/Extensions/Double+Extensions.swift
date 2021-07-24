//
//  Double+Extensions.swift
//  Weather - MVVM
//
//  Created by Chirag Chaplot on 23/7/21.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        return String(format: "%.0f°",self)
    }
}
