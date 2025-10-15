//
//  UserAvatarView.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import SwiftUI

struct UserAvatarView: View {
    var imageName: String?
    let size: CGSize
    
    init(
        imageName: String? = nil,
        size: CGSize = .init(width: 48, height: 48)
    ) {
        self.imageName = imageName
        self.size = size
    }
    
    var body: some View {
        if let imageName {
            Image(imageName)
                .resizable()
                .frame(
                    width: size.width,
                    height: size.height
                )
                .foregroundStyle(Color(uiColor: .systemGray4))
        } else {
            Image(systemName: "person.circle.fill")
            .resizable()
            .frame(
                width: size.width,
                height: size.height
            )
            .foregroundStyle(Color(uiColor: .systemGray4))
        }
    }
}

#Preview {
    UserAvatarView()
}
