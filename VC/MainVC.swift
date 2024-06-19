//
//  MainVC.swift
//  createRead
//
//  Created by Macbook on 02/03/22.
//

import UIKit
import Realm
import RealmSwift


class MainVC: UIViewController {
    
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var tableVieww: UITableView!{
        didSet{
            tableVieww.delegate = self
            tableVieww.dataSource = self
            tableVieww.register(UINib(nibName: "FirstTVC", bundle: nil), forCellReuseIdentifier: "FirstTVC")
        }
    }

    var tasks: [TaskDM] = []
    var realm: Realm!
    var id: Int = 0
 
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLbl.text = UserDefaults.standard.string(forKey: "name")
        
        realm = try! Realm()
        self.fetchRealm()
        print(realm.configuration.fileURL as Any)
        id = 01
    
    }


  
    @IBAction func addTapped(_ sender: Any) {
        addAlert()

    }
//    
//    func leftAdd(controller: UIViewController){
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromLeft
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        view.window!.layer.add(transition, forKey: kCATransition)
//       pushViewController(controller, animated: false)
//    }
//    
//    
    
    @IBAction func nextTapped(_ sender: Any) {
    
        let vc = SortFiltrVC.init(nibName: "SortFiltrVC", bundle: nil)
//        leftAdd(controller: vc)
        vc.modalPresentationStyle = .fullScreen
        vc.tasks = tasks
        self.present(vc, animated: true, completion: nil)
    }
    
    
    func addRealm(task: TaskDM) {
      try!  self.realm.write {
          self.realm.add(task)
        }
    }
    
    
    func fetchRealm(){
        self.tasks = realm.objects(TaskDM.self).compactMap{$0}.sorted(by: { one, two in
            return one.title! < two.title!
        })
        self.tableVieww.reloadData()
    }
    
    func delete(index: IndexPath){
        try! realm.write {
            realm.delete(tasks[index.row])
            self.tasks.remove(at: index.row)
            self.tableVieww.reloadData()
        }
    }
    
    func updateTask(task: TaskDM) {
        try! realm.write({
            self.realm.add(task, update: .modified)
            fetchRealm()
        })
    }
}

// Mark: - mainVC tableview delegate datasourse

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in UIMenu?.self
            
            let delate = UIAction(title: "delate", image: UIImage(systemName: "trash"), identifier: nil) { [self] _ in
                self.delete(index: indexPath)
            }
            
            
            let hause = UIAction(title: "edit", image: UIImage(systemName: "house"), identifier: nil) { _ in
              print(" ")
               
            }
            let menu = UIMenu(title: "buttons",  children: [delate, hause])
            
            return menu
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableVieww.dequeueReusableCell(withIdentifier: "FirstTVC", for: indexPath) as? FirstTVC else {return UITableViewCell() }
        
        cell.updateCell(task: tasks[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WebViewVC.init(nibName: "WebViewVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
}


extension MainVC {
    
    func addAlert(){
        id += 1
 
        let alertVC = UIAlertController(title: "Add Task", message: "Task kiriting!", preferredStyle: .alert)
        alertVC.addTextField { tf in
            tf.placeholder = "title"
        }
        
        alertVC.addTextField { tf in
            tf.placeholder = "description"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .destructive) { _ in
            let title1 = alertVC.textFields![0].text
            let desc2 = alertVC.textFields![1].text
            
            let task = TaskDM()
            task.title = title1
            task.desc = desc2
            task._id = "\(self.id)"
            
            self.tasks.append(task)
            self.addRealm(task: task)
          
            self.tableVieww.reloadData()
            
        }
        let addupdate = UIAlertAction(title: "Update", style: .cancel) { [self] _ in
            
            let title1 = alertVC.textFields![0].text
            let desc2 = alertVC.textFields![1].text
            
            let taskkk = TaskDM()
            taskkk.title = title1
            taskkk.desc = desc2
            taskkk._id = "\(self.id)"
            updateTask(task: taskkk)
    
            self.addRealm(task: taskkk)
            self.tableVieww.reloadData()
        }
        alertVC.addAction(addAction)
        alertVC.addAction(addupdate)
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
}
