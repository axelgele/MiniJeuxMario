//
//  ViewController.swift
//  Mario
//
//  Created by GELE Axel on 03/03/2017.
//  Copyright © 2017 GELE Axel. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet var coinImage: UIImageView!
    @IBOutlet var marioButton: UIButton!
    var nombre : Int = 0
    var diceHeight : Int = 0
    var diceWidth : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        marioButton.frame.origin = CGPoint(x: 20, y: 470)
        coinImage.frame.origin = CGPoint(x: 120, y: 200)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func marioAction(_ sender: Any) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            
            self.diceHeight = Int(arc4random_uniform(500) + 200)
            self.diceWidth = Int(arc4random_uniform(300) + 20) + Int(arc4random_uniform(20) + 1)
            
            self.marioButton.center.x =  CGFloat(self.diceWidth)
            self.marioButton.center.y =  CGFloat(self.diceHeight)
            
        }, completion: nil)
        //resetMario()
        compterSaut()
        play()
    }
    
    func compterSaut()  {
        nombre = nombre + 1
        countLabel.text = String(nombre)
    }
    
//    func resetMario()  {
//        var monX = self.view.frame.size.width
//        marioButton.frame.origin = CGPoint(x: 20, y: 470)
//    }
    
    var spundPlay : AVAudioPlayer?
    func play() {
        guard let url = Bundle.main.url(forResource: "sounds", withExtension: "mp3")
            else{
            print("Erreur")
            return
        }
        do{
            try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try! AVAudioSession.sharedInstance().setActive(true)
            spundPlay = try! AVAudioPlayer.init(contentsOf: url, fileTypeHint: AVFileTypeMPEG4)
            spundPlay?.play()
        }catch let error as NSError{
            print("Pas boooon")
        }
        }
    }



