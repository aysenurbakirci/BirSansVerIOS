//
//  IlanBilgileriViewController.swift
//  BirSansVerIOS
//
//  Created by Ayşe Nur Bakırcı on 9.01.2021.
//

import UIKit

class IlanBilgileriViewController: UIViewController {

    @IBOutlet weak var ilanAdSoyad: UITextField!
    @IBOutlet weak var ilanTelefon: UITextField!
    @IBOutlet weak var ilanIl: UITextField!
    @IBOutlet weak var ilanHastane: UITextField!
    @IBOutlet weak var ilanTipi: UITextField!
    @IBOutlet weak var ilanBilgisi: UITextField!
    @IBOutlet weak var btnAra: UIButton!
    @IBOutlet weak var btnKonum: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnAra.layer.cornerRadius = 8
        btnKonum.layer.cornerRadius = 8
        
    }
    @IBAction func clickKisiyiAra(_ sender: Any) {
    }
    
    @IBAction func clickKonumuGor(_ sender: Any) {
    }
    
}
