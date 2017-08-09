//
//  ApiManager.swift
//  gitHubUsersListTest
//
//  Created by Сергій Костюк on 8/8/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import Foundation

protocol ApiManagerDelegate {
    func getUserModels(array: [UserModel]!)
}

struct ApiManager {
    var delegate: ApiManagerDelegate?
  
    static let shared = ApiManager()
    
     func getGitHubUsers(urlString: String) {
        let url = URL.init(string: urlString)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            DispatchQueue.main.async(execute: {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSArray
                    print(json)
                    
                    var users = [UserModel]()
                    
                    for item in json {
                        let user = UserModel.init(withDictionary: item as! [String : Any])
                        
                        
                        if user.userId == 135 && urlString.contains("followers") == false {
                            self.getGitHubUsers(urlString: "https://api.github.com/users?since=135")
                        }
                        users.append(user)
                    }
                    
                    self.delegate?.getUserModels(array: users)
                    
                } catch {
                    print("Could not serialise")
                }
            })
        }
        task.resume()
    }
    
     func fillWith(usersData: Data) {
       
    }
}
