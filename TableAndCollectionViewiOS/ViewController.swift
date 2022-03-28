//
//  ViewController.swift
//  TableAndCollectionViewiOS
//
//  Created by Leo Lopez on 27/3/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnOpenSecondVC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "MyFirstCell", bundle: nil), forCellReuseIdentifier: "myFirstCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func btnOpenSecondVCTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        
        present(vc!, animated: true)
    }
}

// MARK: -  UITableViewDelegate,UITableViewDataSource - iOS 12<
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myFirstCell", for: indexPath) as? MyFirstCell
        cell?.titleLabel.text = "\(indexPath)"
        
        return cell!
    }
}
