//
//  InputViewController.swift
//  NoteApp
//
//  Created by stma2019 on 2021/07/01.
//

import UIKit
import RealmSwift
import TTTAttributedLabel

class InputViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    let realm = try! Realm()
    var note: Note!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        titleTextField.text = note.title
        contentTextView.text = note.contents
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write {
            if self.titleTextField.text == "" {
                self.note.title = "タイトルなし"
            } else {
                self.note.title = self.titleTextField.text!
            }
            self.note.contents = self.contentTextView.text!
            self.note.date = Date()
            self.realm.add(self.note, update: .modified)
        }
        
        super.viewWillDisappear(animated)
    }
    
    @IBAction func verticalButton(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let displayViewController:DisplayViewController = segue.destination as! DisplayViewController
        
        if segue.identifier == "displaySegue" {
            displayViewController.dTitle  = self.titleTextField!.text
            displayViewController.dContent = self.contentTextView.text
        }
    }
    
    @IBAction func horizontalButton(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
