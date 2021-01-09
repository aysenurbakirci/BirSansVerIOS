//
//  SignUpViewController.swift
//  BirSansVerIOS
//
//  Created by Ayşe Nur Bakırcı on 8.01.2021.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var kayitEposta: UITextField!
    @IBOutlet weak var kayitSifre: UITextField!
    @IBOutlet weak var kayitSifreTekrar: UITextField!
    @IBOutlet weak var btnkayit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnkayit.layer.cornerRadius = 8
        kayitSifre.isSecureTextEntry = true
        kayitSifreTekrar.isSecureTextEntry = true
        
    }
    
    @IBAction func clickKayit(_ sender: Any) {
        
        if VeriGirisKontrol() == true{
            Auth.auth().createUser(withEmail: kayitEposta.text!, password: kayitSifre.text!) { (authdata, error) in
                if error != nil{
                    self.AlertOlustur(title: "HATA", message: "Sistem kaynaklı hata oluşmuştur. Daha önce sisteme girilmiş bir e-posta adresi kullanıyor olabilirsiniz. Lütfen kontrol ederek işleminize devam ediniz.")
                }
                else{
                    self.AlertOlustur(title: "KAYIT BAŞARILI", message: "Giriş ekranından bilgilerinizle beraber giriş yapabilirsiniz.")
                }
            }
        }
    }
    
    func VeriGirisKontrol() -> Bool{
        
        if kayitEposta.text == ""{
            AlertOlustur(title: "HATA", message: "Boş alan bırakılmıştır. Lütfen tüm alanları doldurunuz.")
            return false
        }else if kayitSifre.text == ""{
            AlertOlustur(title: "HATA", message: "Boş alan bırakılmıştır. Lütfen tüm alanları doldurunuz.")
            return false
        }else if kayitSifreTekrar.text == ""{
            AlertOlustur(title: "HATA", message: "Boş alan bırakılmıştır. Lütfen tüm alanları doldurunuz.")
            return false
        }else if kayitSifre.text != kayitSifreTekrar.text{
            AlertOlustur(title: "HATA", message: "Şifreleriniz uyuşmamaktadır. Lütfen kontrol ediniz.")
            return false
        }else{
            return true
        }

    }
    
    func AlertOlustur(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButonu = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButonu)
        self.present(alert, animated: true, completion: nil)
    }

}
