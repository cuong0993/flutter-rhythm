import Flutter
import UIKit
import AVFoundation


public class SoundMethodCallHandler: NSObject {
    
    private lazy var engine = AVAudioEngine()
    private lazy var players = [Int: AVAudioPlayerNode]()
    private lazy var files = [Int: AVAudioFile]()
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "load":
            let attributes = call.arguments as! NSDictionary
            let soundPaths = attributes["soundPaths"] as! [Int: String]
            let baseNotes = attributes["baseNotes"] as! [Int: Int]
            
            var audioFiles = [Int: AVAudioFile]()
            
            for (baseNote, path) in soundPaths {
                let fileUrl = NSURL.init(fileURLWithPath: path)
                let file = try! AVAudioFile(forReading:fileUrl.absoluteURL!)
                audioFiles[baseNote] = file
            }
            
            for (note, baseNote) in baseNotes {
                let file = audioFiles[baseNote]!
                let player = AVAudioPlayerNode()
                let pitch: Float = Float((note - baseNote) * 100)
                players[note] = player
                files[note] = file
                engine.attach(player)
                if (pitch != 0) {
                    let pitchEffect = AVAudioUnitTimePitch()
                    pitchEffect.pitch = pitch
                    engine.attach(pitchEffect)
                    engine.connect(player, to: pitchEffect, format: file.processingFormat)
                    engine.connect(pitchEffect, to: engine.mainMixerNode, format: file.processingFormat)
                } else {
                    engine.connect(player, to: engine.mainMixerNode, format: file.processingFormat)
                }
            }
            engine.prepare()
            do {
                try engine.start()
            } catch let err {
                print(err.localizedDescription)
            }
            result(nil)
        case "play":
            let attributes = call.arguments as! NSDictionary
            let note = attributes["note"] as! Int
            let player = players[note]!
            if player.isPlaying {
                player.stop()
            }
            player.scheduleFile(files[note]!, at: nil)
            player.play()
            result(nil)
        case "release":
            players.removeAll()
            files.removeAll()
            engine.stop()
            engine.reset()
            result(nil)
        default:
            result("notImplemented")
        }
    }
}
