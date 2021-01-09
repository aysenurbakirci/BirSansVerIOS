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

    var ilanTipi : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func ClickKanIlanlari(_ sender: Any) {
        self.performSegue(withIdentifier: "AnaEkrantoIlanlar", sender: nil)
        ilanTipi = "Kan İlanı"
    }
    
    @IBAction func clickIlacIlanlari(_ sender: Any) {
        self.performSegue(withIdentifier: "AnaEkrantoIlanlar", sender: nil)
        ilanTipi = "İlaç İlanı"
    }
    
    @IBAction func clickIlıkIlanlari(_ sender: Any) {
        self.performSegue(withIdentifier: "AnaEkrantoIlanlar", sender: nil)
        ilanTipi = "İlik İlanı"
    }
    
    @IBAction func clickMalzemeIlanlari(_ sender: Any) {
        self.performSegue(withIdentifier: "AnaEkrantoIlanlar", sender: nil)
        ilanTipi = "Malzeme İlanı"
    }
    
    @IBAction func clickBtnCikis(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "AnaEkrantoUygGirisEkrani", sender: nil)
        } catch {
            
        }
    }
    
    @IBAction func clickIlanPaylsa(_ sender: Any) {
    }
    @IBAction func clickIlanlarim(_ sender: Any) {
    }
    
}
