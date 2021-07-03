//
//  DisplayViewController.swift
//  NoteApp
//
//  Created by stma2019 on 2021/07/01.
//

import UIKit
import TTTAttributedLabel

class DisplayViewController: UIViewController {

    @IBOutlet weak var titleTextLabel: UILabel!
    
    let stringAttributes: [NSAttributedString.Key : Any] = [.font : UIFont.systemFont(ofSize: 14.0)]
    var dTitle: String!
    var dContent: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let width = Int(view.frame.size.width) - 20
        let height = Int(view.frame.size.height) - 180
        
        let scrollView = UIScrollView(frame: CGRect(x: 10, y: 150, width: width, height: height))
        self.view.addSubview(scrollView)
        
        let myLabel: TTTAttributedLabel = TTTAttributedLabel(frame: CGRect(x: 10, y: 150, width: width, height: height))
        view.addSubview(myLabel)
        myLabel.textColor = UIColor.black
        myLabel.backgroundColor = UIColor.systemPink
        myLabel.numberOfLines = 0
        myLabel.font = UIFont.systemFont(ofSize: 20)
        myLabel.verticalAlignment = .top
        
        
        let angle = (Double.pi)/2

        myLabel.transform = CGAffineTransform(rotationAngle: CGFloat(angle))


        myLabel.setText(dContent) { (mutableAttributedString) -> NSMutableAttributedString? in
            mutableAttributedString?.addAttribute(NSAttributedString.Key(rawValue: kCTVerticalFormsAttributeName as String), value: true, range: NSMakeRange(0,mutableAttributedString!.length))
            return mutableAttributedString
        }
        myLabel.frame = CGRect(x: 10, y: 150, width: width, height: height)
        
        self.view.addSubview(myLabel)
        
//        contentTextLabel.setText(dContent)
        
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
