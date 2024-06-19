//
//  LoginVC.swift
//  createRead
//
//  Created by Macbook on 02/03/22.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var surnameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }



    @IBAction func goTapped(_ sender: Any) {

        if !nameTF.text!.isEmpty && !surnameTF.text!.isEmpty {
            
        let vc = MainVC.init(nibName: "MainVC", bundle: nil)
        UserDefaults.standard.set(nameTF.text!, forKey: "name")
        UserDefaults.standard.set(surnameTF.text!, forKey: "surname")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        }
    }
    
}
