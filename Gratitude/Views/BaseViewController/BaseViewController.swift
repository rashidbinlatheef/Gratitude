//
//  BaseViewController.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 11/09/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = ""
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIApplication
            .shared
            .sendAction(
                #selector(UIApplication.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
    }
    
    func registerForKeyBoardNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(notification:)),
            name: UIResponder.keyboardWillHideNotification, object: nil
        )
    }
    
    func removerKeyBoardNotificationObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func keyboardWillShow(notification: NSNotification) {
    }
    
    @objc
    func keyboardWillHide(notification: NSNotification) {
    }
    
    func updateConstraintsWithKeyboardNotification(
        _ notification: NSNotification,
        constraint: NSLayoutConstraint,
        constant: CGFloat
    ) {
        var animationDuration = 0.25
        if let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            animationDuration = duration
        }
        var animationCurve = UInt(7)
        if let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt {
            animationCurve = curve
        }
        constraint.constant = constant
        UIView.animate(
            withDuration: TimeInterval(animationDuration),
            delay: 0,
            options: [UIView.AnimationOptions(rawValue: UInt(animationCurve))],
            animations: { [weak self] in
                self?.view.layoutIfNeeded()
            },
            completion: nil)
    }
}
