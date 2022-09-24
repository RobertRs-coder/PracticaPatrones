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
        
        //TODO: Notificate view to draw data
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
}


