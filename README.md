#  To do list
Folders?
User info screen
Add passage info to note list VC
Add info/help buttons to each category or one help page-Did the one page    
Icons - better ones
Allow user to enter font size? Or choose between several?
Indent the text on the all notes page
Activity indicator (HUD?)
Review Angela Yu's app on tableview cells that go offscreen

Reminders

Help page for using the app

Use actual icons (for save)

Way to save all notes page in app and retrieve it later (but we still want to concatenate all notes fresh each time)

12Cat Bible Study

Prayer requests and answers section

Highlight headings on list page

Create search feature - especially for title

//        contextTV.delegate = self
//        genObsTV.delegate = self
//        keyTermsTV.delegate = self
//        difficultiesTV.delegate = self
//        unexpectedTV.delegate = self
//        comparisonsTV.delegate = self
//        crossRefsTV.delegate = self
//        aboutGodTV.delegate = self
//        spiritualResourcesTV.delegate = self
//        correctsTV.delegate = self
//        takeawaysTV.delegate = self
//        applicationTV.delegate = self


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
let strArr2 = [note.context, note.observations, note.keyTerms, note.difficulties, note.unexpected, note.crossRefs, note.aboutGod, note.spiritualResources, note.corrects, note.takeaways, note.application]

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
func tempallNotesTogether() {
saveData()
loadNoteData()
let attrs = [NSAttributedStringKey.font : UIFont(name: "Georgia-Bold", size: 12)!]
allNotes = NSAttributedString(string: "")


if let context = contextTV.attributedText {
allNotes = allNotes + NSAttributedString(string: "Context\n", attributes: attrs)
allNotes = allNotes + context
}
if let context = genObsTV.attributedText {
allNotes = allNotes + NSAttributedString(string: "\n\nGeneral observations\n", attributes: attrs)
allNotes = allNotes + context
}
if let context = keyTermsTV.attributedText {
allNotes = allNotes + NSAttributedString(string: "\n\nKey terms\n", attributes: attrs)
allNotes = allNotes + context
}
if let context = difficultiesTV.attributedText {
allNotes = allNotes + NSAttributedString(string: "\n\nDifficulties\n", attributes: attrs)
allNotes = allNotes + context
}
if let context = unexpectedTV.attributedText {
allNotes = allNotes + NSAttributedString(string: "\n\nUnexpected\n", attributes: attrs)
allNotes = allNotes + context
}
if let context = comparisonsTV.attributedText {
allNotes = allNotes + NSAttributedString(string: "\n\nComparisons/contrasts\n", attributes: attrs)
allNotes = allNotes + context
}
if let context = crossRefsTV.attributedText {
allNotes = allNotes + NSAttributedString(string: "\n\nCross References\n", attributes: attrs)
allNotes = allNotes + context
}
if let context = aboutGodTV.attributedText {
allNotes = allNotes + NSAttributedString(string: "\n\nWhat this tells us about God\n", attributes: attrs)
allNotes = allNotes + context
}
if let context = spiritualResourcesTV.attributedText {
allNotes = allNotes + NSAttributedString(string: "\n\nSpiritual Resources\n", attributes: attrs)
allNotes = allNotes + context
}
if let context = correctsTV.attributedText {
allNotes = allNotes + NSAttributedString(string: "\n\nCorrects conduct or error\n", attributes: attrs)
allNotes = allNotes + context
}
if let context = takeawaysTV.attributedText {
allNotes = allNotes + NSAttributedString(string: "\n\nTakeaways\n", attributes: attrs)
allNotes = allNotes + context
}
if let context = applicationTV.attributedText {
allNotes = allNotes + NSAttributedString(string: "\n\nApplication\n", attributes: attrs)
allNotes = allNotes + context
}
}

func TemploadNoteData() {
if let note = noteToEdit {

if let title = note.passage {
noteTitleName.text = title
}

if let context = note.context {
contextTV.attributedText = context as! NSAttributedString
}
if let observations = note.observations {
genObsTV.attributedText = observations as! NSAttributedString
}
if let keyTerms = note.keyTerms {
keyTermsTV.attributedText = keyTerms as! NSAttributedString
}
if let difficulties = note.difficulties {
difficultiesTV.attributedText = difficulties as! NSAttributedString
}
if let unexpected=note.unexpected {
unexpectedTV.attributedText = unexpected as! NSAttributedString
}
if let contrast = note.contrast {
comparisonsTV.attributedText = contrast as! NSAttributedString
}
if let crossRefs = note.crossRefs {
crossRefsTV.attributedText = crossRefs as! NSAttributedString
}
if let aboutGod = note.aboutGod {
aboutGodTV.attributedText = aboutGod as! NSAttributedString
}
if let spiritualResources = note.spiritualResources {
spiritualResourcesTV.attributedText = spiritualResources as! NSAttributedString
}
if  let corrects = note.corrects {
correctsTV.attributedText = corrects as! NSAttributedString
}
if let takeaways = note.takeaways {
takeawaysTV.attributedText = takeaways as! NSAttributedString
}
if let application = note.application {
applicationTV.attributedText = application as! NSAttributedString
}

contextOutletSwitch.setOn(note.contextDone, animated: false)
observationsOutletSwitch.setOn(note.observationsDone, animated: false)
keyTermsOutletSwitch.setOn(note.keyTermsDone, animated: false)
difficultiesOutletSwitch.setOn(note.difficultiesDone, animated: false)
unexpectedOutletSwitch.setOn(note.unexpectedDone, animated: false)
comparisonsOutletSwitch.setOn(note.contrastDone, animated: false)
crossRefsOutletSwitch.setOn(note.crossRefsDone, animated: false)
aboutGodOutletSwitch.setOn(note.aboutGodDone, animated: false)
spiritualResourcesOutletSwitch.setOn(note.spiritualResourcesDone, animated: false)
correctsOutletSwitch.setOn(note.correctsDone, animated: false)
takeawaysOutletSwitch.setOn(note.takeawaysDone, animated: false)
applicationOutletSwitch.setOn(note.applicationDone, animated: false)

}
}
/*
func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {

switch(type) {

case.insert:
if let indexPath = newIndexPath {
titlesTableView.insertRows(at: [indexPath], with: .fade)
}
break
case.delete:
if let indexPath = indexPath {
titlesTableView.deleteRows(at: [indexPath], with: .fade)
}
break
case.update:
if let indexPath = indexPath {
let cell = titlesTableView.cellForRow(at: indexPath) as! TitleCell
configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
}
break
case.move:
if let indexPath = indexPath {
titlesTableView.deleteRows(at: [indexPath], with: .fade)
}
if let indexPath = newIndexPath {
titlesTableView.insertRows(at: [indexPath], with: .fade)
}
break

}
}
*/
        var allFields = [note.context, note.observations, note.keyTerms, note.difficulties, note.unexpected, note.contrast, note.crossRefs, note.aboutGod, note.spiritualResources, note.corrects, note.takeaways, note.application]
        if let passageContext = contextTV.attributedText {
        note.context = passageContext
        }
        if let generalObs = genObsTV.attributedText {
        note.observations = generalObs
        }
        if let keyTerms = keyTermsTV.attributedText  {
        note.keyTerms = keyTerms
        }
        if let difficulties = difficultiesTV.attributedText {
        note.difficulties = difficulties
        }
        if let unexpected = unexpectedTV.attributedText {
        note.unexpected = unexpected
        }
        if let comparisons = comparisonsTV.attributedText {
        note.contrast = comparisons
        }
        if let crossRefs = crossRefsTV.attributedText {
        note.crossRefs = crossRefs
        }
        if let aboutGod = aboutGodTV.attributedText  {
        note.aboutGod = aboutGod
        }
        if let spiritualResources = spiritualResourcesTV.attributedText {
        note.spiritualResources = spiritualResources
        }
        if let corrects = correctsTV.attributedText {
        note.corrects = corrects
        }
        if let takeaways = takeawaysTV.attributedText {
        note.takeaways = takeaways
        }
        if let application = applicationTV.attributedText {
        note.application = application
        }
        if contextOutletSwitch.isOn == true  {
        note.contextDone = true
        note.sectionsCompleted += 1
        }
        else {
        note.contextDone = false
        }
        if observationsOutletSwitch.isOn == true  {
        note.observationsDone = true
        note.sectionsCompleted += 1
        }
        else {
        note.observationsDone = false
        }
        if keyTermsOutletSwitch.isOn == true  {
        note.keyTermsDone = true
        note.sectionsCompleted += 1
        }
        else {
        note.keyTermsDone = false
        }
        if difficultiesOutletSwitch.isOn == true {
        note.difficultiesDone = true
        note.sectionsCompleted += 1
        }
        else {
        note.difficultiesDone = false
        }
        if unexpectedOutletSwitch.isOn == true  {
        note.unexpectedDone = true
        note.sectionsCompleted += 1
        }
        else {
        note.unexpectedDone = false
        }
        if comparisonsOutletSwitch.isOn == true {
        note.contrastDone = true
        note.sectionsCompleted += 1
        }
        else {
        note.contrastDone = false
        }
        if crossRefsOutletSwitch.isOn == true  {
        note.crossRefsDone = true
        note.sectionsCompleted += 1
        }
        else {
        note.crossRefsDone = false
        }
        if aboutGodOutletSwitch.isOn == true {
        note.aboutGodDone = true
        note.sectionsCompleted += 1
        }
        else {
        note.aboutGodDone = false
        }
        if spiritualResourcesOutletSwitch.isOn == true {
        note.spiritualResourcesDone = true
        note.sectionsCompleted += 1
        }
        else {
        note.spiritualResourcesDone = false
        }
        if correctsOutletSwitch.isOn == true {
        note.correctsDone = true
        note.sectionsCompleted += 1
        }
        else {
        note.correctsDone = false
        }
        if takeawaysOutletSwitch.isOn == true  {
        note.takeawaysDone = true
        note.sectionsCompleted += 1
        }
        else {
        note.takeawaysDone = false
        }
        if applicationOutletSwitch.isOn == true  {
        note.applicationDone = true
        note.sectionsCompleted += 1
        }
        else {
        note.applicationDone = false
        }
        func tempFunc() {
        var note: Note!
        note = noteToEdit
        var x = 0
        let allTextViews = [contextTV, genObsTV, keyTermsTV, difficultiesTV, unexpectedTV, comparisonsTV, crossRefsTV, aboutGodTV, spiritualResourcesTV, correctsTV,  takeawaysTV, applicationTV]
        while x < allTextViews.count {
        if let textViewInFocus = allTextViews[x]?.attributedText {
        switch x {
        case 0:
        note.context = textViewInFocus
        case 1:
        note.observations = textViewInFocus
        case 2:
        note.keyTerms = textViewInFocus
        case 3:
        note.difficulties = textViewInFocus
        case 4:
        note.unexpected = textViewInFocus
        case 5:
        note.contrast = textViewInFocus
        case 6:
        note.crossRefs = textViewInFocus
        case 7:
        note.aboutGod = textViewInFocus
        case 8:
        note.spiritualResources = textViewInFocus
        case 9:
        note.corrects = textViewInFocus
        case 10:
        note.takeaways = textViewInFocus
        case 11:
        note.application = textViewInFocus
        default:
        return
        }
        }
        x += 1
        }
        var y = 0
        note.contextDone = contextOutletSwitch.isOn
        let allSwitches = [contextOutletSwitch, observationsOutletSwitch, keyTermsOutletSwitch, difficultiesOutletSwitch, unexpectedOutletSwitch, comparisonsOutletSwitch, crossRefsOutletSwitch, aboutGodOutletSwitch, spiritualResourcesOutletSwitch, correctsOutletSwitch, takeawaysOutletSwitch, applicationOutletSwitch]
        while y < allSwitches.count {
        switch y {
        case 0:
        note.contextDone = (allSwitches[y]?.isOn)!
        case 1:
        note.observationsDone = (allSwitches[y]?.isOn)!
        case 2:
        note.keyTermsDone = (allSwitches[y]?.isOn)!
        case 3:
        note.difficultiesDone = (allSwitches[y]?.isOn)!
        case 4:
        note.unexpectedDone = (allSwitches[y]?.isOn)!
        case 5:
        note.contrastDone = (allSwitches[y]?.isOn)!
        case 6:
        note.crossRefsDone = (allSwitches[y]?.isOn)!
        case 7:
        note.aboutGodDone = (allSwitches[y]?.isOn)!
        case 8:
        note.spiritualResourcesDone = (allSwitches[y]?.isOn)!
        case 9:
        note.correctsDone = (allSwitches[y]?.isOn)!
        case 10:
        note.takeawaysDone = (allSwitches[y]?.isOn)!
        case 11:
        note.applicationDone = (allSwitches[y]?.isOn)!
        default:
        return
        }
        y += 1
        }
        y = 0
        while y < allSwitches.count {
        if allSwitches[y]?.isOn == true {
        note.sectionsCompleted += 1
        }
        y += 1
        }
        
        }
