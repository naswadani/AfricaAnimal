//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by naswakhansa on 06/12/23.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer? {
  if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
    videoPlayer = AVPlayer(url: url)
    if let player = videoPlayer {
      player.play()
    }
    return videoPlayer
  }
  return nil
}


