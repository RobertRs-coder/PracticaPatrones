//
//  DetailViewModel.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 24/9/22.
//

import Foundation

protocol DetailViewModelProtocol {
    func onViewsLoaded()
}

final class DetailViewModel {
    private var viewData: DetailModel
    
    private weak var viewDelegate: DetailViewProtocol?
    
    init(data: DetailModel, viewDelegate: DetailViewProtocol) {
        viewData = data
        self.viewDelegate = viewDelegate
    }
    
}

extension DetailViewModel: DetailViewModelProtocol {
    func onViewsLoaded() {
        viewDelegate?.updateView(data: viewData)
    }
}
