//
//  NotesViewController.swift
//  BibleCoreDataTest03242018
//
//  Created by Steven Robertson on 4/12/18.
//  Copyright © 2018 Steven Robertson. All rights reserved.
//

import UIKit
import CoreData

class NotesViewController: UIViewController {
    @IBOutlet weak var myScrollView: UIScrollView!
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
    
    //var note: Note!
    var noteToEdit: Note?
    var categoriesCompleted = 0
    var newNoteDefaultTitle = ""
    var allNotes = NSAttributedString()
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollHeight : CGFloat = 2500
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView(gesture:)))
        view.addGestureRecognizer(tapGesture)
        myScrollView.contentSize.height = scrollHeight
        contextTV.allowsEditingTextAttributes=true
        genObsTV.allowsEditingTextAttributes=true
        keyTermsTV.allowsEditingTextAttributes=true
        difficultiesTV.allowsEditingTextAttributes=true
        unexpectedTV.allowsEditingTextAttributes=true
        comparisonsTV.allowsEditingTextAttributes=true
        crossRefsTV.allowsEditingTextAttributes=true
        aboutGodTV.allowsEditingTextAttributes=true
        spiritualResourcesTV.allowsEditingTextAttributes=true
        correctsTV.allowsEditingTextAttributes=true
        takeawaysTV.allowsEditingTextAttributes=true
        applicationTV.allowsEditingTextAttributes=true
        
        contextTV.layer.borderWidth = 1
        contextTV.layer.borderColor = UIColor.blue.cgColor
        genObsTV.layer.borderWidth = 1
        genObsTV.layer.borderColor = UIColor.black.cgColor
        keyTermsTV.layer.borderWidth = 1
        keyTermsTV.layer.borderColor = UIColor.blue.cgColor
        difficultiesTV.layer.borderWidth = 1
        difficultiesTV.layer.borderColor = UIColor.black.cgColor
        unexpectedTV.layer.borderWidth = 1
        unexpectedTV.layer.borderColor = UIColor.blue.cgColor
        comparisonsTV.layer.borderWidth = 1
        comparisonsTV.layer.borderColor = UIColor.black.cgColor
        crossRefsTV.layer.borderWidth = 1
        crossRefsTV.layer.borderColor = UIColor.blue.cgColor
        aboutGodTV.layer.borderWidth = 1
        aboutGodTV.layer.borderColor = UIColor.black.cgColor
        spiritualResourcesTV.layer.borderWidth = 1
        spiritualResourcesTV.layer.borderColor = UIColor.blue.cgColor
        correctsTV.layer.borderWidth = 1
        correctsTV.layer.borderColor = UIColor.black.cgColor
        takeawaysTV.layer.borderWidth = 1
        takeawaysTV.layer.borderColor = UIColor.blue.cgColor
        applicationTV.layer.borderWidth = 1
        applicationTV.layer.borderColor = UIColor.black.cgColor
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: Notification.Name.UIApplicationWillResignActive, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)

        let delete = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deletePressed))
        let viewAll = UIBarButtonItem(title: "Preview", style: .plain, target: self, action: #selector(allNotesPressed))
        navigationItem.rightBarButtonItems = [delete, viewAll]
        
        let back = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backPressed))
        let save = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonPressed))
        navigationItem.leftBarButtonItems = [back, save]
        
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backPressed))
        
        if noteToEdit != nil {
            loadNoteData()
        }
    }


    
    
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            myScrollView.contentInset.bottom = keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        myScrollView.contentInset.bottom = 0
    }
    
    @objc func didTapView(gesture: UITapGestureRecognizer) {
        // This should hide keyboard for the view.
        view.endEditing(true)
    }
    
    @objc func appMovedToBackground() {
    saveData()
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
    
    fileprivate func saveData() {
        var note: Note!
        note = noteToEdit
//        if noteToEdit == nil {
//            note = Note(context: context)
//        } else {
//            note = noteToEdit
//        }
        
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
        //print(today)
        
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
    
    func fetchRecord() -> [Note] {
        
        do {
            notes = try context.fetch(Note.fetchRequest())
            
        } catch {
            print("Error fetching data from CoreData")
        }
        return notes
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
    
    func allNotesTogether() {
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)]
        //        var boldString = NSMutableAttributedString(string: boldText, attributes:attrs)
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
    
    func loadNoteData() {
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
    
    
    @IBAction func deletePressed(_ sender: Any) {
        if noteToEdit != nil {
            context.delete(noteToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        if noteToEdit != nil || noteTitleName != nil {
            saveData()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func allNotesPressed(_ sender: Any) {
        //if noteToEdit != nil || noteTitleName != nil {
        allNotesTogether()
        let myVC = storyboard?.instantiateViewController(withIdentifier: "allNotesStoryboardID") as! AllNotesVC
        myVC.allNotesVar = allNotes
        if let thisVCtitletext = noteToEdit?.passage {
            myVC.titleText = thisVCtitletext
        }
        navigationController?.pushViewController(myVC, animated: true)
    }
    
}

func + (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString
{
    let result = NSMutableAttributedString()
    result.append(left)
    result.append(right)
    return result
}
