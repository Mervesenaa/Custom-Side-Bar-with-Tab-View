//
//  AccountsView.swift
//  CustomTabView
//
//  Created by Merve Sena on 7.10.2024.
//

import SwiftUI

struct AccountsView: View {
    var body: some View {
        VStack {
            Text("ACCOUNTS VIEW")
                .font(.largeTitle)
            .foregroundStyle(Color(red: 95/255 , green: 111/255 , blue: 101/255))
        }
        .navigationTitle("Accounts")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AccountsView()
}
