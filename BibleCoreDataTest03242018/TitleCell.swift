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
        sectionsCompleted.text = "You have completed \(note.sectionsCompleted) out of 12 categories."
        
    }
}
