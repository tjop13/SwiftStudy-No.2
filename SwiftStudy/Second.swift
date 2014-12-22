//
//  ViewController.swift
//  List
//
//  Created by Takuro Mori on 2014/11/25.
//  Copyright (c) 2014年 Takuro Mori. All rights reserved.
//

//===========================追加部分=================================


import UIKit

class Second: UIViewController {
    //Firstクラスで値を代入する変数を宣言
    var selectWord : NSString = ""
    
    //<初期化>
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //画面の背景を設定する
        self.view.backgroundColor = UIColor(red: 0.0, green: 0.8, blue: 0.6, alpha: 1.0)
        
        //(textLabelを宣言)かつ大きさ指定
        var textLabel = UILabel(frame: CGRectMake(0, 0, 200, 40))
        //場所指定
        textLabel.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
        //背景を黒に指定
        textLabel.backgroundColor = UIColor.blackColor()
        //文字の色を白に指定
        textLabel.textColor = UIColor.whiteColor()
        //フォント指定
        textLabel.font = UIFont.boldSystemFontOfSize(30)
        //文字をラベルの中央へ持ってくる
        textLabel.textAlignment = NSTextAlignment.Center
        //文字を代入する
        textLabel.text = selectWord
        //textLabelをビューの上に貼付ける
        self.view.addSubview(textLabel)
        
        //(戻るボタン設定)
        var backButton = UIButton(frame: CGRectMake(0, 0, 200, 40))
        //場所指定
        backButton.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height-50)
        //ボタンの背景を赤に設定
        backButton.backgroundColor = UIColor.blueColor()
        //タイトルを設定する
        backButton.setTitle("Back", forState: .Normal)
        //ボタンがハイライトされた時に光る
        backButton.showsTouchWhenHighlighted = true
        //ボタンの角を丸くする
        backButton.layer.cornerRadius = 20.0
        //ボタンが押された時に呼び出される関数を設定
        backButton.addTarget(self, action: "BACKbutton:", forControlEvents: .TouchUpInside)
        //inputButtonをビューの上に貼付ける
        self.view.addSubview(backButton)

    }
    
    //<メモリが足りなくなった時>
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func BACKbutton(sender:UIButton){
        self.performSegueWithIdentifier("ToFirst", sender: self)
    }
    
}


//===========================ここまで=================================
