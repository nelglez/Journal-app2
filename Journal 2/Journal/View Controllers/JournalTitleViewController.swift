//
//  JournalTitleViewController.swift
//  Journal
//
//  Created by Nelson Gonzalez on 4/3/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class JournalTitleViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    
    var postController: PostController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

   
    @IBAction func saveBarButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let title = titleTextField.text, !title.isEmpty else {return}
        
        postController?.createEntry(with: title)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
