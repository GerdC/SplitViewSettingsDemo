//
//  SimpleSplitView.swift
//  SplitViewSettingsDemo
//
//  Created by Gerd Castan on 14.10.23.
//

import SwiftUI

/// this is an early version of the file for the article
struct SettingsSpitView: View {
    /// show all columns, side by side
    @State private var visibility: NavigationSplitViewVisibility = .all

    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            SettingsSidebarView_()
        } detail: {

        }
        // the next modifier also modifies the list style of SettingsSidebarView
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    return SettingsSpitView()
}
