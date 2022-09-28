//
//  CellViewController.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 19/9/22.
//

import Foundation

import UIKit

class CellViewController: UICollectionViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellCharacterlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.layer.cornerRadius = 4.0
        cellView.layer.cornerRadius = 4.0
        cellView.layer.shadowColor = UIColor.gray.cgColor
        cellView.layer.shadowOffset = .zero
        cellView.layer.shadowOpacity = 0.7
        cellView.layer.shadowRadius = 4.0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cellImage.image = nil
        cellLabel.text = nil
    }
        
        //Function to date data for view with data model
    func updateView(data: HomeCellModel?) {
            //Get data for cell
        
        guard let data = data else { return }
        
        switch data.type {
            case .hero:
            self.backgroundColor = .blue
            case .villain:
            self.backgroundColor = .red
        }
        updateImage(photo: data.photo)
        update(title: data.name)
        update(character: data.type.rawValue)
        }
        
        //Function to update image
        func updateImage(photo: URL?) {
            guard let photo = photo else { return }
            cellImage.setImage(url: photo)
        }
        
        //Function to update label
        func update(title: String?) {
            cellLabel.text = title
        }
    
        //Function to update label
        func update(character: String?) {
            cellCharacterlabel.text = character?.capitalizingFirstLetter()
    }
    }

extension CellViewController {
    static var cellIndentifier: String {
        String(describing: CellViewController.self)
    }
}


