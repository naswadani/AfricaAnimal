//
//  VideosModel.swift
//  Africa
//
//  Created by naswakhansa on 29/11/23.
//

import SwiftUI

struct Video : Codable, Identifiable{
    let id : String
    let name : String
    let headline : String
    //Computed property
    
    var thumbnail: String{
        "video-\(id)"
    }
}
