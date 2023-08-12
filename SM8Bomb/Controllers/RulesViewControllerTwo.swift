//
//  RulesViewControllerTwo.swift
//  SM8Bomb
//
//  Created by admin on 11/08/2023.
//

import UIKit

class RulesViewControllerTwo: UIViewController {

    @IBOutlet var labelSevenRow: UILabel!
    @IBOutlet var buttonHelp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar("Помощь")
        navigationController?.navigationBar.barTintColor = UIColor.yellowText
        view.setGradientColor()
        let labelText = labelSevenRow.text!
        
        let attributedText = NSMutableAttributedString(string: labelText)
        
        let purpleRange = (labelText as NSString).range(of: "“С Заданиями”")
        
        attributedText.addAttributes([.foregroundColor: UIColor.violetText,
                                      .font:UIFont.systemFont(ofSize: 17, weight: .heavy)],
                                     range: purpleRange)
        
        labelSevenRow.attributedText = attributedText
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
