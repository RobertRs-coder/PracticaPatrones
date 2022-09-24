//
//  HomeViewModel.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 24/9/22.
//

import Foundation

protocol HomeViewModelProtocol {
    var dataCount: Int { get }
    var detailDataCount: Int { get }
    func onViewsLoaded()
    func data (for index: Int) -> HomeCellModel?
    func detailData (for index: Int) -> DetailModel?
    func itemsSelected(at index: Int)
}

final class HomeViewModel {
    //MARK: Variables
    private weak var viewDelegate: HomeViewProtocol?
    private var viewData = [HomeCellModel]()

    private var detailViewData = [DetailModel]()
    
    init (viewDelegate: HomeViewProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
        viewData = sampleCharactersData.compactMap {
            HomeCellModel(name: $0.name, image: $0.image)
        }
    }
        
    private func loadDetailData() {
        detailViewData = sampleCharactersData.compactMap {
            DetailModel(name: $0.name, description: $0.description, image: $0.image)
        }
        
        //Notificate view to draw data
        viewDelegate?.updateViews()
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    func detailData(for index: Int) -> DetailModel? {
        guard index < detailDataCount else { return nil}
        return detailViewData[index]
    }
    
    func data(for index: Int) -> HomeCellModel? {
        guard index < dataCount else { return nil}
        return viewData[index]
    }
    
    var detailDataCount:Int {
        detailViewData.count
    }
    
    var dataCount:Int {
        viewData.count
    }
    
    func onViewsLoaded() {
        loadData()
        loadDetailData()
    }
    
    func itemsSelected(at index: Int) {
        guard let data = detailData(for: index) else { return }
        //Notificate view to navigate next screen
        viewDelegate?.navigateToDetail(with: data)
    }
}


