//
//  ViewController.swift
//  gitHubUsersListTest
//
//  Created by Serhii Kostiuk on 8/8/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    fileprivate var apiManager = ApiManager.shared
    var users = [UserModel]()

    @IBOutlet weak var usersTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")

        apiManager.delegate = self
        apiManager.getGitHubUsers(urlString: "https://api.github.com/users?page=1&per_page=120")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        cell.fillCellWith(model: users[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = users[indexPath.item]
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let userFollowersVC = mainStoryboard.instantiateViewController(withIdentifier: "UserFollowersViewController") as! UserFollowersViewController
        userFollowersVC.user = model
        navigationController?.show(userFollowersVC, sender: nil)
        
    }
}

extension ViewController: ApiManagerDelegate {
    func getUserModels(array: [UserModel]!) {
        print(array)
        
        users.append(contentsOf: array)
        usersTableView.reloadData()
    }
}



