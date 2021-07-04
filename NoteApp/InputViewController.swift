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
    @IBOutlet weak var fontSmallButton: UIButton!
    @IBOutlet weak var fontBigButton: UIButton!
    @IBOutlet weak var fontColorButton: UIButton!
    @IBOutlet weak var fontCountButton: UIButton!
    
    
    let realm = try! Realm()
    var note: Note!
    var fontSize: CGFloat = 0.0
    var font:String = ""
    var fontAlertController: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        print(font)
        titleTextField.text = note.title
        contentTextView.layer.borderColor = UIColor.red.cgColor
        contentTextView.text = note.contents
        fontSmallButton.tintColor = UIColor.blue
        fontBigButton.tintColor = UIColor.blue
        fontColorButton.tintColor = UIColor.blue
        fontCountButton.tintColor = UIColor.blue
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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

    
    @IBAction func fontSmall(_ sender: Any) {
        fontSize = contentTextView.font!.pointSize
        print("フォントサイズ：\(fontSize)")
        if fontSize <= 8.0 {
            fontSmallButton.tintColor = UIColor.gray
        } else if fontSize == 24.0 {
            fontBigButton.tintColor = UIColor.blue
            contentTextView.font = UIFont.systemFont(ofSize: fontSize - 1.0)
        } else {
            fontSmallButton.tintColor = UIColor.blue
            contentTextView.font = UIFont.systemFont(ofSize: fontSize - 1.0)
        }
        
    }
    @IBAction func fontBig(_ sender: Any) {
        fontSize = contentTextView.font!.pointSize
        print("フォントサイズ：\(fontSize)")
        if fontSize >= 24.0 {
            fontBigButton.tintColor = UIColor.gray
        } else if fontSize == 8.0 {
            fontSmallButton.tintColor = UIColor.blue
            contentTextView.font = UIFont.systemFont(ofSize: fontSize + 1.0)
        } else {
            fontBigButton.tintColor = UIColor.blue
            contentTextView.font = UIFont.systemFont(ofSize: fontSize + 1.0)
        }
    }
    
    @IBAction func fontColor(_ sender: Any) {
        contentTextView.textColor = UIColor.red
    }
    
    @IBAction func fontCount(_ sender: Any) {
        fontCounter(title: "文字数", message: "\(contentTextView.text.count)です。")
    }
    
    func fontCounter(title:String, message:String) {
        fontAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        fontAlertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(fontAlertController, animated: true)
    }
    

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
        let fontColor = segue.source as! FontColorViewController  // <- 遷移先を取得する
        self.font = fontColor.selectedFont
        print("PRINT_DEBUG: \(font)")
        switch font {
        case "黒":
            contentTextView.textColor = UIColor.black
        case "赤":
            contentTextView.textColor = UIColor.red
        case "オレンジ":
            contentTextView.textColor = UIColor.orange
        case  "むらさき":
            contentTextView.textColor = UIColor.purple
        case  "緑":
            contentTextView.textColor = UIColor.green
        case  "青":
            contentTextView.textColor = UIColor.blue
        case  "グレー":
            contentTextView.textColor = UIColor.gray
        default:
            contentTextView.textColor = UIColor.black
        }
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
