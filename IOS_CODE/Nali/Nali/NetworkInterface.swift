//
//  NetworkInterface.swift
//  Nali
//
//  Created by Evan Knox on 2016-11-12.
//  Copyright © 2016 parchican. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation
import MapKit
import Foundation

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
            "last_name": usr.lastName,
            "user_name":usr.userName
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
        //This function creates an account/Database record of a person using the first,last names, as well as id
        let parameters: Parameters = [
            "user_name": usr.userName,
            "x":usr.pos.x,
            "y":usr.pos.y
        ]
        
        // All three of these calls are equivalent
        Alamofire.request("https://nali.herokuapp.com/updatePosition", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
    
    func getFriendsPosition(friend:String) ->CLLocation{
        //Given a user, get his friends location and return that back to him
        //This function will update a users current position
        //Pass in a User struct with all fields full
        //This function creates an account/Database record of a person using the first,last names, as well as id
        let parameters: Parameters = [
            "user_name": friend,
        ]
        
        // All three of these calls are equivalent
        Alamofire.request("https://nali.herokuapp.com/requestFriend", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        
        var dummyLocation: CLLocation = CLLocation(latitude: 37.3307498, longitude: -122.03054302)
        
        return dummyLocation
    }
    
    func addFriend(user: User, userNm: String){
        
    }
    
    func contactExists(contact:String)-> Bool{
        //Given a user, get his friends location and return that back to him
        //This function will update a users current position
        //Pass in a User struct with all fields full
        //This function creates an account/Database record of a person using the first,last names, as well as id
        let parameters: Parameters = [
            "user_name": contact,
            ]
        
        // All three of these calls are equivalent
        Alamofire.request("https://nali.herokuapp.com/checkFriendRequest", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        return true
    }
    
    
    
}
