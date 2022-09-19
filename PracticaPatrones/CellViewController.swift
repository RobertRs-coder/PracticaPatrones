//
//  CellViewController.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 19/9/22.
//

import Foundation

import UIKit

class CellViewController: UICollectionViewCell {
    
    @IBOutlet var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cellImage.image = nil
        cellLabel.text = nil
        
        //Function to date data for view with data model
        func updateView() {
            //Get data for cell
            update(image: "")
            update(title: "")
        }
        
        //Function to update image
        func update(image: String?) {
            cellImage.image = UIImage(named: image ?? "")
        }
        
        //Function to update label
        func update(title: String) {
            cellLabel.text = title
        }
    }
}


