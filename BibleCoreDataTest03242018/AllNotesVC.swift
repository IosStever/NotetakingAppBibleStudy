//
//  AllNotesVC.swift
//  BibleCoreDataTest03242018
//
//  Created by Steven Robertson on 4/15/18.
//  Copyright © 2018 Steven Robertson. All rights reserved.
//

import UIKit

class AllNotesVC: UIViewController {

    @IBOutlet weak var allNotesSV: UIScrollView!
    @IBOutlet weak var allNotesTV: UITextView!
    
    @IBOutlet weak var titleOfNotes: UILabel!
    var titleText = ""
    var allNotesVar = NSAttributedString(string: "Oops")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollHeight : CGFloat = 2000
        allNotesSV.contentSize.height = scrollHeight
        allNotesTV.allowsEditingTextAttributes=true
        titleOfNotes.text = titleText
        allNotesTV.attributedText = allNotesVar
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(noti:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(noti:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)

//        let notificationCenter = NotificationCenter.default
//        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillHide, object: nil)
//        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        //allNotesTV.attributedText = NSAttributedString(string: "Hey")
        // Do any additional setup after loading the view.
    }

    @objc func keyboardWillHide(noti: Notification) {
        let contentInsets = UIEdgeInsets.zero
        allNotesSV.contentInset = contentInsets
        allNotesSV.scrollIndicatorInsets = contentInsets
    }
    
    
    @objc func keyboardWillShow(noti: Notification) {
        
        guard let userInfo = noti.userInfo else { return }
        guard var keyboardFrame: CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else { return }
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = allNotesSV.contentInset
        contentInset.bottom = keyboardFrame.size.height
        allNotesSV.contentInset = contentInset
    }
    
//    @objc func adjustForKeyboard(notification: Notification) {
//        let userInfo = notification.userInfo!
//
//        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
//
//        if notification.name == Notification.Name.UIKeyboardWillHide {
//            allNotesTV.contentInset = UIEdgeInsets.zero
//        } else {
//            allNotesTV.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
//        }
//
//        allNotesTV.scrollIndicatorInsets = allNotesTV.contentInset
//
//        let selectedRange = allNotesTV.selectedRange
//        allNotesTV.scrollRangeToVisible(selectedRange)
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
