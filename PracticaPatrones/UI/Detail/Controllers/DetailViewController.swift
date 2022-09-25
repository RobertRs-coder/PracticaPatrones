//
//  DetailViewController.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 23/9/22.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    func updateView(data: DetailModel)
    func update(image: String?)
    func update(title: String?)
    func update(description: String?)
}

class DetailViewController: UIViewController {
    //MARK: IBOUtlets
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDescription: UITextView!
    
    //MARK: Variables
    var viewModel: DetailViewModelProtocol?
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewsLoaded()
    }
}

extension DetailViewController: DetailViewProtocol {
    func updateView(data: DetailModel) {
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
