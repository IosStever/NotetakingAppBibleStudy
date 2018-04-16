#  To do list
Keyboard code-something that works better than what I have
Delete button
Completion switches
User info screen
Add info to note list VC
Border to text views-DONE
Add info buttons to each category
Fix pop up alert when no title is given
Background


        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deletePressed))
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        //How to add more than one button
        //let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        //            let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(playTapped))
        //
        //            navigationItem.rightBarButtonItems = [add, play]
        //        if let topItem = self.navigationController?.navigationBar.topItem {
        //            topItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        //        }
//            contextTV.attributedText = note.context as! NSAttributedString
//            genObsTV.attributedText = note.observations as! NSAttributedString
//            keyTermsTV.attributedText = note.keyTerms as! NSAttributedString
//            difficultiesTV.attributedText = note.difficulties as! NSAttributedString
//            unexpectedTV.attributedText = note.unexpected as! NSAttributedString
//            comparisonsTV.attributedText = note.contrast as! NSAttributedString
//            crossRefsTV.attributedText = note.crossRefs as! NSAttributedString
//            aboutGodTV.attributedText = note.aboutGod as! NSAttributedString
//            spiritualResourcesTV.attributedText = note.spiritualResources as! NSAttributedString
//            correctsTV.attributedText = note.corrects as! NSAttributedString
//            takeawaysTV.attributedText = note.takeaways as! NSAttributedString
//            applicationTV.attributedText = note.application as! NSAttributedString

//    @IBAction func contextDoneSwitch(_ sender: UISwitch) {
//        if sender.isOn == true {
//            //noteToEdit?.contextDone = true
//            contextBool = true
//        } else {
//            contextBool = false
//        }
//    }
//    @IBAction func observationsDoneSwitch(_ sender: UISwitch) {
//        if sender.isOn == true {
//            //noteToEdit?.observationsDone = true
//            observationsBool = true
//        } else {
//            observationsBool = false
//        }
//    }
//
//     @IBAction func keyTermsDoneSwitch(_ sender: UISwitch) {
//     if sender.isOn == true {
//     keyTermsBool = true
//     } else
//     {
//        keyTermsBool = false
//        }
//     }
//     @IBAction func difficultiesDoneSwitch(_ sender: UISwitch) {
//     if sender.isOn == true {
//     difficultiesBool = true
//     }
//     }
//     @IBAction func unexpectedDoneSwitch(_ sender: UISwitch) {
//     if sender.isOn == true {
//     unexpectedBool = true
//     }
//     }
//     @IBAction func comparisonsDoneSwitch(_ sender: UISwitch) {
//     if sender.isOn == true {
//     comparisonsBool = true
//     }
//     }
//     @IBAction func crossRefsDoneSwitch(_ sender: UISwitch) {
//     if sender.isOn == true {
//     crossRefsBool = true
//     }
//     }
//     @IBAction func aboutGodDoneSwitch(_ sender: UISwitch) {
//     if sender.isOn == true {
//     aboutGodBool = true
//     }
//     }
//
//    @IBAction func spiritualResourcesDoneSwitch(_ sender: UISwitch) {
//    if sender.isOn == true {
//    spiritualResourcesBool = true
//    }
//    }
//
//     @IBAction func correctsConductDoneSwitch(_ sender: UISwitch) {
//     if sender.isOn == true {
//     correctsBool = true
//     }
//     }
//     @IBAction func takeawaysDoneSwitch(_ sender: UISwitch) {
//     if sender.isOn == true {
//     takeawaysBool = true
//     }
//     }
//     @IBAction func applicationDoneSwitch(_ sender: UISwitch) {
//     if sender.isOn == true {
//     applicationBool = true
//     }
//     }
//    var contextBool = Bool()
//    var observationsBool = Bool()
//    var keyTermsBool = Bool()
//    var difficultiesBool = Bool()
//    var unexpectedBool = Bool()
//    var comparisonsBool = Bool()
//    var crossRefsBool = Bool()
//    var aboutGodBool = Bool()
//    var spiritualResourcesBool = Bool()
//    var correctsBool = Bool()
//    var takeawaysBool = Bool()
//    var applicationBool = Bool()

/*
override func viewWillAppear(_ animated: Bool) {
super.viewWillAppear(animated)
/// Move TextFields to keyboard. Step 7: Add observers to receive UIKeyboardWillShow and UIKeyboardWillHide notification.
addObservers()
}

override func viewWillDisappear(_ animated: Bool) {
super.viewWillDisappear(animated)
/// Move TextFields to keyboard. Step 8: Remove observers to NOT receive notification when viewcontroller is in the background.
removeObservers()
}

/// Move TextFields to keyboard. Step 2: Add method to handle tap event on the view and dismiss keyboard.
@objc func didTapView(gesture: UITapGestureRecognizer) {
// This should hide keyboard for the view.
view.endEditing(true)
}

/// Move TextFields to keyboard. Step 3: Add observers for 'UIKeyboardWillShow' and 'UIKeyboardWillHide' notification.
func addObservers() {
NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: nil) {
notification in
self.keyboardWillShow(notification: notification)
}
}

/// Move TextFields to keyboard. Step 6: Method to remove observers.
func removeObservers() {
NotificationCenter.default.removeObserver(self)
}

/// Move TextFields to keyboard. Step 4: Add method to handle keyboardWillShow notification, we're using this method to adjust scrollview to show hidden textfield under keyboard.
func keyboardWillShow(notification: Notification) {
guard let userInfo = notification.userInfo,
let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
return
}
let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
myScrollView.contentInset = contentInset
}

//Move TextFields to keyboard. Step 5: Method to reset scrollview when keyboard is hidden.
func keyboardWillHide(notification: Notification) {
myScrollView.contentInset = UIEdgeInsets.zero

}
*/
