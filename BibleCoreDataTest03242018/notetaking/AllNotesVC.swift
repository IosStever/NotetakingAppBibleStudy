//
//  AllNotesVC.swift
//  BibleCoreDataTest03242018
//
//  Created by Steven Robertson on 4/15/18.
//  Copyright © 2018 Steven Robertson. All rights reserved.
//

import UIKit

class AllNotesVC: UIViewController {

    @IBOutlet weak var allNotesTV: UITextView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleOfNotes: UILabel!
    var titleText = ""
    var allNotesVar = NSAttributedString(string: "Oops")
    var myString = "Hello world"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allNotesTV.allowsEditingTextAttributes=true
        titleOfNotes.text = titleText
        allNotesTV.attributedText = allNotesVar
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        //let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh, target: self, action: "someAction")

        let share = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.action,  target: self, action: #selector(self.share))
        let format = UIBarButtonItem(title: "Format", style: .plain, target: self, action: #selector(self.changeAttributes))
        navigationItem.rightBarButtonItems = [share, format]

        
}

    @objc func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                return
        }
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification){

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func share() {
        let print = UISimpleTextPrintFormatter(attributedText: allNotesVar)
        let ac = UIActivityViewController(activityItems: [allNotesTV.attributedText!, print], applicationActivities: nil)
                present(ac, animated: true)
                if let popOver = ac.popoverPresentationController {
                    popOver.sourceView = self.view
    }
    
    }
    
    @objc func changeAttributes() {
        let allNotes = allNotesVar as! NSMutableAttributedString
        allNotes.replaceFont(with: UIFont(name: "Georgia", size: 12)!)
        allNotesTV.attributedText=allNotes
    }
}

extension NSMutableAttributedString {
    func replaceFont(with font: UIFont) {
        beginEditing()
        self.enumerateAttribute(.font, in: NSRange(location: 0, length: self.length)) { (value, range, stop) in
            if let f = value as? UIFont {
                let ufd = f.fontDescriptor.withFamily(font.familyName).withSymbolicTraits(f.fontDescriptor.symbolicTraits)!
                let newFont = UIFont(descriptor: ufd, size: font.pointSize)
                removeAttribute(.font, range: range)
                addAttribute(.font, value: newFont, range: range)
            }
        }
        endEditing()
    }
}
