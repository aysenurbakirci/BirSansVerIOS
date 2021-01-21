//
//  IlanlarimViewController.swift
//  BirSansVerIOS
//
//  Created by Ayşe Nur Bakırcı on 8.01.2021.
//

import UIKit
import Firebase

class IlanlarimViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tblIlanlarim: UITableView!
    let database = Firestore.firestore()
    var IlanDizisi = [Ilan]()
    var dokumanBilgiDizisi = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblIlanlarim.delegate = self
        tblIlanlarim.dataSource = self

        IlanlariAl(koleksiyonAdi: "KanIlanlari")
        IlanlariAl(koleksiyonAdi: "IlacIlanlari")
        IlanlariAl(koleksiyonAdi: "IlikIlanlari")
        IlanlariAl(koleksiyonAdi: "MalzemeIlanlari")
    }
    
    func IlanlariAl (koleksiyonAdi : String){
        database.collection(koleksiyonAdi).whereField("PaylasanKisi", isEqualTo: Auth.auth().currentUser?.email).addSnapshotListener { (snapshot, error) in
            if error != nil{
               
                self.AlertOlustur(title: "HATA", message: "İlanlar listelenirken hata oluşmuştur. Lütfen tekrar deneyiniz.")
            
            }else{
                if snapshot?.isEmpty == false && snapshot != nil{
                    
                    for bilgiler in snapshot!.documents{
                        if let hastaneBilgisi = bilgiler.get("Hastane") as? String{
                            if let ilanBilgisi = bilgiler.get("IlanBilgisi") as? String{
                                if let ilanTipi = bilgiler.get("IlanTipi") as? String{
                                    let alinanIlanBilgileri = Ilan(AdSoyad: "", Telefon: "", Il: "", Hastane: hastaneBilgisi, IlanTipi: ilanTipi, IlanBilgisi: ilanBilgisi)
                                    self.IlanDizisi.append(alinanIlanBilgileri)
                                    self.dokumanBilgiDizisi.append(bilgiler.documentID)
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
        
        tblIlanlarim.register(UINib(nibName: "DesignTableViewCell", bundle: nil), forCellReuseIdentifier: "DesignTableViewCell")
        let cellIcerik = tblIlanlarim.dequeueReusableCell(withIdentifier: "DesignTableViewCell") as! DesignTableViewCell
        
        cellIcerik.ilanHastaneBilgsi.text = IlanDizisi[indexPath.row].Hastane
        cellIcerik.ilanKategoriBilgisi.text = IlanDizisi[indexPath.row].IlanBilgisi
        
        return cellIcerik
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            
            var ilantipi = KoleksiyonBul(ilantipi: IlanDizisi[indexPath.row].IlanTipi)
            
            IlanDizisi.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            database.collection(ilantipi).document(dokumanBilgiDizisi[indexPath.row]).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
        }
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
    
    func KoleksiyonBul (ilantipi : String) -> String{
        var ilanKoleksiyonBilgisi = ""
        
        if ilantipi == "Kan İlanı"{
            ilanKoleksiyonBilgisi = "KanIlanlari"
        }else if ilantipi == "İlaç İlanı"{
            ilanKoleksiyonBilgisi = "IlacIlanlari"
        }else if ilantipi == "İlik İlanı"{
            ilanKoleksiyonBilgisi = "IlikIlanlari"
        }else if ilantipi == "Malzeme İlanı"{
            ilanKoleksiyonBilgisi = "MalzemeIlanlari"
        }else{
            self.AlertOlustur(title: "HATA", message: "İlanlar listelenirken hata oluşmuştur. Lütfen tekrar deneyiniz.")
        }
        
        return ilanKoleksiyonBilgisi
    }
    
    func AlertOlustur(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButonu = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButonu)
        self.present(alert, animated: true, completion: nil)
    }

}
