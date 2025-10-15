//
//  PostsGridView.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import SwiftUI

struct PostsGridView: View {
    private let items = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
    ]
    
//    dummy/dummypost
    var body: some View {
        GeometryReader { geometry in
            LazyVGrid(columns: items, spacing: 2) {
                ForEach(0..<15) { index in
                    Rectangle()
                        .frame(width: geometry.size.width/CGFloat(items.count) - 2, height: 175)
                        .clipShape(Rectangle())
                        .border(Color.gray, width: 1)
                }
            }
        }
    }
}

#Preview {
    ScrollView {
        PostsGridView()
    }
}
