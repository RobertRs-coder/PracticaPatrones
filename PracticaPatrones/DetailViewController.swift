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

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        // Do any additional setup after loading the view.
    }
    
    private func configureView() {
        //
    }
}
