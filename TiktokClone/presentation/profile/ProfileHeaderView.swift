//
//  ProfileHeaderView.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(spacing: 16.0) {
            UserInfoView()
            
            StatsView()
        }
        .padding(.top)
    }
    
    @ViewBuilder
    private func StatsView() -> some View {
        HStack(alignment: .center, spacing: 16.0) {
            StatsTitleValueView(
                title: "Following",
                value: "0"
            )
            
            StatsTitleValueView(
                title: "Followers",
                value: "1.2M"
            )
            
            StatsTitleValueView(
                title: "Likes",
                value: "860K"
            )
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private func UserInfoView() -> some View {
        VStack(spacing: 8.0) {
            // profile
            UserAvatarView(
                size: .init(
                    width: 80,
                    height: 80
                )
            )
            
            // username
            Text("@lewis.hamilton")
                .font(.subheadline)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    NavigationStack {
        ProfileHeaderView()
    }
}
