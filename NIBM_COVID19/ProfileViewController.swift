//
//  ProfileViewController.swift
//  NIBM_COVID19
//
//  Created by Digital-01 on 9/18/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var Profileimage: UIImageView!
    @IBOutlet weak var Firstname: UILabel!
    @IBOutlet weak var Lastname: UILabel!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var Role: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        let UId = Auth.auth().currentUser?.uid
        ref.child("users").child(UId!).observeSingleEvent(of: .value, with:{(snapshot) in
            
            if let user = snapshot.value as? [String : String] {
                print(user)
                self.Firstname.text = user["username"]!
                self.Lastname.text = user["lastname"]
                self.Email.text = user["email"]
                self.Role.text = user["role"]
            }
        }){ (error) in
            print(error.localizedDescription)
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Logout(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popViewController(animated: true)
        }
        catch let  SignOutError as NSError {
            print("Error: %@", SignOutError)
        }

        
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
