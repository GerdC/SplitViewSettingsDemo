//
//  SettingsSpitView.swift
//  SplitViewSettingsDemo
//
//  Created by Gerd Castan on 12.10.23.
//

import SwiftUI

struct SettingsSpitView: View {

    /// show all columns, side by side
    @State private var visibility: NavigationSplitViewVisibility = .all

    @State private var selectedDetail: SettingsDetail?

    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            SettingsSidebarView(selectedDetail: $selectedDetail)
        } detail: {
            SettingsDetailView(selectedDetail: $selectedDetail)
        }
        // the next modifier also modifies the list style of SettingsSidebarView
        // when 2 columns are displayed
        .navigationSplitViewStyle(.balanced)
    }   
}

struct SettingsDetailView: View {

    @Binding var selectedDetail: SettingsDetail?
    @State private var presentedPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $presentedPath) {
            Group {
                if let selectedDetail {
                    switch selectedDetail {
                    case .events:
                        EventPreferencesSettingsView()
                    case .mode(let mode):
                        Form{
                            Text(mode.rawValue)
                                .navigationTitle(mode.rawValue)
                        }
                    }
                }
            }
            .onChange(of: selectedDetail) { newSelectedDetail in
                presentedPath = NavigationPath()
            }
            .navigationDestination(for: EventDetailTypes.self) { eventDetailType in
                switch eventDetailType {
                case .favoritesManagement:
                    EventFavoritesManagementView()
                }
            }
        }
        .navigationBarTitleDisplayMode(.large)
    }
}


#Preview {
    SettingsSpitView()
}
