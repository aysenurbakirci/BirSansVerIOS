//
//  SignInViewController.swift
//  BirSansVerIOS
//
//  Created by Ayşe Nur Bakırcı on 8.01.2021.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var girisEposta: UITextField!
    @IBOutlet weak var girisSifre: UITextField!
    @IBOutlet weak var btnGiris: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnGiris.layer.cornerRadius = 8
        girisSifre.isSecureTextEntry = true
    }

    @IBAction func clickGiris(_ sender: Any) {
        
        if girisEposta.text != "" && girisSifre.text != ""{
            
            Auth.auth().signIn(withEmail: girisEposta.text!, password: girisSifre.text!) { (authdata, error) in
                if error != nil{
                    self.AlertOlustur(title: "HATA", message: "Kullanıcı bilgileri bulunamadı.")
                    
                }else{
                    self.performSegue(withIdentifier: "GirisYaptoUygulamaEkran", sender: nil)
                }
            }
            
        }else{
            self.AlertOlustur(title: "HATA", message: "Boş alan bıraktınız. Lütfen tüm alanların dolu olduğundan emin olun.")
        }
    }
    
    func AlertOlustur(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButonu = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButonu)
        self.present(alert, animated: true, completion: nil)
    }
}
