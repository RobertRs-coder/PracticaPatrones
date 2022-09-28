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
    
    private let characterModelToHomeCellModelMapper: CharacterModelToHomeCellModelMapperProtocol
    private let characterModelToDetailModelMapper: CharacterModelToDetailModelMapperProtocol
    
    private var viewData = [HomeCellModel]()
    private var detailViewData = [DetailModel]()
    
    init (viewDelegate: HomeViewProtocol?,
          characterModelToHomeCellModelMapper: CharacterModelToHomeCellModelMapperProtocol,
          characterModelToDetailModelMapper: CharacterModelToDetailModelMapperProtocol) {
        self.viewDelegate = viewDelegate
        self.characterModelToHomeCellModelMapper = characterModelToHomeCellModelMapper
        self.characterModelToDetailModelMapper = characterModelToDetailModelMapper
    }
    
    private func loadData() {

        viewData = characterModelToHomeCellModelMapper.map(sampleCharactersData)
        detailViewData = characterModelToDetailModelMapper.map(sampleCharactersData)
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
    }
    
    func itemsSelected(at index: Int) {
        guard let data = detailData(for: index) else { return }
        //Notificate view to navigate next screen
        viewDelegate?.navigateToDetail(with: data)
    }
}


