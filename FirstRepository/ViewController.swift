//
//  ViewController.swift
//  FirstRepository
//
//  Created by Harsha Vardhan Pabbineedi on 17/11/19.
//  Copyright © 2019 Harsha Vardhan Pabbineedi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet var contacts_tableView : UITableView!
    let listObject = ContactsList.init()
    var fetchedData:[Contact]!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.fetchedData = listObject.fetch()
        self.contacts_tableView.dataSource = self
        self.contacts_tableView.delegate = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return fetchedData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        
        cell.firstNameLbl.text = fetchedData[indexPath.row].firstName
        cell.lastNameLbl.text = fetchedData[indexPath.row].lastName

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        
//        print(item0_fullname)
        
    }
    
    
    
    
    
    
    
}


