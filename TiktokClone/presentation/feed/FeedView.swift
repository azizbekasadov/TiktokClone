//
//  FeedView.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import SwiftUI
import AVFoundation

struct FeedView: View {
    @StateObject private var viewModel: FeedViewModel = .init()
    @State private var scrollPosition: String?
    @State private var player: AVPlayer = .init()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: .zero) {
                ForEach(viewModel.posts) { post in
                    FeedCell(
                        post: post,
                        player: player
                    )
                    .id(post.id)
                    .onAppear {
                        viewModel.playInitialVideoIfNecessary(
                            for: &player,
                            with: post.id
                        )
                    }
                }
            }
            .scrollTargetLayout()
        }
        .onAppear {
            player.pause()
            player.play()
        }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea(edges: .all)
        .onChange(of: scrollPosition, { _, newValue in
            viewModel.replacePlayerItem(for: &player, postId: newValue)
        })
        .task {
            viewModel.fetchPosts()
        }
    }
}

#Preview {
    FeedView()
        .ignoresSafeArea()
}
