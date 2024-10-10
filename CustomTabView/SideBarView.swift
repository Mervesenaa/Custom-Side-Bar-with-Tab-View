//
//  SideBarView.swift
//  CustomTabView
//
//  Created by Merve Sena on 7.10.2024.
//

import SwiftUI

struct SideBarView: View {
    @Binding var selectedTab : Tab
    @Binding var isSidebarVisible : Bool
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                Text("Menu")
                    .font(.system(size: 25))
                    .bold()
                    .foregroundStyle(.black)
                    .padding(.top, 20)
                
                Button(action: {
                    withAnimation {
                        isSidebarVisible = false
                        selectedTab = .home
                    }
                }) {
                    Label("Dashboard", systemImage: "house")
                        .font(.system(size: 20))
                        .padding(.vertical, 10)
                        .foregroundStyle(.black)
                }
                
                Button(action: {
                    withAnimation {
                        isSidebarVisible = false
                        selectedTab = .categories
                    }
                }) {
                    Label("Categories", systemImage: "tag")
                        .font(.system(size: 20))
                        .padding(.vertical, 10)
                        .foregroundStyle(.black)
                }
                
                Button(action: {
                    withAnimation {
                        isSidebarVisible = false
                        selectedTab = .accounts
                    }
                }) {
                    Label("Accounts", systemImage: "person.crop.circle")
                        .font(.system(size: 20))
                        .padding(.vertical, 10)
                        .foregroundStyle(.black)
                }
                
                Button(action: {
                    withAnimation {
                        isSidebarVisible = false
                        selectedTab = .settings
                    }
                }) {
                    Label("Settings", systemImage: "gear")
                        .font(.system(size: 20))
                        .padding(.vertical, 10)
                        .foregroundStyle(.black)
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .frame(maxWidth: 300)
        }
    }
}

#Preview {
    SideBarView(selectedTab: .constant(.home), isSidebarVisible: .constant(true))
}
