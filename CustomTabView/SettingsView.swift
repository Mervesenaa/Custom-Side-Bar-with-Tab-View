//
//  SettingsView.swift
//  CustomTabView
//
//  Created by Merve Sena on 7.10.2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("SETTINGS VIEW")
                .font(.largeTitle)
            .foregroundStyle(Color(red: 95/255 , green: 111/255 , blue: 101/255))
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SettingsView()
}
