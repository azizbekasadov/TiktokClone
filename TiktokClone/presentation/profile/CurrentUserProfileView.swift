//
//  CurrentUserProfileView.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import SwiftUI

struct CurrentUserProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // profile header
                ProfileHeaderView()
                
                EditProfileButton()
                
                Divider()
                
                PostsGridView()
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func EditProfileButton() -> some View {
        Button {
            
        } label: {
            Text("Edit Profile")
                .padding(.vertical, 5)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(maxWidth: 360, maxHeight: 32)
                .foregroundStyle(.black)
                .background(Color(uiColor: .systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
    }
}

#Preview {
    NavigationStack {
        CurrentUserProfileView()
    }
}
