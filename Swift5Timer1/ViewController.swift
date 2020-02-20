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
        
        for i in 0..<5{
        
            print(i)
            
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        
        }
        
        imageView.image = UIImage(named: "0")
        
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerUpdate(){
        
        count = count + 1
        
        if count > 4 {
            count = 0
        }
        imageView.image = imageArray[count]
        
        
    }

    @IBAction func start(_ sender: Any  ) {
        
        startButton.isEnabled = false
        stopButton.isEnabled = true
        
        startTimer()
        
        
        
    }
    
    
    @IBAction func stop(_ sender: Any) {
        
        startButton.isEnabled = true
        stopButton.isEnabled = false

        
        timer.invalidate()
        
        
    }
    
    
    
    
    
}

