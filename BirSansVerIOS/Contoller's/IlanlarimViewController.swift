//
//  IlanlarimViewController.swift
//  BirSansVerIOS
//
//  Created by Ayşe Nur Bakırcı on 8.01.2021.
//

import UIKit

class IlanlarimViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tblIlanlarim: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblIlanlarim.delegate = self
        tblIlanlarim.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tblIlanlarim.register(UINib(nibName: "DesignTableViewCell", bundle: nil), forCellReuseIdentifier: "DesignTableViewCell")
        let cellIcerik = tblIlanlarim.dequeueReusableCell(withIdentifier: "DesignTableViewCell") as! DesignTableViewCell
        
        cellIcerik.ilanHastaneBilgsi.text = "Kaş Devlet Hastanesi"
        cellIcerik.ilanKategoriBilgisi.text = "Arh+"
        cellIcerik.ilanTarihBilgisi.text = "12.12.2020"
        
        return cellIcerik
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

}
