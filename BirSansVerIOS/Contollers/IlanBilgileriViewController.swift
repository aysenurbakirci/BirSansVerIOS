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
    
    let ilanBilgileriClass = classIlanAyrinti.ilanAyrintilari
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnAra.layer.cornerRadius = 8
        btnKonum.layer.cornerRadius = 8
        
        ilanAdSoyad.text = ilanBilgileriClass.adsoyad
        ilanTelefon.text = ilanBilgileriClass.telefon
        ilanIl.text = ilanBilgileriClass.il
        ilanHastane.text = ilanBilgileriClass.hastane
        ilanTipi.text = ilanBilgileriClass.ilantipi
        ilanBilgisi.text = ilanBilgileriClass.ilanbilgileri
        
        ilanAdSoyad.isEnabled = false
        ilanTelefon.isEnabled = false
        ilanIl.isEnabled = false
        ilanHastane.isEnabled = false
        ilanTipi.isEnabled = false
        ilanBilgisi.isEnabled = false

    }
    @IBAction func clickKisiyiAra(_ sender: Any) {
        if let url = URL(string: "tel://\(ilanTelefon.text!)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @IBAction func clickKonumuGor(_ sender: Any) {
        
        if (UIApplication.shared.canOpenURL(NSURL(string:"http://maps.apple.com")! as URL)) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(NSURL(string:"http://maps.apple.com/?daddr=kas+devlet+hastanesi")! as URL)
            } else {
                UIApplication.shared.openURL(NSURL(string:"http://maps.apple.com/?daddr=kas+devlet+hastanesi")! as URL)
            }
        }else {
          NSLog("Haritalar kullanılmamaktadır.");
        }
    }
}
