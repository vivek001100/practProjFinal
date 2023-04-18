//
//  AppDelegate.swift
//  PracProj
//
//  Created by VM on 14/03/23.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate{

    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        
        Messaging.messaging().apnsToken = deviceToken
        Messaging.messaging().token { token, error in
            debugPrint(token ?? "","fcm token")
            NotificationCenter.default.post(
                name: Notification.Name("FCMTokenRegistered"),
                object: nil,
                userInfo: nil)
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerForPushNotifications()
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    func registerForPushNotifications() {
        
        UNUserNotificationCenter.current().delegate = self

        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
          options: authOptions,
          completionHandler: { _, _ in }
        )

        
        let doneAction = UNNotificationAction(identifier: NotificationAction.doneAction.rawValue, title: "Done",options: [.foreground])
        
        let cancelAction = UNNotificationAction(identifier: NotificationAction.cancelAction.rawValue, title: "Cancel",options: [])
        
        let demoApnCategory = UNNotificationCategory(identifier: "demoApnCategory", actions: [doneAction,cancelAction], intentIdentifiers: [],options: .customDismissAction)
        
        UNUserNotificationCenter.current().setNotificationCategories([demoApnCategory])
        UIApplication.shared.registerForRemoteNotifications()

      }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        switch NotificationAction(rawValue: response.actionIdentifier){
        case.doneAction:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let registerStoryBoard = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
            UIApplication.shared.windows.first?.rootViewController = registerStoryBoard
          print("window")
        case .cancelAction:
            print("dedec")
        case .none:
            break
        }
    }
    
    enum NotificationAction: String {
        case doneAction = "APN.doneAction"
        case cancelAction = "APN.cancelAction"
    }
}

