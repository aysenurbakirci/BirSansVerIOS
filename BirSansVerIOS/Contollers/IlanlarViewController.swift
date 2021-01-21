//
//  IlanlarViewController.swift
//  BirSansVerIOS
//
//  Created by Ayşe Nur Bakırcı on 8.01.2021.
//

import UIKit
import Firebase

class IlanlarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblIlanlar: UITableView!
    
    let database = Firestore.firestore()
    var IlanDizisi = [Ilan]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblIlanlar.delegate = self
        tblIlanlar.dataSource = self
        
        if classIlanTipi.ilanTipi.ilan == "Kan İlanı"{
            IlanlariAl(koleksiyonAdi: "KanIlanlari")
        }else if classIlanTipi.ilanTipi.ilan == "İlaç İlanı"{
            IlanlariAl(koleksiyonAdi: "IlacIlanlari")
        }else if classIlanTipi.ilanTipi.ilan == "İlik İlanı"{
            IlanlariAl(koleksiyonAdi: "IlikIlanlari")
        }else if classIlanTipi.ilanTipi.ilan == "Malzeme İlanı"{
            IlanlariAl(koleksiyonAdi: "MalzemeIlanlari")
        }else{
            self.AlertOlustur(title: "HATA", message: "İlanlar listelenirken hata oluşmuştur. Lütfen tekrar deneyiniz.")
        }
    
    }

    func IlanlariAl (koleksiyonAdi : String){
        database.collection(koleksiyonAdi).order(by: "Tarih", descending: true).addSnapshotListener { (snapshot, error) in
            if error != nil{
               
                self.AlertOlustur(title: "HATA", message: "İlanlar listelenirken hata oluşmuştur. Lütfen tekrar deneyiniz.")
                
            }else{
                if snapshot?.isEmpty == false && snapshot != nil{
                    
                    self.IlanDizisi.removeAll(keepingCapacity: false)
                    
                    for bilgiler in snapshot!.documents{
                        
                        if let kullaniciAdSoyad = bilgiler.get("AdSoyad") as? String{
                            if let telefon = bilgiler.get("Telefon") as? String{
                                if let ilBilgisi = bilgiler.get("IlBilgisi") as? String{
                                    if let hastaneBilgisi = bilgiler.get("Hastane") as? String{
                                        if let ilanTipi = bilgiler.get("IlanTipi") as? String{
                                            if let ilanBilgisi = bilgiler.get("IlanBilgisi") as? String{
                                                    
                                                    let alinanIlanBilgileri = Ilan(AdSoyad: kullaniciAdSoyad, Telefon: telefon, Il: ilBilgisi, Hastane: hastaneBilgisi, IlanTipi: ilanTipi, IlanBilgisi: ilanBilgisi)
                                                    self.IlanDizisi.append(alinanIlanBilgileri)
                                                
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                }
            }
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IlanDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tblIlanlar.register(UINib(nibName: "DesignTableViewCell", bundle: nil), forCellReuseIdentifier: "DesignTableViewCell")
        let cellIcerik = tblIlanlar.dequeueReusableCell(withIdentifier: "DesignTableViewCell") as! DesignTableViewCell
        
        cellIcerik.ilanHastaneBilgsi.text = IlanDizisi[indexPath.row].Hastane
        cellIcerik.ilanKategoriBilgisi.text = IlanDizisi[indexPath.row].IlanBilgisi
        
        return cellIcerik
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let ilanBilgileriClass = classIlanAyrinti.ilanAyrintilari
        let ilanBilgileriDizi = IlanDizisi[indexPath.row]
        
        ilanBilgileriClass.adsoyad = ilanBilgileriDizi.AdSoyad
        ilanBilgileriClass.telefon = ilanBilgileriDizi.Telefon
        ilanBilgileriClass.il = ilanBilgileriDizi.Il
        ilanBilgileriClass.hastane = ilanBilgileriDizi.Hastane
        ilanBilgileriClass.ilantipi = ilanBilgileriDizi.IlanTipi
        ilanBilgileriClass.ilanbilgileri = ilanBilgileriDizi.IlanBilgisi
        
        self.performSegue(withIdentifier: "IlanlartoIlanAyrintilari", sender: nil)

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        // Remove separator inset
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = UIEdgeInsets.zero
        }
        
        // Prevent the cell from inheriting the Table View's margin settings
        if cell.responds(to: #selector(setter: UIView.preservesSuperviewLayoutMargins)) {
            cell.preservesSuperviewLayoutMargins = false
        }
        
        // Explictly set your cell's layout margins
        if cell.responds(to: #selector(setter: UIView.layoutMargins)) {
            cell.layoutMargins = UIEdgeInsets.zero
        }
    }
    
    func AlertOlustur(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButonu = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButonu)
        self.present(alert, animated: true, completion: nil)
    }
    
}


