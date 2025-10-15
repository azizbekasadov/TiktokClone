//
//  NotificationsView.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12.0) {
                ForEach(0..<30) { index in
                    NotificationCell()
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.bottom, 16.0)
            .padding([.top, .horizontal], 16.0)
        }
    }
}

#Preview {
    NavigationStack {
        NotificationsView()
    }
}
