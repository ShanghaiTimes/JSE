//
//  MiningViewController.swift
//  JSE
//
//  Created by Robert Chalmers on 18/07/2018.
//  Copyright © 2018 R.A.Chalmers. All rights reserved.
//

import UIKit

class MyData : NSObject {
    var title: String?
    var block: Int?
    var command: String?
    var siteid: String?
    var ts: Int?
    var user1: Int?
    var value: Int?
    
    override init() {
        super.init()
    }
}

class MiningViewController: UITableViewController {
/*
     curl -v -X GET https://api.jsecoin.com/v1.7/mining/auth/ \
     -H "Content-Type: application/json" \
     -H "Authorization: xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
 */
    
    
    @IBOutlet weak var displayMining: UITextField!
       
    var siteID :String = ""
    var forKey :String = ""
    var index :String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGetCall()
        
    }
    
    
    
    //func makeGetCall(myBalance: String) -> String  {
    func makeGetCall() {
        // Set up the URL request
        //let todoEndpoint: String = "https://api.jsecoin.com/v1.7/balance/auth/0/"
        //let todoEndpoint: String = "https://api.jsecoin.com/v1.7/ledger/auth/"
        //let todoEndpoint: String = "https://api.jsecoin.com/v1.7/checkuserid/xxxxxxxx/auth/"
        let todoEndpoint: String = "https://api.jsecoin.com/v1.7/mining/auth/"
        
        let apiKey = "xxxxxxxxx"
        
        
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
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
            print("Got data: \(responseData)")
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
            
               // let dict = todo.description
               // print("The dict is: " + dict)
                
               // let keys = Array(todo.keys)
               // print(keys)

                if let alb = todo["mining"] {
                    print(alb)
                }
                if let alb = todo["mining"] as? [String:Any] {
                    for (key, value) in alb {
                        print(key, value)
                    }
                }
                
                if let alb = todo["mining"] as? [String:Any] {
                    for (key, mining) in alb {
                        print(key)
                        if let item = mining as? [String:Any] {
                            for (key, value) in item {
                                print(key, value)
                            }
                        }
                    }
                }
                print("===================")
                let index1 = todo.index(forKey: "mining")
                let myMining = (todo[index1!].value)
                print("Mining: \(myMining)")
              
                if let mining = todo["mining"] as? [String: Any] {
                    let miningKeys = Array(mining.keys)
                    // It will be like [1532825277682891390, 1532826406100318457]
                    print("\(miningKeys)")
                    print("\(String(describing: mining[miningKeys.first!]))")
                }
            
                //============

                print("===================")
            // the todo object is a dictionary
                // so we just access the title using the "title" key
                // so check for a title and print it if we have one
               // let index0 = todo.index(forKey: "title")

                //let index1 = todo.index(forKey: "command")
                //let index2 = todo.index(forKey: "siteid")
                //let index3 = todo.index(forKey: "ts")
               // let index4 = todo.index(forKey: "user1")
            /*
                //print("JSECoin Stored Key/Value: \(todo[index1!].key): '\(todo[index1!].value)'.")
                
                //let btn_ts = (todo[index3!].value)
                //print("btn_ts: \(btn_ts)")
                
                let mySiteID = (todo[index2!].value)
                print("mySiteID: \(mySiteID)")
                
                let myUser = (todo[index4!].value)
                print("myUser: \(myUser)")
                 */
                 DispatchQueue.main.async {
                  /*  if let displayMining = todo[index4!].value as? String {
                        
                       self.displayMining.text = String(displayMining)
                        
                    } else {
                        // Ooops
                        self.displayMining.text = "?? unknown ??"
                    }
                    */
                }
            
                
                
                // the todo object is a dictionary
                // so we just access the title using the "title" key
                // so check for a title and print it if we have one
                guard let todoTitle = todo["mining"] as? String
                    else {
                        //print("Could not get title from JSON")
                        return
                        }
                print("The title is: " + todoTitle)
              
               
               
            } catch  {
                print("error trying to convert data to JSON")
                return
            }

               

            
        }
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
