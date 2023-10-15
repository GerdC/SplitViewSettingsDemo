//
//  SettingsSidebarView.swift
//  SplitViewSettingsDemo
//
//  Created by Gerd Castan on 11.10.23.
//

import SwiftUI


enum SettingsDetail: Hashable, Equatable {
    case events
    case mode(Mode)
}


struct SettingsSidebarView: View {

    @Binding var selectedDetail: SettingsDetail?
    
    @State private var selectedUnit: UnitType = .metric
    @State private var notification: Bool = true

    var body: some View {
        List(selection: $selectedDetail) {
            Section {
                Picker("Units", selection: $selectedUnit) {
                   ForEach(UnitType.allCases) { unit in
                       Text(unit.rawValue).tag(unit)
                   }
                }
                Toggle(isOn: $notification) {
                    Text("Notification")
                }
                NavigationLink(value: SettingsDetail.events) {
                    Text("Events")
                }
            }

            Section(header: Text("Modes")) {
                ForEach(Mode.allCases) { mode in
                    NavigationLink(value: SettingsDetail.mode(mode)) {
                        Text(mode.localized)
                    }
                }
            }
            
        }
        .listStyle(.grouped)

    }
}


#Preview {
    @State var selectedCategory: SettingsDetail?
    return SettingsSidebarView(selectedDetail: $selectedCategory)
}
