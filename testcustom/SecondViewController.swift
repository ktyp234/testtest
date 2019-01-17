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

class SecondViewController: UIViewController {

    lazy var repoList: [RepoElement] = {
        var list = [RepoElement]()
        return list
    }()
    var isLoading = false
    let refreshControl = UIRefreshControl()
    var userCount = 0
    let tableView = UITableView()
    
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
        loadData()
    }
    func loadData(){
        
        var params : Parameters = [
            "client_id" : "9692c7be2e8003941e94",
            "client_secret" : "e4f75716236d2ae4c28d0bdb66035279ee850466",
            "page" : "1"
        ]
        
        let url = "https://api.github.com/users"+"/\(savedata.shared.name!)"+"/repos"
        print(url)
        
        Alamofire.request(url, method: .get, parameters: params
            ).responseData { response in
                
                debugPrint(response)
                
                if let jsonData = response.result.value {
                    let result = try? JSONDecoder().decode(Repo.self, from: jsonData)
                    self.repoList = result!
                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing()
                }
                
        }
        isLoading = false
    }

}




extension SecondViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableViewCell") as! profileTableViewCell
        if repoList.count == 0 {return cell}
        if !isLoading && indexPath.row == repoList.count - 1 { // last cell
            userCount += indexPath.row
            isLoading = true
            refreshControl.beginRefreshing()
            
            loadData()
        }
        cell.nameLabel.text = repoList[indexPath.row].name
  
        return cell
    }

    
}
