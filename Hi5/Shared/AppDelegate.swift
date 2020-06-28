//
//  AppDelegate.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright © 2019 FudexApp. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import IQKeyboardManagerSwift
import Firebase
import FirebaseMessaging


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate , UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        NSSetUncaughtExceptionHandler { exception in
            print(exception)
            print(exception.callStackSymbols)
        }
        IQKeyboardManager.shared.enable = true
        GMSPlacesClient.provideAPIKey("AIzaSyCoVBRCbQ4-8y5LCj_m5Nu4Y0ea1ZYrIXQ")
        GMSServices.provideAPIKey("AIzaSyCoVBRCbQ4-8y5LCj_m5Nu4Y0ea1ZYrIXQ")
        FirebaseApp.configure()
        
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
        Messaging.messaging().delegate = self
        return true
    }
    
    
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
        
        let dataDict:[String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        
        UserDefaults.standard.set("\(fcmToken)", forKey: "firebase_token")
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
    
    private func application(application: UIApplication,
                             didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        Messaging.messaging().apnsToken = deviceToken as Data
    }
    
    private func testWebServices() {
        //    keyChain.delete(ChainKeys.userInfo)
        //    defaults.permanentState = .initial
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("received")
        NotificationCenter.default.post(name: Notification.Name("ReceiveData"), object: nil)
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("falied")
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("didRegisterForRemoteNotificationsWithDeviceToken")
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("didRegisterForRemoteNotificationsWithDeviceToken")
        NotificationCenter.default.post(name: Notification.Name("ReceiveData"), object: nil)
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("didReceive")
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        print("openSettingsFor")
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
    
    
}

