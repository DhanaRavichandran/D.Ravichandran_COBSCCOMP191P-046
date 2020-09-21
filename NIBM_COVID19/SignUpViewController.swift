//
//  SignUpViewController.swift
//  NIBM_COVID19
//
//  Created by Digital-01 on 9/18/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Firstname: UITextField!
    
    @IBOutlet weak var Lastname: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Role: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    var ref:DatabaseReference!
    @IBAction func Signup(_ sender: UIButton) {
        
        if let email = Email.text, let password = Password.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let e = error {
                    print(e)
                }
                else{
                    //                    self.performSegue(withIdentifier: "SignupSegway", sender: self)
                    //print("Success")
                    
                    let userId=authResult?.user.uid
                    let fName=self.Firstname.text
                    let lName=self.Lastname.text
                    let emailId=self.Email.text
                    let uRole=self.Role.text
                    
                    self.ref = Database.database().reference()
                    
                    self.ref.child("users").child(userId ?? "").setValue(["username":fName,"lastname":lName,"email":emailId,"role":uRole])
                    
                    //self.performSegue(withIdentifier:"SignupSegway", sender:self)
                    print("Success")
                }// ...
    }
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

