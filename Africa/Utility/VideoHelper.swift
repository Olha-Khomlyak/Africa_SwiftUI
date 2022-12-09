//
//  VideoHelper.swift
//  Africa
//
//  Created by Olha Khomlyak on 8.12.2022.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer{
    if let url =  Bundle.main.url(forResource: fileName, withExtension: fileFormat){
        videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()
    }
    return videoPlayer!
}
