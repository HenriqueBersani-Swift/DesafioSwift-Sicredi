//
//  CheckInViewController.swift
//  DesafioSwift
//
//  Created by Henrique Bersani on 2/9/22.
//

import UIKit

class CheckInViewController: UIViewController {

    var eventId = ""
    var eventoTitle = ""
    @IBOutlet var eventTitle: UILabel!
    @IBOutlet var name: UITextField!
    @IBOutlet var email: UITextField!
    var json = ["id":"","name":"","email":""]
    
    let session = URLSession.shared
    let url = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/checkin")!
    
    
    @IBAction func sendBtn(_ sender: Any) {
        json["id"] = eventId
        json["name"] = name.text
        json["email"] = email.text
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        // Convert to a string and print
//        if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
//            print("jsondata== \(JSONString)")
//        }
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print(dataString)
                }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTitle.text = "\(eventoTitle) Check-In"
        
    }
    

}
