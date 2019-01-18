//
//  SecondViewController.swift
//  testcustom
//
//  Created by 김지훈 on 18/01/2019.
//  Copyright © 2019 KimJihun. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

import SwiftyJSON

class SecondViewController: UIViewController {

    
    var isLoading = false
    let refreshControl = UIRefreshControl()
    var userCount = 0
    var page = 1
    let tableView = UITableView()
    var dataUrl : [String] = [ ]
    var descArray : [String] = [ ]
    var stargazersArray : [Int] = []
    var watchersArray : [Int] = []
    var createdArray : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        let resNib = UINib(nibName: "profileTableViewCell", bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(resNib, forCellReuseIdentifier: "profileTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        //        loadBeers()
        
        loadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc private func refresh() {
        print(1)
        page += 1
        loadData()
    }
    func loadData(){
        
        dataUrl.removeAll()
        descArray.removeAll()
        stargazersArray.removeAll()
        watchersArray.removeAll()
        createdArray.removeAll()
        var params : Parameters = [
            "client_id" : "9692c7be2e8003941e94",
            "client_secret" : "e4f75716236d2ae4c28d0bdb66035279ee850466",
            "page" : "\(page)"
        ]
        
        let url = "https://api.github.com/users"+"/\(savedata.shared.name!)"+"/repos"
//        print(url)
        let request: DataRequest = Alamofire.request(url, method: .get, parameters: params
            ).responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    self.userCount = json.count
                    for data in 0...json.count{
                        print(json[data]["name"].stringValue)
                        self.dataUrl.append(json[data]["name"].stringValue)
                        self.descArray.append(json[data]["description"].stringValue)
                        self.stargazersArray.append(json[data]["stargazers_count"].intValue)
                        self.watchersArray.append(json[data]["watchers_count"].intValue)
                        self.createdArray.append(json[data]["created_at"].stringValue)
                        
                    }
                    self.tableView.reloadData()
                    
                case .failure(let error):
                    print(error)
                }
                
        }
    
    
    }

}




extension SecondViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userCount
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 159
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableViewCell") as! profileTableViewCell
        if userCount == 0 {return cell}
        if  indexPath.row == userCount - 1 { // last cell
          
            refreshControl.beginRefreshing()
            page += 1
            loadData()
            let indexPath = NSIndexPath(row: NSNotFound, section: 0)
            self.tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: false)

        }
        cell.nameLabel.text = dataUrl[indexPath.row]
        cell.descriptionLabel.text = descArray[indexPath.row]
        cell.stargazersCountLabel.text = "star : \(stargazersArray[indexPath.row])"
        cell.watchersCountLabel.text = "watcher : \(watchersArray[indexPath.row])"
        cell.createdAtLabel.text = createdArray[indexPath.row]

        return cell
    }

    
}
