//
//  FirstTVC.swift
//  createRead
//
//  Created by Macbook on 02/03/22.
//

import UIKit

class FirstTVC: UITableViewCell {

    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.borderWidth = 1
        backView.layer.borderColor = UIColor.black.cgColor
        backView.layer.cornerRadius = 12

    }
    
    func updateCell(task: TaskDM){
        titleLbl.text = task.title
        descLbl.text = task.desc
    }
    

}
