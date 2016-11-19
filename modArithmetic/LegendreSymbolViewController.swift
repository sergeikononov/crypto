//
//  LegendreSymbolViewController.swift
//  modArithmetic
//
//  Created by Сергей on 10.11.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

import UIKit

class LegendreSymbolViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LegendreSymbolViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        initializeTextFields()
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var numerator: UITextField!
    @IBOutlet weak var denomirator: UITextField!
    @IBOutlet weak var result: UILabel!
    
    func initializeTextFields() {
        numerator.keyboardType = UIKeyboardType.numberPad
        denomirator.keyboardType = UIKeyboardType.numberPad
        
    }
    func calculate(a: Int, p:Int) -> Int {
        if ((a>=p) || (a<0)) {
           return calculate(a: a%p, p: p)
        }
        else if ((a==0) || (a==1)){
            return a
        }
        else if (a==2){
            if ((p%8==1) || (p%8==7)){
                return 1
            }
            else {
                return -1
            }
        }
        else if (a==p-1){
            if (p%4==1){
                return 1
            }
            else{
                return -1
            }
        }
        else if ((((p-1)/2)%2==0) || (((a-1)/2)%2==0)){
            return calculate(a: p, p: a)
            
        }
        else{
            return (-1)*calculate(a: p, p: a)
        }
    }
    
    @IBAction func getResult(_ sender: UIButton) {
        let a = Int(numerator.text!)!
        let p = Int(denomirator.text!)!
        result.text = String(calculate(a: a, p: p))
        
        
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
