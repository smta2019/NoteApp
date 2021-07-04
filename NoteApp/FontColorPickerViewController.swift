//
//  fontPickerViewController.swift
//  NoteApp
//
//  Created by stma2019 on 2021/07/04.
//

import UIKit

class FontColorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var fontColorPicker: UIPickerView!
    
    let fontColorList = ["黒", "赤", "オレンジ", "むらさき", "緑", "青", "グレー"]
    var selectedFont = ""
    var titleTextField: UITextField!
    var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fontColorPicker.delegate = self
        fontColorPicker.dataSource = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontColorList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontColorList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 処理
        selectedFont = fontColorList[row]
        print(" \(fontColorList[row]) が選択された。")
        
    }
    
    @IBAction func changeColorButton(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
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
