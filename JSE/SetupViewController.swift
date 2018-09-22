//
//  SetupViewController.swift
//  JSE
//
//  Created by Robert Chalmers on 21/07/2018.
//  Copyright © 2018 R.A.Chalmers. All rights reserved.
//

import UIKit


class SetupViewController: UIViewController {

  

    @IBOutlet weak var user_id: UITextField!
    @IBOutlet weak var user_api: UITextField!
    
 
    
    @IBAction func showMessage(sender: UIButton) {
       
        defaults.set(Int(user_id.text!), forKey: "UserID")
        defaults.set(String(user_api.text!), forKey: "UserAPI")
        
        print(defaults.integer(forKey: "UserID"))
        print(defaults.integer(forKey: "UserAPI"))

        let setUID = defaults.integer(forKey: "UserID")
        let setAPI = defaults.string(forKey: "UserAPI")
        let alertController = UIAlertController(title: "UserID & API is now set",
                                                message: "UserID set to " + String(setUID) + "\n API: " + String(setAPI!), preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    // Delete the current UID
    @IBAction func deleteButton(sender: UIButton)
    {
        //let defaults = UserDefaults.standardUserDefaults()
        UserDefaults.standard.removeObject(forKey:"UserID")
        UserDefaults.standard.removeObject(forKey:"UserAPI")
        print(defaults.integer(forKey: "UserID"))
        let setUID = defaults.integer(forKey: "UserID")
        let alertController = UIAlertController(title: "UserID is now Deleted",
                                                message: "UserID set to " + String(setUID), preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func ShowUIDButton(sender: UIButton)
    {
        //let defaults = UserDefaults.standardUserDefaults()
        
        print(defaults.integer(forKey: "UserID"))
        let UID = defaults.integer(forKey: "UserID")
        let alertController = UIAlertController(title: "Your Current UserID",
                                                message: "UserID is " + String(UID), preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func warnNoAPI()
    {

        let alertController = UIAlertController(title: "UserAPI Required",
                                                message: "Please set up your API and UID", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User ID Setup"
        // Have we already set the values?
        // defaults.set(true, forKey: "HasAppBeenOpenedBefore")
        // This prints out the uid when I open any window?
        print(defaults.integer(forKey: "UserID"))
        
        defaults.set(true, forKey: "SetupDone")
        print("Setup Done")
        
        /*
         @IBAction func deleteButton(sender: UIButton)
         {
         //let defaults = UserDefaults.standardUserDefaults()
         defaults.setObject("defaultvalue", forKey: "userNameKey")
         
         }
         
         @IBAction func readButton(sender: UIButton)
         {
         let defaults = NSUserDefaults.standardUserDefaults()
         let name = defaults.stringForKey("userNameKey")
         println(name) //Prints defaultvalue in console
         }
 
 
       */
        

        
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDefault(sender: UIButton) {
        let myUserId = 0
        defaults.set(myUserId, forKey: "UserID")
        
        let myAPIKey = "zx23f666"
        defaults.set(myAPIKey, forKey: "APIKey")
        
        
        print(defaults.integer(forKey: "UserID"))
        //print(defaults.string(forKey: "APIKey")!)
        
        //let myIdValue = defaults.integer(forKey: "UserID")
        //self.user_id.text = String(myIdValue)
        print(self.user_id.text!)
        
        UserDefaults.standard.set(true, forKey: "hasSetUserId")
    }
    
    // Store
    //   UserDefaults.standard.set(object/value, forKey: "key_name")
    // Retrieve
    //   var returnValue: [datatype]? = UserDefaults.standard.object(forKey: "key_name") as? [datatype]
    // Remove
    //   UserDefaults.standard.removeObject(forKey:"key_name")

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
// Storing Values of different times
/*
 defaults.set(15, forKey: "weight")
 defaults.set(true, forKey: "isActive")
 defaults.set(25.8, forKey: "distance")
 defaults.set("Sergey", forKey: "firstName")
 defaults.set(NSDate(), forKey: "currentDate")
 
 let friendsNames = ["Bill", "John"]
 defaults.set(friendsNames, forKey: "friendsNames")
 
 // Reading from NSUserDefaults.
 let weightValue = defaults.integer(forKey: "weight")
 print("weight value = \(weightValue)")
 
 let isUserActive = defaults.bool(forKey: "isActive")
 print("isUserActive value = \(isUserActive)")
 
 let distanceValue = defaults.double(forKey: "distance")
 print("distance value = \(distanceValue)")
 
 let firstNameValue = defaults.object(forKey: "firstName") as! String
 print("First Name value = \(firstNameValue)")
 
 
 let currentDateValue = defaults.object(forKey: "currentDate") as! NSDate
 print("Current date value = \(currentDateValue)")
 
 
 let friendsNamesArray = defaults.object(forKey: "friendsNames") as? [String] ?? [String]()
 print("Friends names Array count \(friendsNamesArray.count)")
 print("First element in array \(friendsNamesArray[0])")
 */

