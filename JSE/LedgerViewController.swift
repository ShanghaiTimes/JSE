//
//  LedgerViewController.swift
//  JSE
//
//  Created by Robert Chalmers on 18/07/2018.
//  Copyright © 2018 R.A.Chalmers. All rights reserved.
//

import UIKit

/*
 curl -v -X GET https://api.jsecoin.com/v1.7/ledger/auth/:uidASC/ \
 -H "Content-Type: application/json" \
 -H "Authorization: xxxxxxx"
 
 */

class LedgerViewController: UIViewController {

        var myLedger   :String = ""
        var btn_ledger :String = ""
    
    
    @IBOutlet weak var tableView: UITableView!
    
   @IBOutlet weak var displayLedger: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        for i in 0...1000 {
            data.append("\(i)")
        }
        
 
    }
    private var data: [String] = []
   
        //makeGetCall()
        }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }



    func makeGetCall() {
        // Set up the URL request
        let todoEndpoint: String = "https://api.jsecoin.com/v1.7/ledger/auth/100/1/uidASC/"
        let apiKey = "xxxxxxxx"
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        // set up the URL Auth
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue(apiKey, forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            print("Got data")
            // parse the result as JSON, since that's what the API provides
            do {
                guard let todo = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [String: Any] else {
                        print("error trying to convert data to JSON")
                        return
                }
                // now we have the todo
                // let's just print it to prove we can access it
                //print("The todo is: " + todo.description)
                // the todo object is a dictionary
                // so we just access the title using the "title" key
                // so check for a title and print it if we have one
                let index1 = todo.index(forKey: "ledger")
        print("Stored Key: \(todo[index1!].key)")
        let btn_ledger = (todo[index1!].value)
                DispatchQueue.main.async {
                    
                    print("Ledger String: \(todo[index1!].value)")
                    if let ledgerString = todo[index1!].value as? String {
                       // self.displayLedger.text = ledgerString
                    } else {
                        // Ooops
                      //self.displayLedger.text = "?? unknown ??"
                    }
                }
                print("myLedger I: \(btn_ledger)")
                //self.displayLedger.text = (btn_ledger)
                //Could not cast value of type '__NSDictionaryI' (0x10ae73508) to 'NSString' (0x109fe42a8).
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            
        }
        task.resume()
    }


