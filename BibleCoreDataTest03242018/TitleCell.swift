//
//  TitleCell.swift
//  BibleCoreDataTest03242018
//
//  Created by Steven Robertson on 4/13/18.
//  Copyright © 2018 Steven Robertson. All rights reserved.
//

import UIKit
import CoreData

class TitleCell: UITableViewCell {

    @IBOutlet weak var noteTitle: UILabel!
    @IBOutlet weak var sectionsCompleted: UILabel!
    @IBOutlet weak var lastUpdateDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(note: Note){
        noteTitle.text = note.passage
        sectionsCompleted.text = "\(note.sectionsCompleted) out of 12"
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        
        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "en_US")
        //print(dateFormatter.string(from: note.lastUpdateDate!)) // Jan 2, 2001
        if let dateString = note.lastUpdateDate  {
            lastUpdateDate.text = dateFormatter.string(from: dateString)
        } else {
            let today = Date()
            lastUpdateDate.text = dateFormatter.string(from: today)
        }
    }
    
}
