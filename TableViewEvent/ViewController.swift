//
//  ViewController.swift
//  TableViewEvent
//
//  Created by 梁雅軒 on 2017/2/25.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView = UITableView()
    var arrData = [MyInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        tableView.register(UINib(nibName: "SpecialCell",bundle: nil), forCellReuseIdentifier: "SpecialCell")
        for i in 1...30{
            let info = MyInfo()
            info.title = "\(i)"
            info.isSpecial = i == 2
            arrData.append(info)
        }
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //tableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = arrData[indexPath.row]
        let cellId = info.isSpecial ? "SpecialCell" : "MyCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MyCell
        cell.tag = indexPath.row
        cell.setInfo(info: info) { (index) in
            let info = self.arrData[index]
            info.isSelect = !info.isSelect
            tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}

class MyInfo {
    var title:String?
    var isSelect:Bool = false
    var isSpecial:Bool = false
}
