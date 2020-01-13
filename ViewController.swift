//
//  ViewController.swift
//  ViewTab
//
//  Created by Aleksandr Stepanenko on 2020-01-13.
//  Copyright © 2020 dev. All rights reserved.
//

import UIKit

struct Course : Codable{
    
    let id: Int
    let courseCode:String
    let courseName: String
    
    
}

struct PackageCourses: Codable {
    let student: String
    let timestamp : Date
    let count : Int
    let version : String
    let data : [Course]
    
}
class ViewController: UIViewController{
   
 
    var myPackage : PackageCourses?
    
    
    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        func doRequest(url: URL) -> PackageCourses? {
            
            // A do-catch statement handles errors
            // For the following, if there is an error, "catch" returns nil
            do {
                
                // Attempt to get the data from the web API
                let data = try Data(contentsOf: url)
                
                // Create and configure a JSON decoder
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                // Attempt to decode the data into a "PackageCourses" object
                let result = try decoder.decode(PackageCourses.self, from: data)
                
                // If it gets this far, it has been successful
                return result
            }
            catch {
                // Uh oh, error
                print("Request error: \(error.localizedDescription)")
                return nil
            }
        }
        
    }


}

