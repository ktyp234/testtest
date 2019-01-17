//
//  ViewController.swift
//  testcustom
//
//  Created by 김지훈 on 18/01/2019.
//  Copyright © 2019 KimJihun. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController {
    let secondVC = SecondViewController()
    lazy var userList: [UserlistElement] = {
        var list = [UserlistElement]()
        return list
    }()
    var isLoading = false
    let refreshControl = UIRefreshControl()
    var userCount = 0
    let tableView = UITableView()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        let resNib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(resNib, forCellReuseIdentifier: "CustomCell")
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
        userCount += userList.count
        loadData()
    }
    func loadData(){
        
        var params : Parameters = [
            "since" : "\(userCount)",
            "client_id" : "9692c7be2e8003941e94",
            "client_secret" : "e4f75716236d2ae4c28d0bdb66035279ee850466"
        ]
   
        let url = "https://api.github.com/users"
        print(url)
        
        Alamofire.request(url, method: .get, parameters: params
            ).responseData { response in
                
                debugPrint(response)
                
                if let jsonData = response.result.value {
                    let result = try? JSONDecoder().decode(Userlist.self, from: jsonData)
                    self.userList = result!
                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing()
                }
        
        }
        isLoading = false
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        if userList.count == 0 {return cell}
        if !isLoading && indexPath.row == userList.count - 1 { // last cell
            userCount += indexPath.row
            isLoading = true
            refreshControl.beginRefreshing()

            loadData()
        }
        cell.userId.text = "\(userList[indexPath.row].id)"
        cell.userName.text = userList[indexPath.row].login
        cell.userImage.sd_setImage(with: URL(string: userList[indexPath.row].avatarURL), placeholderImage: UIImage(named: "6"))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = (tableView.cellForRow(at: indexPath) as! CustomCell).userName
        savedata.shared.name = name?.text
        present(secondVC, animated: true, completion: nil)
    }
 
}
