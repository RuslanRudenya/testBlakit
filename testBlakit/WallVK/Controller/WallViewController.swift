//
//  ViewController.swift
//  testBlakit
//
//  Created by Руслан on 27.11.2017.
//  Copyright © 2017 Руслан. All rights reserved.
//

import UIKit



class WallViewController: UIViewController  {
    
    
    @IBOutlet weak var showButtonWeak: UIButton!
    @IBOutlet weak var iconGroup: UIImageView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var domainTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        tableview.estimatedRowHeight = 74
        tableview.rowHeight = UITableViewAutomaticDimension
        
        showButtonWeak.layer.cornerRadius = 10
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func showWallButton(_ sender: UIButton) {
        domain = String(describing: domainTextField.text ?? "")
        WallNetworkServise.getWall { (response) in
            arrayWallGetData = response.wallData.response.items
            let imgURL = NSURL(string: response.wallData.response.groups[0].photo_50)
            if imgURL != nil {
                let data = NSData(contentsOf: (imgURL as URL?)!)
                self.iconGroup.image = UIImage(data: data! as Data)
            }
            self.tableview.reloadData()
        }
    }
    
}
    

extension WallViewController: UITableViewDelegate {
    
}

extension WallViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayWallGetData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GetDataWallTCV
        cell.messageLbl.text = arrayWallGetData[indexPath.row].text
        cell.countLikeLbl.text = String(arrayWallGetData[indexPath.row].likes.count)
        cell.countRepostLbl.text = String(arrayWallGetData[indexPath.row].reposts.count)
        return cell
        
    }
}




