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
        
        //stopBUttonを押せなくする isEnabledはプロパティー
        stopButton.isEnabled = false
        
        
        
        //0,1,2,3,4を繰り返す
        for i in 0..<5{
            
            print(i)
            
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        
        }
        //0番目の画像を表示
        imageView.image = UIImage(named: "0")
        
    }
    
    //メソッド
    func startTimer(){
        
        //タイマーを回す　0.2秒ごとにあるメソッドを呼ぶ
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
        
    }
    
    //0.2秒ごとに呼ばれる
    @objc func timerUpdate(){
        
        count = count + 1
        
        if count > 4 {
            count = 0
        }
        imageView.image = imageArray[count]
        
        
    }

    @IBAction func start(_ sender: Any  ) {
        
        //startBUttonを押した時に、startButtonを押せなくする
        startButton.isEnabled = false
        
        //stopButtonが押せるようになる
        stopButton.isEnabled = true
        
        startTimer()
        
        
        
    }
    
    
    @IBAction func stop(_ sender: Any) {
        
        //startButtonを押せるようにする
        startButton.isEnabled = true
        
        //stopButtonが押せなくする
        stopButton.isEnabled = false

        //タイマーを止める
        timer.invalidate()
        
        
    }
    
    
    
    
    
}

