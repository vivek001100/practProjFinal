//
//  ToastController.swift
//  PracProj
//
//  Created by VM on 17/03/23.
//

import UIKit


enum Position : Int {
    case TOP = 0
    case MIDDLE = 1
    case BOTTOM = 2
    case DEFAULT = 3
}

enum Duration : Int {
    case LONG = 0
    case SHORT = 1
    case DEFAULT = 3
}

func showToast(message : String, font: UIFont = .systemFont(ofSize: 12),duration: Duration = .DEFAULT, position : Position = .DEFAULT) {
    var delay = 3.0
    var width : CGFloat = 0.0
    var height : CGFloat = 0.0
    width = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.frame.width ?? 0
    height = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.frame.height ?? 0
    let size = CGSize(width: 250, height: 1000)
    let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
    let estimatedFrame = NSString(string: message).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)], context: nil)
    let toastLabel = UILabel()
    toastLabel.translatesAutoresizingMaskIntoConstraints = true
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.numberOfLines = 0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  false
    switch position.rawValue {
    case 0:
        toastLabel.frame = CGRect( x: width/2 - ( estimatedFrame.width/2) , y: 50, width: estimatedFrame.width + 20, height: estimatedFrame.height + 20)
    case 1:
        toastLabel.frame = CGRect(x: width/2 - (estimatedFrame.width/2), y: height/2 - (toastLabel.frame.height/2), width: estimatedFrame.width + 20, height: estimatedFrame.height + 20)
    case 2:
        toastLabel.frame = CGRect(x: width/2 - (estimatedFrame.width/2), y: height-100, width: estimatedFrame.width + 20, height: estimatedFrame.height + 20)
    default:
        toastLabel.frame = CGRect(x: width/2 - (estimatedFrame.width/2), y: height-100, width: estimatedFrame.width + 20, height: estimatedFrame.height + 20)
    }
    switch duration.rawValue {
    case 0:
        delay = 10.0
    case 1:
        delay = 3.0
    default:
        delay = 5.0
    }
    
    let window = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
    window?.addSubview(toastLabel)
    
    UIView.animate(withDuration: delay, delay: 0.1, options: .curveEaseOut, animations: {
        toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
}

