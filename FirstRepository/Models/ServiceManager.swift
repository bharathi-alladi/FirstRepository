//
//  ServiceManager.swift
//  GJContactsDemo
//
//  Created by pvharsha on 2/11/19.
//  Copyright © 2019 SPH. All rights reserved.
//
import Foundation

enum HTTPRequestType:String {
    case GET
    case POST
    case PUT
    case DELETE
}

class ServiceManager
{
    
    static var sharedInstance = ServiceManager()
    private init() {
    }
    //MARK: - Core functions to handle webservices
    public func getContactsList() -> [Contact]? {
        
        let mainBundle = Bundle.main
        let dataFile = mainBundle.path(forResource: "dataFile", ofType: "txt")
        do {
            let data = try Data.init(contentsOf: URL.init(fileURLWithPath: dataFile!))
            let decoder = JSONDecoder.init()
            let transformedData =  try decoder.decode([Contact].self, from: data)
            return transformedData
        } catch {
            return nil
        }
    }
}
