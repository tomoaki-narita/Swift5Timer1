//
//  ViewController.swift
//  Swift5Timer1
//
//  Created by output. on 2020/02/20.
//  Copyright © 2020 output. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //UIImageViewクラスの,imageView(変数)を宣言
    //画像を表示させる時に必要
    @IBOutlet weak var imageView: UIImageView!
    
    //UIButtonクラスの,startButton(変数)を宣言
    //startボタンを押せなくしたりする時に必要
    @IBOutlet weak var startButton: UIButton!
 
    //UIButtonクラスの,stopButton(変数)を宣言
    //stopボタンを押せなくしたりする時に必要
    @IBOutlet weak var stopButton: UIButton!
    
    
    //classを例えると設計図
    //class(設計図)はUIKitの中に入っている
    
    //Timer()クラスを実体化,timerを他のメソッドで使えるようにする
    var timer = Timer()
    
    //Int型の変数を宣言、Int型とは整数値を扱うもの(0,1,2,3,4,等)
    var count = Int()
    
    //imageArray(変数)にUIImageクラスを入れる(宣言)
    //imageArrayと言うUIImage配列が使えるようになる
    var imageArray = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Viewが出た時にcountの中に0を入れる
        count = 0
        
        //stopButtonを押せなくする isEnabledはプロパティー
        stopButton.isEnabled = false
        
        
        
        //0,1,2,3,4(画像の名前)を繰り返す。(0以上5未満)5は含まない
        //imageArray(配列)の中にfor文を使って画像の名前を入れる
        for i in 0..<5{
            
            //ログを出すコード
            print(i)
            
            //letは定数を宣言する時に使う。定数で一度代入した値は上書きできない
            //UIImage(named: "\(i)")とすると、imageの中にfor文で書いた
            //(i)が入る
            let image = UIImage(named: "\(i)")
            
            //(image!)の!は、imageと言う変数に空(nil)の状態を許さないと言う意味
            //imageArray.append(image!)とすると、
            //imageArray(配列)にimage!を追加する(append)と言うことになる
            imageArray.append(image!)
        
        }
        //0番目の画像(画像の名前)を表示
        imageView.image = UIImage(named: "0")
        
    }
    
    //startボタンが押されると呼ばれるメソッド
    func startTimer(){
        
        //timeInterval: は0.2秒ごとに呼ぶので0.2
        //target: はこのViewController.swiftの中から呼ぶのでself
        //selector: は0.2秒ごとにtimerUpdateメソッドを呼ぶ
        //userInfo: は基本的にはnil
        //repeats: はrepeatさせるのでtrue
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
        
    }
    
    //0.2秒ごとに呼ばれるメソッド
    @objc func timerUpdate(){
        
        //0.2秒ごとにcountの中の数にcount+1をする
        //startTimerメソッドでrepeatsをtrue(repeatします)
        //、にしているので0.2秒ごとに+1されていく
        count = count + 1
        
        //もしcountが4以上になったら、count(変数)の中に0を入れる
        if count > 4 {
            count = 0
        }
        
        //imageArray[count]とすると0.2秒ごとに+1され画像が順番に変わっていき
        //imageViewのimageに反映される
        imageView.image = imageArray[count]
        
        
    }

    //startボタンが押されたときの動作
    @IBAction func start(_ sender: Any  ) {
        
        //startBUttonを押した時に、startButtonを押せなくする
        startButton.isEnabled = false
        
        //stopButtonが押せるようになる
        stopButton.isEnabled = true
        
        //startTimerメソッドを呼ぶ
        startTimer()
        
        
        
    }
    
    //stopボタンが押された時の動作
    @IBAction func stop(_ sender: Any) {
        
        //startButtonを押せるようにする
        startButton.isEnabled = true
        
        //stopButtonが押せなくする
        stopButton.isEnabled = false

        //タイマーを止める
        timer.invalidate()
        
        
    }
    
    
    
    
    
}

