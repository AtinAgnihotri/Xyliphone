import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        let notePressed = sender.currentTitle!
        print("\(notePressed) Note Pressed")
        playSound(note: notePressed)
        timedAnimation(senderBtn: sender)
    }
    
    func timedAnimation(senderBtn : UIButton) {
        senderBtn.alpha = 0.5
        let delayInSeconds = 0.2
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            senderBtn.alpha = 1
        }
        
    }
    
    func playSound(note : String) {
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
