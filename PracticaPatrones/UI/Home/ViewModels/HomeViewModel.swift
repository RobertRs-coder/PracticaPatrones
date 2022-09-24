//
//  HomeViewModel.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 24/9/22.
//

import Foundation

protocol HomeViewModelProtocol {
    var dataCount: Int { get }
    func onViewsLoaded()
    func data (for index: Int) -> HomeCellModel?
    func itemsSelected(at index: Int)
}

final class HomeViewModel {
    //MARK: Variables
    private weak var viewDelegate: HomeViewProtocol?
    private var viewData = [HomeCellModel]()
    
    init (viewDelegate: HomeViewProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
        viewData = sampleCharactersData.compactMap {
            HomeCellModel(name: $0.name, image: $0.image)
        }
        
        //Notificate view to draw data
        viewDelegate?.updateViews()
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    func data(for index: Int) -> HomeCellModel? {
        guard index < dataCount else { return nil}
        return viewData[index]
    }
    
    var dataCount:Int {
        viewData.count
    }
    
    func onViewsLoaded() {
        loadData()
    }
    
    func itemsSelected(at index: Int) {
        guard let data = data(for: index) else { return }
        //Notificate view to navigate next screen
        viewDelegate?.navigateToDetail(with: data)
    }
}


