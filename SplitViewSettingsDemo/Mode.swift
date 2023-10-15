//
//  Mode.swift
//  SplitViewSettingsDemo
//
//  Created by Gerd Castan on 12.10.23.
//

import Foundation

enum Mode: String, CaseIterable, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case walk
    case publicTransit
    case bicycle
    case automobile
    
    var localized: String {
        self.rawValue
    }
}
