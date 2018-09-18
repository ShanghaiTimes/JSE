//
//  GetBalanceViewController.swift
//  JSE
//
//  Created by Robert Chalmers on 18/07/2018.
//  Copyright © 2018 R.A.Chalmers. All rights reserved.
//

import UIKit


class GetBalanceViewController: UIViewController {

   var myBalance :String = ""
   var btn_balance :String = ""
    
    @IBOutlet weak var displayBalance: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGetCall()
     
    }



    //func makeGetCall(myBalance: String) -> String  {
    func makeGetCall() {
        // Set up the URL request
        
        let defaults = UserDefaults.standard
        print(defaults.integer(forKey: "UserID"))
        let UID = defaults.integer(forKey: "UserID")
        
       //let todoEndpoint: String = "https://api.jsecoin.com/v1.7/balance/auth/0/"
        //let todoEndpoint: String = "https://api.jsecoin.com/v1.7/ledger/auth/"
        let todoEndpoint: String = "https://api.jsecoin.com/v1.7/checkuserid/"+String(UID)+"/auth/"
        let apiKey = "xxxxxxxxxx"
        
        
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
                print("The todo is: " + todo.description)
                
                
                // the todo object is a dictionary
                // so we just access the title using the "title" key
                // so check for a title and print it if we have one
                let index1 = todo.index(forKey: "balance")
                let index2 = todo.index(forKey: "publicKey")
                let index3 = todo.index(forKey: "uid")
                print("JSECoin Stored Key/Value: \(todo[index1!].key): '\(todo[index1!].value)'.")
                let btn_balance = (todo[index1!].value)
                print("btn_balance: \(btn_balance)")
                
                let myPublicKey = (todo[index2!].value)
                print("myPublickKey: \(myPublicKey)")
                
                let myID = (todo[index3!].value)
                print("myID: \(myID)")
                
                // as? String
                DispatchQueue.main.async {
                    if let balanceString = todo[index1!].value as? Double {
                        self.btn_balance = String(balanceString)
                        self.displayBalance.text = "Your balance is "+String(balanceString)+" JSE"
                      //  self.displayPublicKey.text = String(describing:myPublicKey)
                     //   self.displayMyID.text = String(describing:myID)
                    } else {
                        // Ooops
                      self.displayBalance.text = "?? unknown ??"
                       
                    }
                }
                
                let myBalance = btn_balance
                print("myBalance I: \(myBalance)")
                print("btn_balance I: \(btn_balance)")
                
                
                for (key,value) in todo
                {
                    print("\(key) : \(value)")
                    
                }
                
                /*
                 guard let todoTitle = todo["balance"] as? String
                 else {
                 //  print("Could not get todo title from JSON")
                 return
                 }
                 */
                //print("The title is: " + todoTitle)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            
        }
        task.resume()
    }
                
                
                /*
                print("The todo is: " + todo.description)
                

                // the todo object is a dictionary
                // so we just access the title using the "title" key
                // so check for a title and print it if we have one
                let index = todo.index(forKey: "notification")
                              //  let index = todo.index(forKey: "balance")
                //print("JSECoin Stored \(todo[index!].key): '\  (todo[index!].value)'.")
                let btn_balance = (todo[index!].value)
                
                DispatchQueue.main.async {
                    if let balanceString = todo[index!].value as? String {
                        self.btn_balance = balanceString
                        self.displayBalance.text = balanceString
                    } else {
                        // Ooops
                        self.displayBalance.text = "?? unknown ??"
                    }
                }
               
                let myBalance = btn_balance
                print("myBalance I: \(myBalance)")
                print("btn_balance I: \(btn_balance)")

             
                for (key,value) in todo
                {
                    print("\(key) : \(value)")
                    
                }
              
            /*
                guard let todoTitle = todo["balance"] as? String
                    else {
                  //  print("Could not get todo title from JSON")
                    return
                    }
             */
               //print("The title is: " + todoTitle)
                } catch  {
                print("error trying to convert data to JSON")
                return
            }
 
        }
       task.resume()
    }
 */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
