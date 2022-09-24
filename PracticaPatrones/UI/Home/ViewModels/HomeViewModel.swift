//
//  HomeViewModel.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 24/9/22.
//

import Foundation

protocol HomeViewModelProtocol {
    
}

final class HomeViewModel {
    //MARK: Variables
    weak var viewDelegate: HomeViewProtocol?
    
    init (viewDelegate: HomeViewProtocol?) {
        self.viewDelegate = viewDelegate
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    
}


