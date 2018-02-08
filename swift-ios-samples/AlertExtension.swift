//
//  AlertExtension.swift
//

import UIKit

// MARK: - Extensions related to UIAlertController
extension UIViewController {
    
    /// Extension for presenting alert easily
    ///
    /// - Parameters:
    ///   - title: optional title of alert
    ///   - message: optional message of alert
    ///   - completion: to be executed after user dismisses alert
    func presentAlert(title: String?, message: String?, completion: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
            if let completion = completion { completion() }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    /// Extension for presnting action sheet easily
    ///
    /// - Parameters:
    ///   - title: optional title of action sheet
    ///   - message: optional message of action sheet
    ///   - actionTitle: optional title of action to be presented
    ///   - completion: to be executed after user taps on action
    func presentActionSheet(title: String?, message: String?, actionTitle: String?, completion: (() -> Void)?) {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: actionTitle, style: .destructive, handler: { (_) in
            if let completion = completion { completion() }
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
}
