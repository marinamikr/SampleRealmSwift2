//
//  ShowViewController.swift
//  SampleRealm2
//
//  Created by 原田摩利奈 on 2019/01/23.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import UIKit
import RealmSwift

class ShowViewController: UIViewController {
    
    @IBOutlet var showTableView: UITableView!
    var realm :Realm!
    var realmModelArray:Results<RealmModel>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
        realmModelArray = realm.objects(RealmModel.self)
        
        // Do any additional setup after loading the view.
        showTableView.dataSource = self
        showTableView.delegate = self
        self.showTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
    }
    
}


extension ShowViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realmModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = showTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.setDate(dateData: realmModelArray[indexPath.row].date)
        cell.setImage(imageData: UIImage(data: realmModelArray[indexPath.row].image as Data)!)
        cell.setContents(contentsData: realmModelArray[indexPath.row].text)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
