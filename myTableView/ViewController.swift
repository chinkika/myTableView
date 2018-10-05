//
//  ViewController.swift
//  myTableView
//
//  Created by sbc on 2018/07/20.
//  Copyright © 2018年 cpi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myImgView: UIImageView!
    
    private let sharp = ["sh_k", "sh_n"]
    private let ssl = ["s_t"]
    private let cpi = ["cpi_f", "cpi_k", "cpi_c"]
    private let member = ["sh_k", "sh_n", "s_t", "cpi_f", "cpi_k", "cpi_c"]

    private let flagSharp:[String] = ["1k.jpg", "2n.jpg"]
    private let flagSsl:[String] = ["3t.jpg"]
    private let flagCpi:[String] = ["4f.jpg", "5k.jpg", "6c.jpg"]
    private let flag:[String] = ["1k.jpg", "2n.jpg", "3t.jpg","4f.jpg", "5k.jpg", "6c.jpg"]
    
    private let mySections = ["sharp", "ssl", "cpi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //cell名の登録を行う
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")

        myTableView.tableFooterView = UIView(frame: CGRect.zero)
        //datasourceの設定をする
        myTableView.dataSource = self
        
        //delegateを設定する
        myTableView.delegate = self
        
        //viewに追加する
        self.view.addSubview(myTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //sectionsの数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySections.count
    }
    
    //sectionsのタイトルを返す
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section]
    }
    
    //tableに表示する配列の総数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
           return sharp.count
        }else if section == 1{
            return ssl.count
        }else if section == 2{
            return cpi.count
        }else{
            return 0
        }
    }
    
    //cellに値を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = sharp[indexPath.row]
            cell.imageView?.image = UIImage(named: flagSharp[indexPath.row])
        }else if indexPath.section == 1{
            cell.textLabel?.text = ssl[indexPath.row]
            cell.imageView?.image = UIImage(named: flagSsl[indexPath.row])
        }else if indexPath.section == 2{
            cell.textLabel?.text = cpi[indexPath.row]
            cell.imageView?.image = UIImage(named: flagCpi[indexPath.row])
        }
        return cell
    }
    
    //cell選択されたら
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("indexPath.row:", indexPath.row)
        print("indexPath.section:", indexPath.section)
        myImgView.image = UIImage(named: "lucky.png")
    }
    
    @IBAction func onClkButton(_ sender: UIButton) {
        let luckyNum = Int(arc4random_uniform(6))
        myImgView.image = UIImage(named: flag[luckyNum])
 
        let alert = UIAlertController(title: "\(member[luckyNum])", message: "is today's lucky dog", preferredStyle: .alert)
        let btnOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(btnOK)
        
        present(alert, animated: true, completion: nil)
    }
    
}

