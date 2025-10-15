//
//  MainTabView.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 14.10.2025.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Int = 0
    
    private let viewRegistry: [String: () -> AnyView] = [
        "Home": { AnyView(FeedView()) },
        "Friends": { AnyView(VStack{})},
        "": { AnyView(VStack{})},
        "Likes": { AnyView(VStack{})},
        "Profile": { AnyView(VStack{})},
    ]
    
    private let tabBarItems: [TabBarItemData] = [
        .init(
            title: "Home",
            image: "TabBar/home"
        ),
        .init(
            title: "Friends",
            image: "TabBar/friends"
        ),
        .init(
            title: "",
            image: "TabBar/main",
            shouldBeRenderedOriginal: true
        ),
        .init(
            title: "Likes",
            image: "TabBar/inbox"
        ),
        .init(
            title: "Profile",
            image: "TabBar/profile"
        ),
    ]
    
    @ViewBuilder
    private func renderProperContainer(for tabBarItem: TabBarItemData) -> some View {
        
    }
    
    var body: some View {
        Group {
            if #available(iOS 18.0, *) {
                MainContentView()
                    .tabViewStyle(.tabBarOnly)
            } else {
                MainContentView()
            }
        }
        .id("main_tabbar_view")
        .background(Color.black)
    }
    
    @ViewBuilder
    private func MainContentView() -> some View {
        TabView(selection: $selectedTab) {
            ForEach(0..<tabBarItems.count, id:\.self) { index in
                let tab = tabBarItems[index]
                viewRegistry[tab.title]?()
                    .mainTabBarItem(tab)
                    .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    .onAppear { selectedTab = index }
                    .tag(index)
            }
        }
        .tint([0, 2].contains(selectedTab) ? Color.white : Color.black)
        .background([0, 2].contains(selectedTab) ? Color.white : Color.black)
    }
}

#Preview {
    MainTabView()
}
