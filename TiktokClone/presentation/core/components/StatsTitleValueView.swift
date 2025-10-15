//
//  StatsTitleValueView.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import SwiftUI

struct StatsTitleValueView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(width: 80)
    }
}

#Preview {
    StatsTitleValueView(
        title: "Following",
        value: "1.2K"
    )
}
