//
//  UnitType.swift
//  SplitViewSettingsDemo
//
//  Created by Gerd Castan on 11.10.23.
//

import Foundation

enum UnitType: String, CaseIterable, Identifiable {
    case automatic = "Automatic"
    case metric = "Metric"
    case imperial = "Imperial"
    
    var id: String { self.rawValue }
}
