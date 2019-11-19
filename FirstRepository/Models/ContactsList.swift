//
//  ContactsList.swift
//  GJContactsDemo
//
//  Created by pvharsha on 8/11/19.
//  Copyright © 2019 SPH. All rights reserved.
//

import Foundation

enum ContactServiceEvent:String {
    case ListFetch
    case ContactDetailsFetch
    case ContactCreate
    case ContactUpdate
    case ContactDelete
}

public struct ContactListSection {
    
    let sectionTitle: String
    let contacts: [Contact]
}

class ContactsList {
    
    lazy var serviceManager = ServiceManager.sharedInstance
    
    func fetch() -> [Contact] {
        
        return self.serviceManager.getContactsList() ?? []
    }
}
