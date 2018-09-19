//
//  ViewController.swift
//  JSE
//
//  Created by Robert Chalmers on 17/07/2018.
//  Copyright © 2018 R.A.Chalmers. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

   let defaults = UserDefaults.standard
    
    @IBAction func onBalance(_ sender: Any) {
        performSegue(withIdentifier: "balanceSegue", sender: self)
    }
    @IBAction func onBalanceID(_ sender: Any) {
         performSegue(withIdentifier: "balanceByIdSegue", sender: self)
    }
    
    @IBAction func onHistory(_ sender: Any) {
          performSegue(withIdentifier: "historySegue", sender: self)
    }
    
    @IBAction func onMining(_ sender: Any) {
          performSegue(withIdentifier: "miningSegue", sender: self)
    }
    
    @IBAction func onLedger(_ sender: Any) {
          performSegue(withIdentifier: "ledgerSegue", sender: self)
    }
    
    @IBAction func onAbout(_ sender: Any) {
          performSegue(withIdentifier: "aboutSegue", sender: self)
    }
    
   
    
    @IBAction func onSetup(_ sender: Any) {
          performSegue(withIdentifier: "showSetup", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //makeGetCall()
        //============
        
        // This removes any set object
        //UserDefaults.standard.removeObject(forKey:"UserID")
        //ok. this is printing the already set UserID...
        print(defaults.integer(forKey: "UserID"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeGetCall() {

        // Set up the URL request
        //let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        
        
        let todoEndpoint: String = "https://api.jsecoin.com/v1.7/balance/auth/0/"
        //let todoEndpoint: String = "https://api.jsecoin.com/v1.7/ledger/auth/"
        //let todoEndpoint: String = "https://api.jsecoin.com/v1.7/balance/checkuserid/xxxxxxxx/auth/"
        let apiKey = "xxxxxxxxxxxx"
        
        
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
        
        
        


/*
        // Set up the URL request
        //let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        
        //let apiKey = "xxxxxxxx
        //let todoEndpoint: String = "https://api.jsecoin.com/v1.7/balance/auth/0/"
        let todoEndpoint: String = "https://api.jsecoin.com/v1.7/balance/auth/robert-chalmers.uk/"
         
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        config.httpAdditionalHeaders = [
           "Content-Type": "application/json",
           "Authorization": "xxxxxxx"
       ]

        //-H \"Content-Type: application/json\" -H \"Authorization: xxxxxxxx\""
        
        guard let url = URL(string: todoEndpoint) + String(config.httpAdditionalHeaders) else {
            print("Error: cannot create URL")
            return
        }
        print(url)
        let urlRequest = URLRequest(url: url)

        request.setValue(signature, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      */

        // Lets learn how to use Git...

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
                let index = todo.index(forKey: "notification")
                print("JSECoin Stored \(todo[index!].key): '\(todo[index!].value)'.")
                let btn_balance = (todo[index!].value)

                print(btn_balance)
                
                for (key,value) in todo
                {
                                        print("\(key) : \(value)")
                    
                }
                
                
                guard let todoTitle = todo["balance"] as? String else {
                    print("Could not get todo title from JSON")
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

}

