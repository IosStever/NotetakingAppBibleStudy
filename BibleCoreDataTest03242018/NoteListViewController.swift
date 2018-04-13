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

    

    @IBOutlet weak var titlesTableView: UITableView!
    
    var controller: NSFetchedResultsController<Note>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlesTableView.delegate = self
        titlesTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        attemptFetch()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesSegue", for: indexPath) as! TitleCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
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
        if let objs = controller.fetchedObjects, objs.count > 0 { //Before you could write "where" instead of the comma
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
    
    func attemptFetch() {
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        let refSort = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [refSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller
        
        do {
            
            try controller.performFetch()
            
        } catch {
            
            let error = error as NSError
            print("\(error)")
            
        }
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
