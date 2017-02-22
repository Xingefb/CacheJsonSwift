//
//  ViewController.swift
//  CacheJsonSwift
//
//  Created by Dzy on 22/02/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

import UIKit
import AltHaneke
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cache = Shared.dataCache
        
        cache.fetch(key: "data").onSuccess { (data) in

            let json = JSON.convertFromData(data)
            let dic = NSDictionary.init(dictionary: (json?.dictionary)!)
            let dict = dic["meta"]
            let model = TestModel(dict: dict as! [String : NSObject])
            print(model.name)

            if let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
            
        }
        
        cache.fetch(key: "data").onFailure { (error) in
            Alamofire.request("https://api.instagram.com/v1/tags/malaysia/media/recent?client_id=XXXXXXXXXXXXXXXXXXXXXXXXX").response { (response) in
                
                let data = response.data
                let json = JSON.convertFromData(data!)
                let dic = NSDictionary.init(dictionary: (json?.dictionary)!)
                print(dic)
                cache.set(value: response.data!, key: "data")
                
            }
        }

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

