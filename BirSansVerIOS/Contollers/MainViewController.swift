//
//  MainViewController.swift
//  BirSansVerIOS
//
//  Created by Ayşe Nur Bakırcı on 8.01.2021.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    @IBOutlet weak var kanIlanGoruntule: UIButton!
    @IBOutlet weak var ilacIlanGoruntule: UIButton!
    @IBOutlet weak var ilikIlanGoruntule: UIButton!
    @IBOutlet weak var malzemeIlanGoruntule: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func ClickKanIlanlari(_ sender: Any) {
        classIlanTipi.ilanTipi.ilan = "Kan İlanı"
        self.performSegue(withIdentifier: "AnaEkrantoIlanlar", sender: nil)
    }
    
    @IBAction func clickIlacIlanlari(_ sender: Any) {
        classIlanTipi.ilanTipi.ilan = "İlaç İlanı"
        self.performSegue(withIdentifier: "AnaEkrantoIlanlar", sender: nil)
    }
    
    @IBAction func clickIlıkIlanlari(_ sender: Any) {
        classIlanTipi.ilanTipi.ilan = "İlik İlanı"
        self.performSegue(withIdentifier: "AnaEkrantoIlanlar", sender: nil)
    }
    
    @IBAction func clickMalzemeIlanlari(_ sender: Any) {
        classIlanTipi.ilanTipi.ilan = "Malzeme İlanı"
        self.performSegue(withIdentifier: "AnaEkrantoIlanlar", sender: nil)
    }
    
    @IBAction func clickBtnCikis(_ sender: Any) {

        let cikisalert = UIAlertController(title: "ÇIKIŞ", message: "Çıkış yapmak istediğinize emin misiniz?", preferredStyle: UIAlertController.Style.alert)
        let okButonu = UIAlertAction(title: "Vazgeç", style: UIAlertAction.Style.default, handler: nil)
        let cikisButonu = UIAlertAction(title: "Çıkış", style: UIAlertAction.Style.cancel) { (UIAlertAction) in
            do {
                try Auth.auth().signOut()
                self.performSegue(withIdentifier: "AnaEkrantoUygGirisEkrani", sender: nil)
            } catch {
                
            }
        }
        cikisalert.addAction(okButonu)
        cikisalert.addAction(cikisButonu)
        self.present(cikisalert, animated: true, completion: nil)
    }
    
    @IBAction func clickIlanPaylsa(_ sender: Any) {
    }
    @IBAction func clickIlanlarim(_ sender: Any) {
    }
    
}
