//
//  VideoModel.swift
//  Africa
//
//  Created by Olha Khomlyak on 8.12.2022.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name:String
    let headline:String
    
    //Computed Property
    var thumbnail:String {
        "video-\(id)"
    }
}
