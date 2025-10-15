//
//  FeedViewModel.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import Combine
import Foundation
import AVFoundation

final class FeedViewModel: ObservableObject {
    private let decoder: LocalJSONDataDecoder = .shared
    
    @Published var errorMessage: String?
    @Published var posts = [Post]()
    
    init() {}
    
    func fetchPosts() {
        decoder.decode(
            MediaData.self,
            from: "feed_sample",
            completion: { [weak self] result in
                guard let self else {
                    return
                }
                
                switch result {
                case .success(let res):
                    let postCategory: PostCategory? = res.categories.first
                    self.posts = postCategory?.videos.compactMap {
                        Post(id: $0.id, videoURL: $0.videoURL)
                    } ?? []
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        )
    }
    
    func playInitialVideoIfNecessary(
        for player: inout AVPlayer,
        with scrollPosition: String? = nil
    ) {
        guard
            scrollPosition == nil,
            let post = posts.first,
            player.currentItem == nil,
            let videoURL = URL(string: post.videoURL)
        else {
            player.pause()
            return
        }
        
        player.replaceCurrentItem(with: AVPlayerItem(url: videoURL))
    }
    
    func replacePlayerItem(
        for player: inout AVPlayer,
        postId: String?
    ) {
        guard
            let postId,
            let currentPost = posts.first(where: { $0.id == postId }),
            let videoURL = URL(string: currentPost.videoURL)
        else {
            player.pause()
            return
        }
        
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: videoURL)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
}
