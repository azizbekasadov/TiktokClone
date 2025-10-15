//
//  Post.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import Foundation

protocol Postable: Identifiable, Codable {
    var id: String { get }
    var videoURL: String { get }
}

struct Post: Postable {
    let id: String
    let videoURL: String
    //...
}

struct PostMovie: Postable {
    let id: String
    
    var videoURL: String {
        sources.first ?? ""
    }
    
    let sources: [String]
    let subtitle: String
    let thumb: String
    let title: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case sources = "sources"
        case subtitle, thumb, title, description
    }
    
    init(
        id: String = NSUUID().uuidString,
        sources: [String],
        subtitle: String,
        thumb: String,
        title: String,
        description: String
    ) {
        self.id = id
        self.sources = sources
        self.subtitle = subtitle
        self.thumb = thumb
        self.title = title
        self.description = description
    }
}

extension PostMovie {
    init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = NSUUID().uuidString
        sources = try values.decode([String].self, forKey: .sources)
        thumb = try values.decode(String.self, forKey: .thumb)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
        subtitle = try values.decode(String.self, forKey: .title)
    }
}
