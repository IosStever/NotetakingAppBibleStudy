//
//  ViewController.swift
//  BibleCoreDataTest03242018
//
//  Created by Steven Robertson on 3/24/18.
//  Copyright © 2018 Steven Robertson. All rights reserved.
//

import UIKit
import CoreData

class NoteListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var titleBtn: UIButton!
    @IBOutlet weak var progressBtn: UIButton!
    @IBOutlet weak var lastUpdateBtn: UIButton!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var titlesTableView: UITableView!
    
    var controller: NSFetchedResultsController<Note>!
    //var nlvcTitle : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlesTableView.delegate = self
        titlesTableView.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

        attemptFetch(key: "lastUpdateDate", ascending: false)
    }
    
    
    @IBAction func titleBtnPrsd(_ sender: UIButton) {
        attemptFetch(key: "passage", ascending: true)
        }
    
    @IBAction func progressBtnPrsd(_ sender: UIButton) {
    attemptFetch(key: "sectionsCompleted", ascending: true)
    //titlesTableView.reloadData()
    }
    @IBAction func updateBtnPrsd(_ sender: UIButton) {
    attemptFetch(key: "lastUpdateDate", ascending: false)
    //titlesTableView.reloadData()
    }
    
    
    @objc func addTapped() {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Passage to study", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newNote = Note(context: self.context)
                newNote.passage = textField.text

            let today = Date()
            
            newNote.lastUpdateDate = today
            self.saveItems()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Note title"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems() {
        
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        
        attemptFetch(key: "lastUpdateDate", ascending: false)
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath) as! TitleCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor.white
        }
        else
        {
            cell.backgroundColor = UIColor.lightGray.withAlphaComponent(0.25)
        }
        return cell
    }
    override func viewDidAppear(_ animated: Bool) {
        titlesTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    //Two functions below were added to edit existing records
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objs = controller.fetchedObjects, objs.count > 0 {
            let note = objs[indexPath.row]
            performSegue(withIdentifier: "notesSegue", sender: note)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "notesSegue" {
            if let destination = segue.destination as? NotesViewController {
                if let note = sender as? Note {
                    destination.noteToEdit = note
                }
            }
        }
    }
    func configureCell (cell: TitleCell, indexPath: NSIndexPath) {
        let note = controller.object(at: indexPath as IndexPath)
        cell.configureCell(note: note)
        
    }
    
    func attemptFetch(key: String, ascending: Bool) {
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        if key == "lastUpdateDate" {
         let refSort = NSSortDescriptor(key: key, ascending: ascending)
            fetchRequest.sortDescriptors = [refSort]
        } else {
        let refSort = NSSortDescriptor(key: key, ascending: ascending, selector: #selector(NSString.caseInsensitiveCompare))
            fetchRequest.sortDescriptors = [refSort]
        }
        
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            
            let error = error as NSError
            print("\(error)")
        }
        titlesTableView.reloadData()

    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        titlesTableView.beginUpdates()
        //tableView.reloadData()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        titlesTableView.endUpdates()
    }
    
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


}

/*

 */
