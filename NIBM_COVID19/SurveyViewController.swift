//
//  SurveyViewController.swift
//  NIBM_COVID19
//
//  Created by Digital-03 on 9/16/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
showImage()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var SurveyImages: UIImageView!
    
    @IBOutlet weak var QuizLbl: UILabel!
    
    
    
    @IBOutlet weak var btnAnswer1: UIButton!
    
    
    @IBOutlet weak var btnAnswer2: UIButton!
    
    
    let quAndAns = [
        ["Are you having fever, cough, sore throat or headache?","No"],
        ["Have you been exposed with crowded places?","No"],
        ["Have you been interact with sick person?","No"],
        ["Have you been tarvel last 14 days?","No"]
    ]
    
    var queNo=0
    var total=0
 
    @IBAction func getuserData(_ sender: UIButton) {
        
        let usrAnswer = sender.currentTitle
         let newAnswer = quAndAns[queNo][1]
        
        if newAnswer == usrAnswer {
            print("Write")
            total += 1
            print(total)
        }
        else{
            print("Wrong")
        }
        
        if queNo + 1 < quAndAns.count{
            queNo += 1
        }
        showImage()
    }
    
    func showImage(){
        SurveyImages.image = UIImage(named: "icon\(queNo).png")
        QuizLbl.text = quAndAns[queNo][0]
    }
    
    @IBAction func statusButton(_ sender: UIButton) {
        
        var status="Good"
        if total > 2 {
            status="Good"
        }
        if total == 2{
            status="Medium"
        }
        if total < 2{
            status="Bad"
        }
        self.performSegue(withIdentifier: "userDataSeg", sender: status)
    }
    
   /* override func  prepare(for segue:UIStoryboardSegue, sender:Any?) {
        if let dest = segue.destination as? ResultViewController{
            if let uData = sender as? String {
                dest.selectedDatedDate = uData
            }
        }
    }
     //this data

    */
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if let dest = segue.destination as? ResultViewController{
        if let uData =  sender as? String{
            dest.selectedDatedData = uData
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
