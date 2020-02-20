//
//  ViewController.swift
//  Swift5Timer1
//
//  Created by output. on 2020/02/20.
//  Copyright © 2020 output. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var startButton: UIButton!
 
    @IBOutlet weak var stopButton: UIButton!
    
    var timer = Timer()
    
    var count = Int()
    
    var imageArray = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 0
        
        stopButton.isEnabled = true
        
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerUpdate(){
        
        count = count + 1
        imageView.image = imageArray[count]
        
        
    }

    @IBAction func start(_ sender: Any  ) {
        
        startButton.isEnabled = true
        
    }
    
    
    @IBAction func stop(_ sender: Any) {
        
        startButton.isEnabled = false
    }
    
    
    
    
    
}

