//
//  UserFolowersViewController.swift
//  gitHubUsersListTest
//
//  Created by Сергій Костюк on 8/9/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import UIKit

class UserFollowersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var user: UserModel!
    var userFollowers = [UserModel]()

    fileprivate var apiManager = ApiManager.shared
    @IBOutlet weak var userFollowersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userFollowersTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")

        apiManager.delegate = self
        apiManager.getGitHubUsers(urlString: user.folowersUrl)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userFollowers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        
        cell.fillCellWith(model: userFollowers[indexPath.item])
        return cell
    }
}

extension UserFollowersViewController: ApiManagerDelegate {
    func getUserModels(array: [UserModel]!) {
        userFollowers = array
        
        userFollowersTableView.reloadData()
    }
    
}
