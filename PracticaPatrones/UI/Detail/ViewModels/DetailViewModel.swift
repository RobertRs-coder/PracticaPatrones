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
    
    init(viewDelegate: DetailViewProtocol, data: DetailModel) {
        self.viewDelegate = viewDelegate
        viewData = data
    }
    
}

extension DetailViewModel: DetailViewModelProtocol {
    func onViewsLoaded() {
        viewDelegate?.updateView(data: viewData)
    }
}
