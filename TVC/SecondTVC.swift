//
//  SecondTVC.swift
//  createRead
//
//  Created by Macbook on 02/03/22.
//

import UIKit

class SecondTVC: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.borderColor = UIColor.black.cgColor
        backView.layer.borderWidth = 1
        backView.layer.cornerRadius = 15

    }

    func updateCell(task: TaskDM) {
        titleLbl.text = task.title
        descriptionLbl.text = task.desc
    }
    
}
