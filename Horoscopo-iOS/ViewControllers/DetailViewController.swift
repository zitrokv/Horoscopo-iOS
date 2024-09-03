//
//  DetailViewController.swift
//  Horoscopo-iOS
//
//  Created by Mañanas on 30/7/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    
    @IBOutlet weak var favoriteButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var horoscope :Horoscope? = nil
    var horoscopeIndex : Int = -1
    var isFavorite:Bool = false
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let horoscope = horoscope {
            nameLabel.text = horoscope.name
            logoImageView.image = horoscope.logo
            datesLabel.text = horoscope.dates
        }
        
        loadData()
    }
    
    func loadData(){
        isFavorite = (horoscope?.id == UserDefaults.standard.string(forKey: "FAVORITE_HOROSCOPE") ?? "" )
        
        setFavoriteButtonItem()
        
        self.navigationItem.title = horoscope?.name
        nameLabel.text = horoscope?.name
        logoImageView.image = horoscope?.logo
        
        getHoroscopeLuck()
    }
    
    func getHoroscopeLuck()
    {
        Task{
            do{
                let luck = try await HoroscopeProvider.getHoroscopeLuck(horoscopeId : horoscope!.id)
                
                descriptionTextView.text = luck.toupper()
                
            }catch{
                print(error)
            }
        }
        
    }
    
    @IBAction func setFavorite(_ sender: Any) {
        
        //print("He pulsado el menu corazon")
        //let isFavorite = defaults.string(forKey: "FAVORITE_HOROSCOPE") == horoscope?.id ?? ""
        isFavorite = !isFavorite
        
        if(isFavorite){
            UserDefaults.standard.setValue(horoscope?.id, forKey: "FAVORITE_HOROSCOPE")
        }else{
            UserDefaults.standard.setValue("", forKey: "FAVORITE_HOROSCOPE")
        }
        
        setFavoriteButtonItem()
    }
    
    func setFavoriteButtonItem(){
        if(isFavorite){
            favoriteButtonItem.image = UIImage(systemName: "heart.fill")
        }else{
            favoriteButtonItem.image = UIImage(systemName: "heart")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
