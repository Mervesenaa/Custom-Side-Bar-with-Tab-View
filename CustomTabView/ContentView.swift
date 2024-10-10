//
//  ContentView.swift
//  CustomTabView
//
//  Created by Merve Sena on 7.10.2024.
//

import SwiftUI

enum Tab {
    case home
    case categories
    case accounts
    case settings
}

struct ContentView: View {
    @State private var selectedTab : Tab = .home
    @State private var isSidebarVisible : Bool = false
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                ZStack(alignment: .leading) {
                    VStack {
                            Spacer()
                            switch selectedTab {
                            case .home:
                                HomeView()
                            case .categories:
                                CategoriesView()
                            case .accounts:
                                AccountsView()
                            case .settings:
                                SettingsView()
                            }
                            Spacer()
                            
                            HStack {
                                TabbarButton(image: "house", selectedTabbar: getSelectedTabBarImage(), reader: reader) {
                                    selectedTab = .home
                                }
                                Spacer()
                                TabbarButton(image: "tag.fill", selectedTabbar: getSelectedTabBarImage(), reader: reader) {
                                    selectedTab = .categories
                                }
                                Spacer()
                                TabbarButton(image: "person.crop.circle", selectedTabbar: getSelectedTabBarImage(), reader: reader) {
                                    selectedTab = .accounts
                                }
                                Spacer()
                                TabbarButton(image: "gear", selectedTabbar: getSelectedTabBarImage(), reader: reader) {
                                    selectedTab = .settings
                                }
                            }
                            .padding(.horizontal, 50)
                            .background(Color.white)
                            
                    }
                
                if isSidebarVisible {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                isSidebarVisible = false
                            }
                        }
                    
                    SideBarView(selectedTab: $selectedTab, isSidebarVisible: $isSidebarVisible)
                        .frame(width: 250)
                        .transition(.move(edge: .leading))
                        .zIndex(1)
                }
                
                Spacer()
                    
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            withAnimation {
                                isSidebarVisible.toggle()
                            }
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .frame(width: 24, height: 18)
                                .foregroundStyle(.black)
                        }
                        .opacity(isSidebarVisible ? 0 : 1)
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text(navigationTitle())
                            .opacity(isSidebarVisible ? 0 : 1)
                            .font(.headline)
                    }
                }
            }
        }
    }
    
    private func getSelectedTabBarImage() -> String {
        switch selectedTab {
        case .home:
            "house"
        case .categories:
            "tag.fill"
        case .accounts:
            "person.crop.circle"
        case .settings:
            "gear"
        }
    }
    
    func navigationTitle() -> String {
        switch selectedTab {
        case .home:
            return "Home"
        case .categories:
            return "Categories"
        case .accounts:
            return "Accounts"
        case .settings:
            return "Settings"
        }
    }
}

#Preview {
    ContentView()
}
