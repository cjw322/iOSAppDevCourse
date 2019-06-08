//
//  Song.swift
//  cjw322_p4
//
//  Created by Cora Wu on 10/28/18.
//  Copyright © 2018 Cora Wu. All rights reserved.
//

import UIKit

class Song {
    
    var songName: String
    var artistName: String
    var albumName: String
    
    init(songName: String, artistName: String, albumName: String) {
        self.songName = songName
        self.artistName = artistName
        self.albumName = albumName
    }
    
}
