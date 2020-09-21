//
//  ResultViewController.swift
//  NIBM_COVID19
//
//  Created by Digital-03 on 9/17/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var StatusView: UIImageView!
    
    @IBOutlet weak var Status: UILabel!
    
    private var _selectedDatedDate: String!
    
    var selectedDatedData : String{
        
        get{
            return  _selectedDatedDate
        }
        set{
            _selectedDatedDate = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Status.text = _selectedDatedDate
        
        if _selectedDatedDate == "Good"
        {
            StatusView.image = UIImage( named: "status1")
        }
        
        else if _selectedDatedDate == "Medium"
        {
            StatusView.image = UIImage( named: "status2")
        }
        
        else if _selectedDatedDate == "Bad"
        {
            StatusView.image = UIImage( named: "status3")
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
