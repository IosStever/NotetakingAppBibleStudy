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
    
    var noteToEdit: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollHeight : CGFloat = 2500
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
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        if noteToEdit != nil {
            loadNoteData()
        }
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        print(noteTitleName.text ?? "null")
        var note: Note!
        
        if noteTitleName.text == "" {
            let alert = UIAlertController(title: "Alert!", message: "Please enter title", preferredStyle: .actionSheet)
            let popover = alert.popoverPresentationController
            popover?.sourceView = view
            popover?.sourceRect = CGRect(x: 32, y: 32, width: 64, height: 64)
            present(alert, animated: true)
            
        } else {
            if noteToEdit == nil {
                note = Note(context: context)
            } else {
                note = noteToEdit
            }
            
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
                note.contrast = crossRefs
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
            
//            else {
//                note.context = nil
//            }
            
            ad.saveContext()
            _ = navigationController?.popViewController(animated: true)

        }
    }
    
    func loadNoteData() {
        if let note = noteToEdit {
            
            noteTitleName.text = note.passage
            
            if let context = note.context {
                contextTV.attributedText = context as! NSAttributedString
            }
            if let observations = note.observations {
                genObsTV.attributedText = observations as! NSAttributedString
            }
            if let keyTerms = note.keyTerms
            {keyTermsTV.attributedText = keyTerms as! NSAttributedString
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
            
            
        }
        
    }
    

 

}
