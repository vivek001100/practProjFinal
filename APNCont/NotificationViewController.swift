//
//  NotificationViewController.swift
//  APNCont
//
//  Created by VM on 17/04/23.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    
    @IBOutlet var label: UILabel?
    @IBOutlet var imageView: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
        let attachments = notification.request.content.attachments
        for attachment in attachments {
            if attachment.identifier == "picture" {
                print ("imageUrl: ", attachment.url)
                guard let data = try? Data(contentsOf: attachment.url) else { return }
                imageView?.image = UIImage (data: data)
            }
        }
    }
    
}
