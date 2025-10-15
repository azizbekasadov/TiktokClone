//
//  NotificationCell.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack {
            UserAvatarView()
            
            HStack(spacing: 10) {
                MainContentText()
            }
            
            Spacer()
            
            Rectangle()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
    }
    
    @ViewBuilder
    private func MainContentText() -> some View {
        UserAccountNameText() +
        MainMessageText() +
        TimestampmMessageText()
    }
    
    @ViewBuilder
    private func UserAccountNameText() -> Text {
        Text("max.verstappen")
            .font(.footnote)
            .fontWeight(.semibold)
    }
    
    @ViewBuilder
    private func MainMessageText() -> Text {
        Text(" liked one of your posts  ")
            .font(.footnote)
            .fontWeight(.regular)
    }
    
    @ViewBuilder
    private func TimestampmMessageText() -> Text {
        Text("3d")
            .font(.caption)
            .foregroundStyle(.gray)
            .fontWeight(.regular)
    }
}

#Preview {
    NotificationCell()
        .padding()
}
