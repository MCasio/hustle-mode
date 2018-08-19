//
//  ViewController.swift
//  hustle-mode
//
//  Created by Amr Mohamed on 7/19/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powrPtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var onLbl: UILabel!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var husleLbl: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player =  try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }

    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powrPtn.isHidden = true
        player.play()

        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 140, width: 375, height: 402)
        }) { (finished) in
            self.husleLbl.isHidden = false
            self.onLbl.isHidden = false
        }
    }
    

}

