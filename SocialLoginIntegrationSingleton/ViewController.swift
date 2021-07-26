//
//  ViewController.swift
//  SocialLoginIntegrationSingleton
//
//  Created by john on 26/07/21.
//

import UIKit

class ViewController: UIViewController {
     
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
    }


    @IBAction func fb(_ sender: UIButton) {
        FacebookSignInHelper.shared.facebookSignIn(with: self) { fbData in
            
        }
    }
    @IBAction func google(_ sender: UIButton) {
        GoogleSignInHelper.shared.googleSignIn(with: self) { gdata in
            
        }
    }
    @IBAction func appleLogin(_ sender: UIButton) {
        AppleLoginHelper.shared.AppleSignIn(with: self) { appleData in
            
        }
    }
    
}

