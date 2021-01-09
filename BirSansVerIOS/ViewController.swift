//
//  ViewController.swift
//  BirSansVerIOS
//
//  Created by Ayşe Nur Bakırcı on 8.01.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var girisYap: UIButton!
    @IBOutlet weak var kayitOl: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        girisYap.layer.cornerRadius = 8
        kayitOl.layer.cornerRadius = 8
    }

    @IBAction func clickSifremiUnuttum(_ sender: Any) {
        
        let sifremiUnuttumdAlert = UIAlertController(title: "ŞİFRE GÜNCELLEME", message: "E-Posta:", preferredStyle: .alert)
        sifremiUnuttumdAlert.addTextField { (textField) in
            textField.placeholder = "E-posta bilginizi giriniz."
        }
        sifremiUnuttumdAlert.addAction(UIAlertAction(title: "Vazgeç", style: .cancel, handler: nil))
        sifremiUnuttumdAlert.addAction(UIAlertAction(title: "Link Gönder", style: .default, handler: { (action) in
            let resetMailGonder = sifremiUnuttumdAlert.textFields?.first?.text
            Auth.auth().sendPasswordReset(withEmail: resetMailGonder!, completion: { (error) in
                if error != nil{
                    let resetFailedAlert = UIAlertController(title: "HATA", message: "Hata: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                    resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(resetFailedAlert, animated: true, completion: nil)
                }else {
                    let resetEmailSentAlert = UIAlertController(title: "BAŞARILI", message: "Şifre sıfırlama linki mail adresinize gönderilmiştir.", preferredStyle: .alert)
                    resetEmailSentAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(resetEmailSentAlert, animated: true, completion: nil)
                }
            })
        }))
        self.present(sifremiUnuttumdAlert, animated: true, completion: nil)
        
    }
    @IBAction func clickNasilKullanilir(_ sender: Any) {
        
        let alert = UIAlertController(title: "Nasıl Kullanılır?", message: "Uygulama hastanede bulunan kan, ilik, ilaç ve malzeme gibi ihtiyaçları bulunan hastaların bu ihtiyaçlarını kolayca insanlara duyurabilmesini sağlar. Bu uygulama sayesinde hastanede bulunan insanlar istedikleri kategoriyi belirterek bunu sağlayabilecek insanların kendileriyle iletişime geçmesini sağlar. Karışıklık olmaması için tüm ilanlar paylaşıldıktan 1 hafta sonra silinmektedir.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

