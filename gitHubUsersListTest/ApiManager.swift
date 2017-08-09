//
//  ApiManager.swift
//  gitHubUsersListTest
//
//  Created by Сергій Костюк on 8/8/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import Foundation

protocol ApiManagerDelegate: class {
    func getUserModels(array: [UserModel]!)
}

class ApiManager: NSObject {
//    var users: [UserModel]!
    weak var delegate: ApiManagerDelegate?
    
    override init() {
//        users = [UserModel]()
        
        super.init()
    }
    
     func getGitHubUsers(urlString: String) {
        let url = URL.init(string: urlString)
        
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            DispatchQueue.main.async(execute: {
                self.fillWith(usersData: data!)
            })
        }
        task.resume()
    }
    
     func fillWith(usersData: Data) {
        do {
            let json = try JSONSerialization.jsonObject(with: usersData, options: .mutableContainers) as! NSArray
            print(json)
            
             var users = [UserModel]()
            
            for item in json {
                let user = UserModel.init(withDictionary: item as! [String : Any])
                users.append(user)
            }
            
            self.delegate?.getUserModels(array: users)
            
        } catch {
            print("Could not serialise")
        }
    }
}
