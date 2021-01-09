//
//  IlanlarViewController.swift
//  BirSansVerIOS
//
//  Created by Ayşe Nur Bakırcı on 8.01.2021.
//

import UIKit

class IlanlarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var ilSecimi: UITextField!
    @IBOutlet weak var tblIlanlar: UITableView!
    @IBOutlet weak var btnAra: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblIlanlar.delegate = self
        tblIlanlar.dataSource = self
        btnAra.layer.cornerRadius = 8
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tblIlanlar.register(UINib(nibName: "DesignTableViewCell", bundle: nil), forCellReuseIdentifier: "DesignTableViewCell")
        let cellIcerik = tblIlanlar.dequeueReusableCell(withIdentifier: "DesignTableViewCell") as! DesignTableViewCell
        
        cellIcerik.ilanHastaneBilgsi.text = "Kaş Devlet Hastanesi"
        cellIcerik.ilanKategoriBilgisi.text = "Arh+"
        cellIcerik.ilanTarihBilgisi.text = "12.12.2020"
        
        return cellIcerik
    }

}
