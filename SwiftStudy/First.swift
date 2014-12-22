//
//  ViewController.swift
//  List
//
//  Created by Takuro Mori on 2014/11/25.
//  Copyright (c) 2014年 Takuro Mori. All rights reserved.
//

import UIKit

class First: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    //<グローバル変数宣言>
    //リスト
    var tableView = UITableView()
    //文字入力部分
    var textField = UITextField()
    //文字をリストに追加するボタン
    var inputButton = UIButton()
    //リストに表示する内容を積んでいく配列
    var inputArray : [String] = [String]()

    //===========================追加部分=================================
    
    
    //選択した文字列を記憶するための変数
    var selectWord : NSString = ""
    
    
    //===========================ここまで=================================

    
    //<初期化>
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //画面の背景を設定する
        self.view.backgroundColor = UIColor(red: 0.0, green: 0.8, blue: 0.6, alpha: 1.0)
        
        //(tableViewを設定)
        //位置・大きさ指定
        tableView.frame = CGRectMake(10, 100, 300, 400)
        //背景を設定
        tableView.backgroundColor = UIColor(red: 0.0, green: 0.8, blue: 0.6, alpha: 1.0)
        //罫線を消す
        tableView.separatorColor = UIColor.clearColor()
        //データソースをselfに設定
        tableView.dataSource = self
        //デリゲートをselfに設定
        tableView.delegate = self
        //tableView上のセルを一意に識別するためのIdentefierをつける
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        //tableViewをビューの上に貼付ける
        self.view.addSubview(tableView)
        
        //(textFieldを設定)
        //位置・大きさ指定
        textField.frame = CGRectMake(10, 50, 200, 30)
        //デリゲートをselfに設定
        textField.delegate = self
        //入力部分の周りを線で囲む
        textField.borderStyle = UITextBorderStyle.RoundedRect
        //textFieldをビューの上に貼付ける
        self.view.addSubview(textField)
        
        //(Buttonを設定)
        //位置・大きさ指定
        inputButton.frame = CGRectMake(220, 50, 80, 30)
        //ボタンの背景を赤に設定
        inputButton.backgroundColor = UIColor.blueColor()
        //タイトルを設定する
        inputButton.setTitle("Input", forState: .Normal)
        //ボタンの角を丸くする
        inputButton.layer.cornerRadius = 20.0
        //ボタンが押された時に呼び出される関数を設定
        inputButton.addTarget(self, action: "INPUTbutton:", forControlEvents: .TouchUpInside)
        //inputButtonをビューの上に貼付ける
        self.view.addSubview(inputButton)
    }
    
    //<メモリが足りなくなった時>
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //<Inputボタンを押した時>
    func INPUTbutton(sender : UIButton){
        //関数を呼び出す
        ENDtext()
    }
    
    //<文字入力中リターンキーを押した時>
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //キーボードを隠す
        textField.endEditing(true)
        //関数を呼び出す
        ENDtext()
        
        return true
    }

    //===========================追加部分=================================

    
    //<文字入力終了した時>
    func ENDtext(){
        //配列に現在入力した文字を追加する
        inputArray.append(textField.text)
        //入力部分を初期化する
        textField.text = ""
        //リストを更新する
        tableView.reloadData()
    }
    
    //<textFieldの文字数を制限する>
    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool {
        //入力済みの文字と入力された文字を合わせて取得.
        var str = textField.text + string
        //10文字以下ならtrueを返す.
        if countElements("\(str)") < 10 {
            return true
        }
        
        //(アラートを設定)
        let alert = UIAlertView()
        //タイトルを設定
        alert.title = "入力エラー"
        //メッセージを設定
        alert.message = "入力文字数が超過しています.(10字以内)"
        //ボタンを設定
        alert.addButtonWithTitle("OK")
        //アラートを表示する
        alert.show()
        
        //10文字を超えた場合falseを返す
        return false
    }
    
    //<各セルが選択された時>
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //選択した文字列をグローバル変数へ代入
        selectWord = inputArray[indexPath.row]
        //"toSecond"というIdentifierを持ったSegueを呼び出す
        self.performSegueWithIdentifier("toSecond", sender: self)
    }
    
    
    //===========================ここまで=================================
    
    //<リストに表示する要素数>
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //配列の要素数を返す
        return inputArray.count
    }
    
    //<リストに表示する中身>
    //リストに表示する要素数分呼び出され、その度indexPath.rowの値でインクリメントが行われる。
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //既存のセルを定数として宣言する
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as UITableViewCell
        //セルの背景を決定する
        cell.backgroundColor = UIColor(red: 1.0, green: 0.8, blue: 0.8, alpha: 0.85)

        //セル内のラベルに文字を代入する
        cell.textLabel.text = inputArray[indexPath.row]
        //セルを返す
        return cell
    }
    
    //===========================追加部分=================================
    
    
    //<画面遷移時に値を渡す>
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //toSecondというidentifierを持つsegueの場合
        if segue.identifier == "toSecond"{
            //SecondViewControllerを定数として宣言する
            var VC : Second = segue.destinationViewController as Second
            //SecondViewController内のselectWordにこのクラスのselectWordを代入する
            VC.selectWord = self.selectWord
        }
    }
    
    //===========================ここまで=================================
}

