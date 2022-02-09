//
//  EventViewController.swift
//  DesafioSwift
//
//  Created by Henrique Bersani on 2/8/22.
//

import UIKit

class EventViewController: UIViewController {

    var eventoEscolhido = [String:Any]()
    var eventoTitle = ""
    var dateArray = [Int]()
    var imageArray = [String]()
    var id = ""
//    var longitudeArray = [String]()
//    var latitudeArray = [String]()
    var price: Any = 0
    @IBOutlet var eventImage: UIImageView!
    @IBOutlet var eventDescription: UITextView!
    @IBOutlet var eventPrice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   print(eventoEscolhido)
       separarDataDoEvento()
    }
    
    func separarDataDoEvento(){
           id = eventoEscolhido["id"] as! String
//        print("---id\(titleArray)")
        eventoTitle = eventoEscolhido["title"] as! String
        print("id == \(id) title \(eventoTitle)")
        eventDescription.text = eventoEscolhido["description"] as? String
        if let price = eventoEscolhido["price"] {
            eventPrice.text = ("$\(price)")
        }
        if let url = URL(string: eventoEscolhido["image"] as! String) {
            guard let imageData = (try? Data(contentsOf: url)) else {return}
            
            guard let image = UIImage(data: imageData) else {
                return
            }
            eventImage.image = image
        }
        }
    
    
    @IBAction func shareButton(_ sender: Any) {
        let items = [eventoTitle]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CheckInViewController {
             destination.eventId = id
            destination.eventoTitle = eventoTitle
        }
    }
        
    }
    

   


