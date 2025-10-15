//
//  FeedCell.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import SwiftUI
import AVKit

enum FeedControlPanelType: String, Identifiable, CaseIterable {
    case like
    case save
    case comment
    case share
    
    var id: String {
        return self.rawValue
    }
    
    var imageName: String {
        return "Feed/" + self.rawValue
    }
}

struct FeedCell: View {
    // like
    // save
    // comment
    // share
    // again dynamic lookup // TODO: replace it with a factory api
    
    @State private var shouldShowPausebutton: Bool = false
    
    let post: Post
    let player: AVPlayer
    
    init(post: Post, player: AVPlayer) {
        self.post = post
        self.player = player
    }
    
    var body: some View {
        Button {
            handlePlayerState()
        } label: {
            ZStack {
                TTVideoPlayer(
                    player: self.player
                )
                .ignoresSafeArea()
                .containerRelativeFrame([
                    .horizontal, .vertical
                ])
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        PostTitleAndTagsView()
                        
                        Spacer()
                        
                        ControlButtons()
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 110)
                
                VStack {
                    Spacer()
                    
                    Image(systemName: player.timeControlStatus == .playing ? "pause.fill" : "play.fill")
                        .font(.system(size: 100))
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                }
                .opacity(shouldShowPausebutton ? 1 : 0)
            }
        }
    }
    
    private func handlePlayerState() {
        withAnimation {
            shouldShowPausebutton = true
        }
        
        defer {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation {
                    shouldShowPausebutton = false
                }
            }
        }
        
        switch player.timeControlStatus {
        case .paused:
            player.play()
        case .waitingToPlayAtSpecifiedRate:
            player.pause()
        case .playing:
            player.pause()
        @unknown default:
            break
        }
    }
    
    @ViewBuilder
    private func SubscribeButton() -> some View {
        Button {
            
        } label: {
            ZStack {
                Image("dummy/nt_user")
                    .resizable()
                    .background(
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                    )
                
                VStack {
                    Spacer()
                    
                    Image("Feed/subscribe")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .padding(.bottom, -11)
                }
            }
        }
        .frame(width: 42, height: 42)
    }
    
    @ViewBuilder
    private func PostTitleAndTagsView() -> some View {
        VStack(alignment: .leading) {
            Text("st.moritz.vibes")
                .fontWeight(.semibold)
            
            Text("Rocket ship prepare for takeoff!!!")
        }
        .foregroundStyle(.white)
        .font(.subheadline)
    }
    
    @ViewBuilder
    private func ControlButtons() -> some View {
        VStack(spacing: 24) {
            SubscribeButton()
            
            ForEach(FeedControlPanelType.allCases, id:\.id) { controlType in
                Button {
                    
                } label: {
                    VStack(spacing: 16) {
                        Image(controlType.imageName)
                            .scaledToFit()
                            .frame(width: 28, height: 22)
                        
                        if !([FeedControlPanelType.share].contains(controlType)) {
                            
                            Text("\((0..<99).randomElement()!)")
                                .font(.footnote)
                                .foregroundStyle(.white)
                                .bold()
                        }
                    }
                }
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    FeedCell(
        post: .init(
            id: NSUUID().uuidString,
            videoURL: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        ),
        player: AVPlayer(url: .init(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
    )
}
