//
//  DetailViewController.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 23/9/22.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: IBOUtlets


    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    
    
    //MARK: Variables
    
    var characterData: CharacterModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let characterData = characterData else { return }
        
        updateView(data: characterData)
        // Do any additional setup after loading the view.
    }
    
    func updateView(data: CharacterModel) {
            //Get data for cell
        update(image: data.image)
        update(title: data.name)
        update(description: data.description)
        }
        
        //Function to update image
        func update(image: String?) {
            detailImage.image = UIImage(named: image ?? "")
        }
        
        //Function to update label
        func update(title: String?) {
            detailTitle.text = title
        }
    
        //Function to update label
        func update(description: String?) {
            detailDescription.text = description
    }
}
