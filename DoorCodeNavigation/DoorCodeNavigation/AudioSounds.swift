//
//  AudioSounds.swift
//  DoorCodeNavigation
//
//  Created by Jason Tipp on 4/14/22.
//

import SwiftUI
import AVKit

class SoundManager{
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound() {
        
        guard  let url = Bundle.main.url(forResource: "turnleft", withExtension: ".mp3") else {return}
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
       
        
    }
    func playSound2() {
        
        guard  let url = Bundle.main.url(forResource: "turnright", withExtension: ".mp3") else {return}
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
       
        
    }
}

struct AudioSounds: View {
    
var soundManager = SoundManager()
    
    var body: some View {
        VStack(spacing: 30){
            Button("Play Sound 1"){
                SoundManager.instance.playSound()
                
            }
            Button("Play Sound 2"){
                SoundManager.instance.playSound2()
            }
        }
    }
}

struct AudioSounds_Previews: PreviewProvider {
    static var previews: some View {
        AudioSounds()
    }
}
