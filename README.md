#  To do list
User info screen
Add passage info to note list VC
Add info/help buttons to each category or one help page-Did the one page    
default fonts
Icons - better ones
test shorter version of scroll view
Insert warning before deleting
Ability to change font for text views, allNotes, increase font size
Indent the text on the all notes page
Activity indicator (HUD?)

Change bottom margin

Reminders

Help page for using the app

Use actual icons (for save)

Way to save all notes page in app and retrieve it later

12Cat Bible Study

Prayer requests and answers section

Highlight headings on list page

Save notes each time they go away (help, preview)

Create search feature - especially for title


        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backPressed))
        //        let attrs = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 72), NSAttributedStringKey.foregroundColor: UIColor.red]
        //        let str = NSAttributedString(string: text, attributes: attrs)
        //    @objc func share(text: NSAttributedString) {
        //
        //        let print = UISimpleTextPrintFormatter(attributedText: allNotesVar)
        //
        //        let vc = UIActivityViewController(activityItems: [print], applicationActivities: nil)
        //        present(vc, animated: true)
        //        if let popOver = vc.popoverPresentationController {
        //            popOver.sourceView = self.view
        //    }
        //
        //    }
//    func fetchRecord() -> [Note] {
//
//        do {
//            notes = try context.fetch(Note.fetchRequest())
//
//        } catch {
//            print("Error fetching data from CoreData")
//        }
//        return notes
//    }
//    @IBAction func addActionBtn(_ sender: UIBarButtonItem) {
//        let alert = UIAlertController(title: "Delete this set of notes?", message: "This cannot be undone!", preferredStyle: .actionSheet)
//
//        let delete = UIAlertAction(title: "Delete", style: .default) { [weak self] (action: UIAlertAction) in
//            if self?.noteToEdit != nil {
//                context.delete((self?.noteToEdit!)!)
//                ad.saveContext()
//            }
//            _ = self??.navigationController?.popViewController(animated: true)
//            
//            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
//
//            alert.addAction(action)
//            alert.addAction(cancelAction)
//
//            let popover = alert.popoverPresentationController
//            popover?.sourceView = self?.view
//            popover?.sourceRect = CGRect(x: 32, y: 32, width: 64, height: 64)
//            self?.present(alert, animated: true)
//
//        }

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

let strArr1 = [comparisonsTV, contextTV, genObsTV, keyTermsTV, difficultiesTV, unexpectedTV, crossRefsTV, aboutGodTV, spiritualResourcesTV, correctsTV, takeawaysTV, applicationTV]
let strArr2 = [note.contrast, note.context, note.observations, note.keyTerms, note.difficulties, note.unexpected, note.crossRefs, note.aboutGod, note.spiritualResources, note.corrects, note.takeaways, note.application]

for (e1, e2) in zip(strArr1, strArr2) {
if let x = e1?.attributedText {
e2 = x
}
}

let strArr1 = [comparisonsTV, contextTV, genObsTV, keyTermsTV, difficultiesTV, unexpectedTV, crossRefsTV, aboutGodTV, spiritualResourcesTV, correctsTV, takeawaysTV, applicationTV]
let strArr2 = [note.contrast, note.context, note.observations, note.keyTerms, note.difficulties, note.unexpected, note.crossRefs, note.aboutGod, note.spiritualResources, note.corrects, note.takeaways, note.application]

for i in 0..<strArr1.count {
if let x = strArr1[i].attributedText {
strArr2[i] = x
}
}


//    func jsonnow() {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Note")
//        fetchRequest.resultType = .dictionaryResultType
//        do {
//            records = try context.fetch(fetchRequest)
//        } catch {
//            print("Error fetching data from CoreData")
//        }
//    }

//    @objc func jsonnow2() {
//        if let record = notes[1] {
//        let keys = Array(record.entity.attributesByName.keys)
//        let dict = record.dictionaryWithValues(forKeys: keys)
//        
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
//            let reqJSONStr = String(data: jsonData, encoding: .utf8)
//            print(reqJSONStr!)
//        } catch {
//            }
//        }
//    }
/*
@objc private func fetchRecordsForEntity(_ entity: String, inManagedObjectContext managedObjectContext: NSManagedObjectContext) -> [NSManagedObject] {
// Create Fetch Request
let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)

// Helpers
var result = [NSManagedObject]()

do {
// Execute Fetch Request
let records = try managedObjectContext.fetch(fetchRequest)

if let records = records as? [NSManagedObject] {
result = records
}
print(result)
} catch {
print("Unable to fetch managed objects for entity \(entity).")
}

return result
}
*/
