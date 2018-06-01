//
//  VCLoginFB.swift
//  ExameniOS
//
//  Created by Américo Cantillo on 29/05/18.
//  Copyright © 2018 Américo Cantillo Gutiérrez. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class VCLoginFB: UIViewController {
    
    @IBOutlet weak var vFrame: UIView!
    
    @IBOutlet weak var lblResultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let _ = Global.keychain.value(forKey: Global.KEY_UID) {
            self.performSegue(withIdentifier: Global.segue.toMain, sender: nil)
        }
        
    }

    func keychainSave(uid: String) {
        Global.keychain.setValue(uid, forKeyPath: Global.KEY_UID)
    }

    
    @IBAction func btnFBLoginOnTouchUpInside(_ sender: UIButton) {
    
        let fbLogin = FBSDKLoginManager()
        
        
        fbLogin.logIn(withReadPermissions: ["email"], from: self, handler: {
            (result, error) in
            if error != nil {
                let msg_error: String = error.debugDescription
                print("Unable to authenticate with Facebook account. \(msg_error)")
                
                self.lblResultado.text = "No fue posible autenticar: \(msg_error)"
            } else if (result?.isCancelled)! {
                print("User cancelled Facebook authentication.")
                self.lblResultado.text = "Autenticación cancellada."
            } else {
                print("Facebook account authentication successfully!.")

                self.lblResultado.text = "Autenticación con Facebook Exitosa."

                let token: String! = FBSDKAccessToken.current().tokenString
                
                print("User Id: \(FBSDKAccessToken.current().userID!)")
                print("Description: \(FBSDKAccessToken.current().description)")
                print("Exp Date: \(FBSDKAccessToken.current().expirationDate)")
                print("Permissions: \(FBSDKAccessToken.current().permissions)")
                print("Token: \(token!)")
                
                self.keychainSave(uid: FBSDKAccessToken.current().userID!)
                self.performSegue(withIdentifier: Global.segue.toMain, sender: nil)

            }
        })
        

    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
