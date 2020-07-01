//
//  ViewController.swift
//  IntercomTesting
//
//  Created by Yogeswaran Siva on 7/1/20.
//  Copyright © 2020 Yogeswaran Siva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userRegister: UIButton!
    @IBOutlet weak var OpenChatBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        registerUser()
    }
    
    func setUI() {
        setRoundedCorner(userRegister)
        setRoundedCorner(OpenChatBtn)
        setRoundedCorner(logoutBtn)
    }
    
    func registerUser() {
        let user = User(name: "Cisely",
                        email: "Cisely@yopmail.com", intercomIdentityVerification: "a760875b6cca72920ba712e7527ee7c1a8c3d8346586ded3967e663e0d04d418", identityToken: "2bfe65588dfb40f198f598afb3776e22")
        ChatBot.register(user: user)
    }
    
    func setRoundedCorner(_ view: UIView) {
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.0
    }

    @IBAction func userRegisterAction(_ sender: Any) {
        registerUser()
    }
    
    @IBAction func openChatAction(_ sender: Any) {
        ChatBot.presentChatWindow()
    }
    @IBAction func logoutAction(_ sender: Any) {
        ChatBot.unregisterUser()
        ChatBot.register(user: nil)
    }
}
