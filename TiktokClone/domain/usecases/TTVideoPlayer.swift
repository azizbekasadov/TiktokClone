//
//  TTVideoPlayer.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import AVKit
import UIKit
import SwiftUI
import Foundation
import AVFoundation

struct TTVideoPlayer: UIViewControllerRepresentable {
    var player: AVPlayer
    
    init(player: AVPlayer) {
        self.player = player
    }
    
    func makeUIViewController(
        context: Context
    ) -> UIViewController {
        let playerController = AVPlayerViewController()
        playerController.player = self.player
        playerController.showsPlaybackControls = false
        playerController.showsTimecodes = false
        playerController.exitsFullScreenWhenPlaybackEnds = true
        playerController.allowsPictureInPicturePlayback = true
        playerController.videoGravity = .resizeAspectFill
        return playerController
    }
    
    func updateUIViewController(
        _ uiViewController: UIViewControllerType,
        context: Context
    ) {
        
    }
}
