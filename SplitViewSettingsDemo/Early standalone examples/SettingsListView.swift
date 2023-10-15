//
//  SettingsListView.swift
//  SplitViewSettingsDemo
//
//  Created by Gerd Castan on 14.10.23.
//

import SwiftUI

/// this is an early version of the file for the article
struct SettingsSidebarView_: View {
    @State private var selectedUnit: UnitType = .automatic
    @State private var notification: Bool = true
    var body: some View {
        List {
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
        .listStyle(.grouped)
    }
}

#Preview {
    SettingsSidebarView_()
}
