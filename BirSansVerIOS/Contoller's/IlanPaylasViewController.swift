//
//  IlanPaylasViewController.swift
//  BirSansVerIOS
//
//  Created by Ayşe Nur Bakırcı on 8.01.2021.
//

import UIKit
import Firebase

class IlanPaylasViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var paylasanAdSoyad: UITextField!
    @IBOutlet weak var paylasanTelefonNumarasi: UITextField!
    @IBOutlet weak var paylasilanIl: UITextField!
    @IBOutlet weak var paylasilanHastane: UITextField!
    @IBOutlet weak var rdKanIlan: UIButton!
    @IBOutlet weak var rdIlacIlan: UIButton!
    @IBOutlet weak var rdMalzemeIlan: UIButton!
    @IBOutlet weak var rdIlikIlan: UIButton!
    @IBOutlet weak var ilanBilgisi: UITextField!
    @IBOutlet weak var btnIlanPaylas: UIButton!
    
    var ilanTipi : String = ""
    
    let thePicker = UIPickerView()
    var ilanBilgileri = [String](arrayLiteral: "", "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnIlanPaylas.layer.cornerRadius = 8
        rdKanIlan.layer.cornerRadius = 6
        rdIlikIlan.layer.cornerRadius = 6
        rdIlacIlan.layer.cornerRadius = 6
        rdMalzemeIlan.layer.cornerRadius = 6
        
        thePicker.delegate = self
        ilanBilgisi.inputView = thePicker
        
        ilanBilgisi.isEnabled = false
    }
    
    @IBAction func btnClickIlanPaylas(_ sender: Any) {
        
        if VeriGirisKontrol() == false {
            AlertOlustur(title: "HATA", message: "Boş alan bırakılmıştır. Lütfen tüm alanları doldurunuz.")
        }else{
            
            let ilanPaylas = ["PaylasanKisi" : Auth.auth().currentUser!.email, "AdSoyad" : paylasanAdSoyad.text, "Telefon" : paylasanTelefonNumarasi.text, "IlBilgisi" : paylasilanIl.text, "Hastane" : paylasilanHastane.text, "IlanTipi" : ilanTipi, "IlanBilgisi" : ilanBilgisi.text, "Tarih" : FieldValue.serverTimestamp()] as [String : Any]
            
            let database = Firestore.firestore()
            let referance : DocumentReference?
            
            if ilanTipi == "Kan İlanı"{
                referance = database.collection("KanIlanlari").addDocument(data: ilanPaylas, completion: { (error) in
                    if error != nil{
                        self.AlertOlustur(title: "HATA", message: "İlan paylaşılırken hata oluştu. Lütfen tekrar deneyiniz.")
                    }
                })
            }else if ilanTipi == "İlaç İlanı"{
                referance = database.collection("IlacIlanlari").addDocument(data: ilanPaylas, completion: { (error) in
                    if error != nil{
                        self.AlertOlustur(title: "HATA", message: "İlan paylaşılırken hata oluştu. Lütfen tekrar deneyiniz.")
                    }
                })
            }else if ilanTipi == "İlik İlanı"{
                referance = database.collection("IlikIlanlari").addDocument(data: ilanPaylas, completion: { (error) in
                    if error != nil{
                        self.AlertOlustur(title: "HATA", message: "İlan paylaşılırken hata oluştu. Lütfen tekrar deneyiniz.")
                    }
                })
            }else if ilanTipi == "Malzeme İlanı"{
                referance = database.collection("MalzemeIlanlari").addDocument(data: ilanPaylas, completion: { (error) in
                    if error != nil{
                        self.AlertOlustur(title: "HATA", message: "İlan paylaşılırken hata oluştu. Lütfen tekrar deneyiniz.")
                    }
                })
            }else{
                AlertOlustur(title: "HATA", message: "İlan tipi doğru görünmüyor. Lütfen tekrar deneyiniz.")
            }
            
            AlertOlustur(title: "İLAN PAYLAŞILDI", message: "En kısa sürede sağlığınıza kavuşmanız dileğiyle...")
        }
    }
    
    @IBAction func rdKanIlaniClick(_ sender: Any) {
        
        rdKanIlan.setTitleColor(UIColor.white, for: UIControl.State.normal)
        rdKanIlan.backgroundColor = UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1)
        
        rdIlacIlan.setTitleColor(UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1), for: UIControl.State.normal)
        rdIlacIlan.backgroundColor = UIColor.white
        rdIlikIlan.setTitleColor(UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1), for: UIControl.State.normal)
        rdIlikIlan.backgroundColor = UIColor.white
        rdMalzemeIlan.setTitleColor(UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1), for: UIControl.State.normal)
        rdMalzemeIlan.backgroundColor = UIColor.white
        
        ilanTipi = "Kan İlanı"
        
        ilanBilgisi.text = ""
        ilanBilgisi.isEnabled = true
        
        ilanBilgileri = [String](arrayLiteral: "Arh+", "Arh-", "Brh+", "Brh-", "ABrh+", "ABrh-", "0rh+", "0rh-")
        

    }
    
    @IBAction func rdIlacIlaniClick(_ sender: Any) {
        
        rdIlacIlan.setTitleColor(UIColor.white, for: UIControl.State.normal)
        rdIlacIlan.backgroundColor = UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1)
        
        rdKanIlan.setTitleColor(UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1), for: UIControl.State.normal)
        rdKanIlan.backgroundColor = UIColor.white
        rdIlikIlan.setTitleColor(UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1), for: UIControl.State.normal)
        rdIlikIlan.backgroundColor = UIColor.white
        rdMalzemeIlan.setTitleColor(UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1), for: UIControl.State.normal)
        rdMalzemeIlan.backgroundColor = UIColor.white
        
        ilanTipi = "İlaç İlanı"
        
        ilanBilgisi.text = ""
        ilanBilgisi.isEnabled = true
        
        ilanBilgileri = [String](arrayLiteral: "Reçetesiz satılabilen ilaçlar", "Reçeteli satılan ilaçlar", "Kontrole tabi ilaçlar", "Kırmızı reçeteye tabi ilaçlar", "Yeşil reçeteye tabi ilaçlar", "Mor reçeteye Tabi ilaçlar", "Turuncu reçeteye tabi ilaçlar")
        
    }
    
    @IBAction func rdIlikIlaniClick(_ sender: Any) {
        
        rdIlikIlan.setTitleColor(UIColor.white, for: UIControl.State.normal)
        rdIlikIlan.backgroundColor = UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1)
        
        rdIlacIlan.setTitleColor(UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1), for: UIControl.State.normal)
        rdIlacIlan.backgroundColor = UIColor.white
        rdKanIlan.setTitleColor(UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1), for: UIControl.State.normal)
        rdKanIlan.backgroundColor = UIColor.white
        rdMalzemeIlan.setTitleColor(UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1), for: UIControl.State.normal)
        rdMalzemeIlan.backgroundColor = UIColor.white
        
        ilanTipi = "İlik İlanı"
        
        ilanBilgisi.text = "İlik İlanı"
        ilanBilgisi.isEnabled = false
        
    }
    
    @IBAction func rdMalzemeIlaniClick(_ sender: Any) {
        
        rdMalzemeIlan.setTitleColor(UIColor.white, for: UIControl.State.normal)
        rdMalzemeIlan.backgroundColor = UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1)
        
        rdIlacIlan.setTitleColor(UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1), for: UIControl.State.normal)
        rdIlacIlan.backgroundColor = UIColor.white
        rdIlikIlan.setTitleColor(UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1), for: UIControl.State.normal)
        rdIlikIlan.backgroundColor = UIColor.white
        rdKanIlan.setTitleColor(UIColor(red: 0.62, green: 0.118, blue: 0.118, alpha: 1), for: UIControl.State.normal)
        rdKanIlan.backgroundColor = UIColor.white
        
        ilanTipi = "Malzeme İlanı"
        ilanBilgisi.isEnabled = true
        
        ilanBilgisi.text = ""
        ilanBilgileri = [String](arrayLiteral: "Eldiver", "Maske", "Dezenfektan", "Hasta bezi", "Pansuman malzemeleri", "Çarşaf, kıyafet vb. ürünler")
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ilanBilgileri.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(ilanBilgileri[row])"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ilanBilgisi.text = "\(ilanBilgileri[row])"
        self.view.endEditing(true)
    }
    func AlertOlustur(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButonu = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButonu)
        self.present(alert, animated: true, completion: nil)
    }
    
    func VeriGirisKontrol() -> Bool{
        
        if paylasanAdSoyad.text == ""{
            return false
        }else if paylasanTelefonNumarasi.text == ""{
            return false
        }else if paylasilanIl.text == ""{
            return false
        }else if paylasilanHastane.text == ""{
            return false
        }else if ilanBilgisi.text == ""{
            return false
        }else{
            return true
        }

    }

}
