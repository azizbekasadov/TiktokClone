//
//  TabBarItem.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 14.10.2025.
//

import SwiftUI

struct TabBarItemData: Identifiable {
    let id: String
    let title: String
    let image: String
    let shouldBeRenderedOriginal: Bool
    
    init(
        id: String = UUID().uuidString,
        title: String,
        image: String,
        shouldBeRenderedOriginal: Bool = false
    ) {
        self.id = id
        self.title = title
        self.image = image
        self.shouldBeRenderedOriginal = shouldBeRenderedOriginal
    }
}

protocol TabBarItem: ViewModifier {
    var data: TabBarItemData { get }
    
    init(data: TabBarItemData)
}

struct MainTabBarItem: TabBarItem {
    let data: TabBarItemData
    
    func body(content: Content) -> some View {
        content
            .tabItem {
                VStack {
                    Image(data.image)
                        .renderingMode(data.shouldBeRenderedOriginal ? .original : .template)
                    Text(data.title)
                }
                .id(data.id)
            }
    }
}

extension View {
    func mainTabBarItem(_ data: TabBarItemData) -> some View {
        modifier(MainTabBarItem(data: data))
    }
}
