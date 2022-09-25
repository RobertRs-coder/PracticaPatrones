//
//  SplashViewModel.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 24/9/22.
//

import Foundation

protocol SplashViewModelProtocol {
    func onViewsLoaded()
}

final class SplashViewModel {
    
    //MARK: Variables
    //weak because viewmodel is create after view
    private weak var viewDelegate: SplashViewProtocol?
    
    init(viewDelegate: SplashViewProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
    // Function to load data
    private func loadData() {
        viewDelegate?.showLoading(true)
        //Create new thread in main thread after now + 3 seconds and do the clousure -> navigate next view
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            self?.viewDelegate?.showLoading(false)
            // TODO: Notificate view to navigate next view
            self?.viewDelegate?.navigateToHome()
        }
    }
}

extension SplashViewModel: SplashViewModelProtocol {
    func onViewsLoaded() {
        loadData()
    }
}
