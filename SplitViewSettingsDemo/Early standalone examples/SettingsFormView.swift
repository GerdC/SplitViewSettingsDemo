//
//  SettingsFormView.swift
//  SplitViewSettingsDemo
//
//  Created by Gerd Castan on 11.10.23.
//

import SwiftUI

struct SettingsFormView_: View {
    @State private var selectedUnit: UnitType = .automatic
    @State private var notification: Bool = true
    var body: some View {
        Form {
            Section {
                Picker("Units", selection: $selectedUnit) {
                   ForEach(UnitType.allCases) { unit in
                       Text(unit.rawValue).tag(unit)
                   }
                }
                Toggle(isOn: $notification) {
                    Text("Notification")
                }
            }

            Section(header: Text("Modes")) {
                ForEach(Mode.allCases) { mode in
                    Text(mode.localized)
                }
            }
        }
    }
}
                    
                    
#Preview {
    SettingsFormView_()
}
