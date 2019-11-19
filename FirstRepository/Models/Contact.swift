//
//  Contact.swift
//  GJContactsDemo
//
//  Created by pvharsha on 2/11/19.
//  Copyright © 2019 SPH. All rights reserved.
//

//MARK: -
class Contact: Codable, Equatable {
    
    //MARK:- Variables
    var id: Int?
    var firstName: String!
    var lastName: String!
    var profilePicUrl: String!
    var isFavorite: Bool!
    var detailsUrl: String!
    
    var phoneNumber: String?
    var email: String?
    var createDate: String?
    var lastUpdateDate: String?
    
    
    var isContactModifiedLocally: Bool?
    lazy var serviceManager = ServiceManager.sharedInstance
    
    var fullName: String {
        
        if firstName != "" && lastName != "" {
            
            return firstName + " " + lastName
        }
        return firstName + lastName
    }
    
    private init() {
        
    }
    
    convenience init(_ id: Int?, firstName:String, lastName:String, profilePicUrl:String, isFavorite:Bool, detailsUrl:String) {
        
        self.init()
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.profilePicUrl = profilePicUrl
        self.detailsUrl = detailsUrl
        self.isFavorite =  isFavorite
    }
    
    
    
    //MARK:- Codable and Equatable confirmations
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case profilePicUrl = "profile_pic"
        case isFavorite = "favorite"
        case detailsUrl = "url"
        case phoneNumber = "phone_number"
        case email = "email"
        case createDate = "created_at"
        case lastUpdateDate = "updated_at"
    }
    
    public static func == (lhs: Contact, rhs: Contact) -> Bool {
        
        if (lhs.id == rhs.id) &&
            (lhs.firstName == rhs.firstName) &&
            (lhs.lastName == rhs.lastName) &&
            (lhs.profilePicUrl == rhs.profilePicUrl) &&
            (lhs.isFavorite == rhs.isFavorite) &&
            (lhs.detailsUrl == rhs.detailsUrl) &&
            (lhs.phoneNumber == rhs.phoneNumber) &&
            (lhs.email == rhs.email) &&
            (lhs.createDate == rhs.createDate) &&
            (lhs.lastUpdateDate == rhs.lastUpdateDate)
        {
            return true
        }
        return false
    }
    
    public static func != (lhs: Contact, rhs: Contact) -> Bool {
        if  (lhs.id != rhs.id) ||
            (lhs.firstName != rhs.firstName) ||
            (lhs.lastName != rhs.lastName) ||
            (lhs.profilePicUrl != rhs.profilePicUrl) ||
            (lhs.isFavorite != rhs.isFavorite) ||
            (lhs.detailsUrl != rhs.detailsUrl) ||
            (lhs.phoneNumber != rhs.phoneNumber) ||
            (lhs.email != rhs.email) ||
            (lhs.createDate != rhs.createDate) ||
            (lhs.lastUpdateDate != rhs.lastUpdateDate)
        {
            return true
        }
        return false
    }
    
    //MARK: - webservice functions
}
