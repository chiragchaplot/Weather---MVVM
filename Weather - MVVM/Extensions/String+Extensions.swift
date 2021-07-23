//
//  String+Extensions.swift
//  Weather - MVVM
//
//  Created by Chirag Chaplot on 16/7/21.
//

import Foundation

extension String {
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
