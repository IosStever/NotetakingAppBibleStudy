//
//  AllNotesVC.swift
//  BibleCoreDataTest03242018
//
//  Created by Steven Robertson on 4/15/18.
//  Copyright © 2018 Steven Robertson. All rights reserved.
//

import UIKit

class AllNotesVC: UIViewController {

    @IBOutlet weak var allNotesSV: UIScrollView!
    @IBOutlet weak var allNotesTV: UITextView!
    
    @IBOutlet weak var titleOfNotes: UILabel!
    var titleText = ""
    var allNotesVar = NSAttributedString(string: "Oops")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollHeight : CGFloat = 2000
        allNotesSV.contentSize.height = scrollHeight
        allNotesTV.allowsEditingTextAttributes=true
        titleOfNotes.text = titleText
        allNotesTV.attributedText = allNotesVar
        //allNotesTV.attributedText = NSAttributedString(string: "Hey")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
