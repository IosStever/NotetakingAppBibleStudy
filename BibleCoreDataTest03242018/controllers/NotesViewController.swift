//
//  NotesViewController.swift
//  BibleCoreDataTest03242018
//
//  Created by Steven Robertson on 4/12/18.
//  Copyright © 2018 Steven Robertson. All rights reserved.
//

import UIKit
import CoreData

class NotesViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var noteTitleName: UITextField!
    
    @IBOutlet weak var contextTV: UITextView!
    @IBOutlet weak var genObsTV: UITextView!
    @IBOutlet weak var keyTermsTV: UITextView!
    @IBOutlet weak var difficultiesTV: UITextView!
    @IBOutlet weak var unexpectedTV: UITextView!
    @IBOutlet weak var comparisonsTV: UITextView!
    @IBOutlet weak var crossRefsTV: UITextView!
    @IBOutlet weak var aboutGodTV: UITextView!
    @IBOutlet weak var spiritualResourcesTV: UITextView!
    @IBOutlet weak var takeawaysTV: UITextView!
    @IBOutlet weak var applicationTV: UITextView!
    @IBOutlet weak var correctsTV: UITextView!
    
    @IBOutlet weak var contextOutletSwitch: UISwitch!
    @IBOutlet weak var observationsOutletSwitch: UISwitch!
    @IBOutlet weak var keyTermsOutletSwitch: UISwitch!
    @IBOutlet weak var difficultiesOutletSwitch: UISwitch!
    @IBOutlet weak var unexpectedOutletSwitch: UISwitch!
    @IBOutlet weak var comparisonsOutletSwitch: UISwitch!
    @IBOutlet weak var crossRefsOutletSwitch: UISwitch!
    @IBOutlet weak var aboutGodOutletSwitch: UISwitch!
    @IBOutlet weak var spiritualResourcesOutletSwitch: UISwitch!
    @IBOutlet weak var correctsOutletSwitch: UISwitch!
    @IBOutlet weak var takeawaysOutletSwitch: UISwitch!
    @IBOutlet weak var applicationOutletSwitch: UISwitch!
    
    
    var noteToEdit: Note?
    var categoriesCompleted = 0
    var newNoteDefaultTitle = ""
    var allNotes = NSAttributedString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView(gesture:)))
        view.addGestureRecognizer(tapGesture)
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: Notification.Name.UIApplicationWillResignActive, object: nil)
        notificationCenter.addObserver(self, selector: #selector(self.keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(self.keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let allTextViews = [genObsTV, difficultiesTV, comparisonsTV, aboutGodTV, correctsTV, applicationTV, contextTV, keyTermsTV, unexpectedTV, crossRefsTV, spiritualResourcesTV, takeawaysTV]
        for i in allTextViews {
            i?.allowsEditingTextAttributes=true
        }
        
        let blackTextViews = [genObsTV, difficultiesTV, comparisonsTV, aboutGodTV, correctsTV, applicationTV]
        for i in blackTextViews {
            i?.layer.borderWidth = 1
            i?.layer.borderColor = UIColor.black.cgColor
        }
        let blueTextViews = [contextTV, keyTermsTV, unexpectedTV, crossRefsTV, spiritualResourcesTV, takeawaysTV]
        for i in blueTextViews {
            i?.layer.borderWidth = 1
            i?.layer.borderColor = UIColor.blue.cgColor
        }
        let allSwitches = [contextOutletSwitch, observationsOutletSwitch, keyTermsOutletSwitch, difficultiesOutletSwitch, unexpectedOutletSwitch, comparisonsOutletSwitch, crossRefsOutletSwitch, aboutGodOutletSwitch, spiritualResourcesOutletSwitch, correctsOutletSwitch, takeawaysOutletSwitch, applicationOutletSwitch]
        for i in allSwitches {
            i?.tintColor = UIColor.gray
        }
        
        
        let delete = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteBtnPressed))
        let viewAll = UIBarButtonItem(title: "Preview", style: .plain, target: self, action: #selector(allNotesPressed))
        let help = UIBarButtonItem(title: "Help", style: .plain, target: self, action: #selector(helpPressed))
        let save = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonPressed))
        let changeFont = UIBarButtonItem(title: "Font+", style: .plain, target: self, action: #selector(formatBtnPressed(_:)))
        
        navigationItem.rightBarButtonItems = [delete, viewAll, help, save, changeFont]
        
        if noteToEdit != nil {
            loadNoteData()
        }
    }
    //MARK: Show/Hide Keyboard
    @objc func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                return
        }
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
        scrollView.contentInset = contentInset
    }
    
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParentViewController {
            backPressed()
        }
    }
    @objc func keyboardWillHide(notification:NSNotification){
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func didTapView(gesture: UITapGestureRecognizer) {
        // This should hide keyboard for the view.
        view.endEditing(true)
    }
    
    @objc func appMovedToBackground() {
        saveData()
    }
    
    //MARK: SaveData
    fileprivate func saveData() {
        var note: Note!
        note = noteToEdit
        
        if let title = noteTitleName.text {
            note.passage = title
        }
        
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
        
        note.sectionsCompleted = 0
        let today = Date()
        note.lastUpdateDate = today
        
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
        
        ad.saveContext()
        //_ = navigationController?.popViewController(animated: true)
        
    }
    //MARK: Keyboard shortcuts
    @objc func nextTextView(textView: UITextView) {
        let allTextViews: [UITextView] = [contextTV, genObsTV, keyTermsTV, difficultiesTV, unexpectedTV, comparisonsTV, crossRefsTV, aboutGodTV, spiritualResourcesTV, correctsTV,  takeawaysTV, applicationTV]
        var x = 0
        while x < allTextViews.count-1 {
            if allTextViews[x].isFirstResponder {
                x = x + 1
                var y = x
                var height = CGFloat(0.0)
                while y >= 0 {
                    height = height + allTextViews[y].frame.size.height
                    y = y - 1
                }
                scrollView.contentOffset = CGPoint(x: 0.0, y: height)
                allTextViews[x].becomeFirstResponder()
                break
            }
            x = x + 1
        }
    }
    
    @objc func prevTextView(textView: UITextView) {
        let allTextViews: [UITextView] = [contextTV, genObsTV, keyTermsTV, difficultiesTV, unexpectedTV, comparisonsTV, crossRefsTV, aboutGodTV, spiritualResourcesTV, correctsTV,  takeawaysTV, applicationTV]
        var x = 1
        while x < allTextViews.count {
            if allTextViews[x].isFirstResponder {
                x = x - 1
                var y = x
                var height = CGFloat(0.0)
                while y >= 0 {
                    height = height + allTextViews[y].frame.size.height
                    y = y - 1
                }
                scrollView.contentOffset = CGPoint(x: 0.0, y: height)
                
                allTextViews[x].becomeFirstResponder()
                
                break
            }
            x = x + 1
        }
    }
    
    override var keyCommands: [UIKeyCommand]? {
        return [
            UIKeyCommand(input: "z", modifierFlags: .alternate, action: #selector(nextTextView), discoverabilityTitle: "Next Text View"),
            UIKeyCommand(input: UIKeyInputDownArrow, modifierFlags: .alternate,
                         //UIKeyModifierFlags(rawValue: 0) for no modifier
                action: #selector(nextTextView), discoverabilityTitle: "Next Text View"),
            UIKeyCommand(input: UIKeyInputUpArrow, modifierFlags: .alternate,
                         action: #selector(prevTextView), discoverabilityTitle: "Previous Text View")
        ]
    }
    
    
    // MARK: Buttons
    
    @IBAction func formatBtnPressed(_ sender: Any) {
        let allTextViews: [UITextView] = [contextTV, genObsTV, keyTermsTV, difficultiesTV, unexpectedTV, comparisonsTV, crossRefsTV, aboutGodTV, spiritualResourcesTV, correctsTV,  takeawaysTV, applicationTV]
        var x = 0
        while x < allTextViews.count {
            if allTextViews[x].isFirstResponder {
                let range = allTextViews[x].selectedRange
                let string = NSMutableAttributedString(attributedString:
                    allTextViews[x].attributedText)
                let attributes = [NSAttributedStringKey.font : UIFont(name: "Georgia", size: 16)!]
                string.addAttributes(attributes, range: range)
                allTextViews[x].attributedText = string
                print(x)
                //allTextViews[x].selectedRange = range
            }
            x = x + 1
        }
        
    }
    
    
    @objc func saveButtonPressed(_ sender: Any) {
        if noteTitleName.text == "" {
            let alert = UIAlertController(title: "Alert!", message: "Please enter title", preferredStyle: .actionSheet)
            let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            alert.addAction(dismissAction)
            let popover = alert.popoverPresentationController
            popover?.sourceView = view
            popover?.sourceRect = CGRect(x: 32, y: 32, width: 64, height: 64)
            present(alert, animated: true)
        }
        
        saveData()
    }
    
    @objc func deleteBtnPressed() {
        let alert = UIAlertController(title: "Delete this set of notes?", message: "This cannot be undone!", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let delete = UIAlertAction(title: "Delete", style: .default) { (action: UIAlertAction) in
            if self.noteToEdit != nil {
                context.delete((self.noteToEdit!))
                ad.saveContext()
            }
            _ = self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(delete)
        alert.addAction(cancelAction)
        let popover = alert.popoverPresentationController
        popover?.sourceView = self.view
        popover?.sourceRect = CGRect(x: 32, y: 32, width: 64, height: 64)
        present(alert, animated: true)
    }
    
    
    @IBAction func deletePressed(_ sender: Any) {
        if noteToEdit != nil {
            context.delete(noteToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func backPressed() {
        if noteToEdit != nil || noteTitleName != nil {
            saveData()
        }
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func allNotesPressed(_ sender: Any) {
        allNotesTogether()
        let myVC = storyboard?.instantiateViewController(withIdentifier: "allNotesStoryboardID") as! AllNotesVC
        myVC.allNotesVar = allNotes
        if let thisVCtitletext = noteToEdit?.passage {
            myVC.titleText = thisVCtitletext
        }
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    @IBAction func helpPressed(_ sender: Any) {
        saveData()
        let myVC = storyboard?.instantiateViewController(withIdentifier: "helpID") as! HelpVC
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    func loadNoteData() {
        var note: Note!
        note = noteToEdit

        if let title = note.passage {
            noteTitleName.text = title
        }
        
        let allTextViews: [UITextView] = [contextTV, genObsTV, keyTermsTV, difficultiesTV, unexpectedTV, comparisonsTV, crossRefsTV, aboutGodTV, spiritualResourcesTV, correctsTV,  takeawaysTV, applicationTV]
        let coreDataFields = [note.context, note.observations, note.keyTerms, note.difficulties, note.unexpected, note.contrast, note.crossRefs, note.aboutGod, note.spiritualResources, note.corrects, note.takeaways, note.application]
        let zipTextViewsFields = zip(allTextViews, coreDataFields)
        for pair in zipTextViewsFields {
            if let x = pair.1 {
                pair.0.attributedText = x as! NSAttributedString
            }
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
    
    func allNotesTogether() {
        saveData()
        loadNoteData()
        let attrs = [NSAttributedStringKey.font : UIFont(name: "Georgia-Bold", size: 12)!]
        allNotes = NSAttributedString(string: "")
        
        let allTextViews: [UITextView] = [contextTV, genObsTV, keyTermsTV, difficultiesTV, unexpectedTV, comparisonsTV, crossRefsTV, aboutGodTV, spiritualResourcesTV, correctsTV,  takeawaysTV, applicationTV]
        let allNotesHeadings = ["Context\n", "\n\nGeneral observations\n", "\n\nKey terms\n", "\n\nDifficulties\n", "\n\nUnexpected\n", "\n\nComparisons/contrasts\n", "\n\nCross References\n","\n\nWhat this tells us about God\n","\n\nSpiritual Resources\n","\n\nCorrects conduct or error\n","\n\nTakeaways\n", "\n\nApplication\n"]
        let zipTextViewsHeadings = zip(allTextViews, allNotesHeadings)
        for pair in zipTextViewsHeadings {
            if let x = pair.0.attributedText {
                allNotes = allNotes + NSAttributedString(string: pair.1, attributes: attrs)
                allNotes = allNotes + x
            }
        }
    }
    
}


func + (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString
{
    let result = NSMutableAttributedString()
    result.append(left)
    result.append(right)
    return result
}
