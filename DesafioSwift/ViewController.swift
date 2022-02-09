//
//  ViewController.swift
//  DesafioSwift
//
//  Created by Henrique Bersani on 2/5/22.


//NOTE: Eu agradeço pela oportunidade de fazer esse desafio para a Sicredi. Infelizmente eu não tenho experiência com RxSwift e MVVM, porém tenho certeza que posso aprender e ser um membro produtivo do time da Sicredi.

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var eventoSelecionado = [String:Any]()
    @IBOutlet var eventTable: UITableView!
    let url = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/events")!
    var titleArray = [String]()
    var events = [[String: Any]]()
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.eventTable.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTable.delegate = self
        eventTable.dataSource = self
        eventTable.register(UINib(nibName: "EventTableViewCell", bundle: nil) , forCellReuseIdentifier: "eventCell")
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [[String:Any]] {
                self.events = json
                for event in json {
                    if let t = event["title"] {
                        print("titlee --> \(t)")
                        self.titleArray.append(t as! String)
                   }
                }
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell
        cell.eventTitle.text = titleArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            eventTable.deselectRow(at: indexPath, animated: false)
            eventoSelecionado = events[indexPath.row]
            performSegue(withIdentifier: "eventSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EventViewController {
             destination.eventoEscolhido = eventoSelecionado
        }
    }
    
}

