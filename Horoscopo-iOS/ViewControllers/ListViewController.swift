//
//  ViewController.swift
//  Horoscopo-iOS
//
//  Created by Mañanas on 29/7/24.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    var horoscopeList: [Horoscope] = HoroscopeProvider.getAllHoroscopes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HoroscopeViewCell
                
        let horoscope = horoscopeList[indexPath.row]
        
        cell.render(horoscope: horoscope)
        /*cell.nameLabel.text = horoscope.name
        cell.logoImageView.image = horoscope.logo
        cell.datesLabel.text = horoscope.dates
        */
        
        return cell
    }
    
    func tableViewCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> Horoscope? {
                
        let horoscope = horoscopeList[indexPath.row]
        return horoscope
        //return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! DetailViewController
        //let indexPath = tableView.indexPathForSelectedRow!
        //viewController.horoscope = horoscopeList[indexPath.row]
        
        viewController.horoscope = tableViewCell(tableView, cellForRowAt: tableView.indexPathForSelectedRow!)
        
        
        print(sender!.self)
        
        
    }

}

