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
    @IBOutlet var activityIndicator : UIActivityIndicatorView!
    let listObject = ContactsList.init()
    var fetchedData:[Contact]!
    var completionHandler : ((Data?,URLResponse?,Error?) -> Void )?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.fetchedData = listObject.fetch()
        self.contacts_tableView.dataSource = self
        self.contacts_tableView.delegate = self
        
        self.completionHandler = {
            (data : Data?, urlresponse : URLResponse?, error : Error? ) -> Void in
            
            print(data)
            print(urlresponse)
            print(error?.localizedDescription)
            
            DispatchQueue.main.async(execute: {() -> Void in
                self.activityIndicator.stopAnimating()
            })
    }
        self.activityIndicator.startAnimating()
        self.getContactList()
        
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
    
    func getContactList (){
        
        let url = URL.init(string: "http://gojek-contacts-app.herokuapp.com/contacts.json")
        let urlRequest = URLRequest.init(url: url!)
        let defaultConfiq = URLSessionConfiguration.default
        let urlSession = URLSession.init(configuration: defaultConfiq)
        
        
        let dataTask = urlSession.dataTask(with: urlRequest, completionHandler: self.completionHandler!)
        dataTask.resume()
        
        
    }
    
        
    
}



