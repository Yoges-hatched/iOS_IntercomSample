//
//  ChatBot.swift
//  grocery-ios
//
//  Created by Yogeswaran Siva on 6/1/20.
//  Copyright © 2020 HatchedLabs. All rights reserved.
//

import Foundation
import Intercom

struct User {
    var name: String
    var email: String
    var intercomIdentityVerification: String
    var identityToken: String
}

final class ChatBot {
    static let INTERCOM_APP_ID = "xe4hn2sl"
   static let INTERCOM_API_KEY = "ios_sdk-661b8fea82bfadade639a1901e3c59d0ec70ef4b"
    
    static func configure() {
        Intercom.setApiKey(ChatBot.INTERCOM_API_KEY, forAppId: ChatBot.INTERCOM_APP_ID)
    }
    
    static func register(user: User?) {
        guard let userDetails = user  else {
            Intercom.registerUnidentifiedUser()
            return
        }
        registerUser(user: userDetails)
    }
    
    static func unregisterUser() {
        Intercom.logout()
    }
    
    
    static func presentChatWindow() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Just to wait for user registration, this delay is not used in project
            Intercom.presentMessenger()
        }
        
    }
    
    private static func registerUser(user: User) {
        ChatBot.registerIdentityVerification(user: user)
        Intercom.registerUser(withUserId: user.identityToken, email: user.email)
        let userAttributes = ICMUserAttributes()
        userAttributes.name = user.name
        Intercom.updateUser(userAttributes)
    }
    
    private static func registerIdentityVerification(user: User) {
        Intercom.setUserHash(user.intercomIdentityVerification)
    }
    
}
