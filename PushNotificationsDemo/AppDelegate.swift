//
//  AppDelegate.swift
//  PushNotificationsDemo
//
//  Created by Hussein Anwar on 17/10/2022.
//

import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate, UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { success, error in
            guard success else { return }
            
            print("SUCCESS in APNs Registration")
            
        }
        application.registerForRemoteNotifications()
        return true
    }

    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        messaging.token { token,error in
            guard let token = token else { return }
            print("TOKEN : \(token)")
        }
    }
    


}

