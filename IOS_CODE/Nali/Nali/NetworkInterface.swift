//
//  NetworkInterface.swift
//  Nali
//
//  Created by Evan Knox on 2016-11-12.
//  Copyright © 2016 parchican. All rights reserved.
//

import Foundation
import Alamofire

struct Position{
    var x = Float()
    var y = Float()
}

struct User {
    var id = Int()
    var firstName = String()
    var lastName = String()
    var pos = Position()
    var userName = String()
}

class NetworkClient{
    
    func createUser(usr: User){
        
        //This function creates an account/Database record of a person using the first,last names, as well as id
        let parameters: Parameters = [
            "first_name": usr.firstName,
            "last_name": usr.lastName
        ]
        
        // All three of these calls are equivalent
        Alamofire.request("https://nali.herokuapp.com/addUser", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
    
    func updatePosition(usr: User){
        //This function will update a users current position
        //Pass in a User struct with all fields full
        
    }
    
    func getFriendsPosition(user:User,friend:User){
        //Given a user, get his friends location and return that back to him
    }
    
    func addFriend(user: User, userNm: String){
        
    }
    
    func contactExists(contact:String)-> Bool{
        return false
    }
    
    
    
}
