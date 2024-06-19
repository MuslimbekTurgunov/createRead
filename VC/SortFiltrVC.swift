//
//  SortFiltrVC.swift
//  createRead
//
//  Created by Macbook on 02/03/22.
//

import UIKit

class SortFiltrVC: UIViewController {

    @IBOutlet weak var searchBarr: UISearchBar!
    @IBOutlet weak var tableVieww: UITableView! {
        didSet{
            tableVieww.delegate = self
            tableVieww.dataSource = self
            searchBarr.delegate = self
            tableVieww.register(UINib(nibName: "SecondTVC", bundle: nil), forCellReuseIdentifier: "SecondTVC")
        }
    }
    
    var tasks: [TaskDM] = []
    var sorted: [TaskDM] = []
    var filtr: [TaskDM] = []
    var isFiltr: Bool = false
    var isSorted: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    


    @IBAction func sortTapped(_ sender: Any) {
        isSorted = !isSorted
        isFiltr = false
        sorted = tasks.sorted(by: { one, two in
            return one.desc! < two.desc!
        })
        self.tableVieww.reloadData()
    }
    
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}



extension SortFiltrVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltr == false {
            return tasks.count
        } else {
            return filtr.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableVieww.dequeueReusableCell(withIdentifier: "SecondTVC", for: indexPath) as? SecondTVC else {return UITableViewCell() }
        if isFiltr == false {
        cell.updateCell(task: tasks[indexPath.row])
        } else {
            cell.updateCell(task: filtr[indexPath.row])
        }
        return cell
    }
    
}


extension SortFiltrVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isFiltr = true
         let  text = self.searchBarr.text!
        self.filtr = self.tasks.filter({ one in
            return one.title!.lowercased().hasPrefix(text.lowercased())
        })
        self.tableVieww.reloadData()
    }
    
    }
