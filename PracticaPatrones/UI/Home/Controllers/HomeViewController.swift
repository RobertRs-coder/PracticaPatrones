//
//  HomeViewController.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 19/9/22.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func updateViews()
    func navigateToDetail(with data: DetailModel?)
}

class HomeViewController: UIViewController {

    //MARK: IBOUtlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Variables
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        viewModel?.onViewsLoaded()
    }
    
    private func configureView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension HomeViewController: HomeViewProtocol {

    func updateViews() {
        collectionView.reloadData()
    }
    
    func navigateToDetail(with data: DetailModel?) {
        let detailStoryboard = UIStoryboard(name: "DetailView", bundle: nil)
        
        guard let destinationViewController = detailStoryboard.instantiateInitialViewController() as? DetailViewController else { return }
        
        //Send data to detail
        destinationViewController.characterData = data
        
        navigationController?.pushViewController(destinationViewController, animated: true)
        }
    }

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.dataCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 16, height: 160.0)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellViewController.cellIndentifier, for: indexPath) as? CellViewController
        
        if let data = viewModel?.data(for: indexPath.row) {
            cell?.updateView(data: data)
            }
            return cell ?? UICollectionViewCell()
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        viewModel?.itemsSelected(at: indexPath.row)
    }
}
