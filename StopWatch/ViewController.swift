//
//  ViewController.swift
//  StopWatch
//
//  Created by Aoi Sakaue on 2016/11/11.
//  Copyright © 2016年 Sakaue Aoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    //発展ハンテイラベル
    @IBOutlet var hanteiLabel: UILabel!
    
    //Float型の理解確認
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //！は〜ではないと言う否定の意味
    @IBAction func start() {
        if !timer.isValid {
            //タイマーが動作していなかったら動かす
            timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: self,
                //書いた段階ではエラー
                selector: #selector(self.up),
                userInfo: nil,
                repeats:true)
        }
        //ハンテイラベルの表示を消す
        hanteiLabel.text = ""
        
    }
    
    @IBAction func stop() {
        if timer.isValid {
            //タイマーが動作していたら停止する
            timer.invalidate()
            //hanteiメソッドの呼び出し、結果を表示する
            self.hantei()
        }
    }
    
    func hantei() {
        //もし経過時間が9.8秒〜10.2秒だったら
        if count > 9.80 && count < 10.20 {
            hanteiLabel.text = "PERFECT!"
        } else if count > 9.70 && count < 10.30 {
            hanteiLabel.text = "GREAT!"
        }else if count > 9.50 && count < 10.50 {
            hanteiLabel.text = "GOOD!"
        }else {
            hanteiLabel.text = "BAD"
        }
    }
    
    @IBAction func reset() {
        //タイマーが動いていたらタイマーを止める
        //タイマーが動いている、動いていない、の書き方チェック
        if timer.isValid {
            timer.invalidate()
        }
        //countを0.00に初期化する
        count = 0.00
        //初期化したcountをlabelに表示させる
        label.text = String(format: "%.2f", count)
    }
    
    func up(){
        //countを0.01(時間経過分)足す
        count = count + 0.01
        //ラベルに小数点以下２桁まで表示
        //%.2fの意味
        label.text = String(format: "%.2f", count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

