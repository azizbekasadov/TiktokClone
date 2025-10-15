//
//  UserCell.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12.0) {
            UserAvatarView()
            
            VStack(alignment: .leading) {
                Text("max.versteppen")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Max Versteppen")
                    .font(.footnote)
            }
            
            Spacer()
        }
    }
}

#Preview {
    UserCell()
        .padding()
}
