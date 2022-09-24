//
//  SplashViewController.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 19/9/22.
//

import UIKit


protocol SplashViewProtocol: AnyObject {
    func showLoading(_ show: Bool)
    func navigateToHome()
}

class SplashViewController: UIViewController {
    
    //MARK: IBOutlets

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: Constants
    
    let storyboardName = "HomeView"
    
    //MARK: Variables
    
    var viewModel: SplashViewModelProtocol?
    
    
    convenience init(viewModel: SplashViewModelProtocol?) {
        self.init()
        self.viewModel = viewModel
    }
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create viewModel & notificate views loaded
        viewModel?.onViewsLoaded()
    }
    
    //We stop animating the activityIndicator when viewDidDisappear
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicator.stopAnimating()
    }

}

extension SplashViewController: SplashViewProtocol {
    //Function to show animation activity indicator from viewModel order
    func showLoading(_ show: Bool) {
        switch show {
            case true where !activityIndicator.isAnimating:
                activityIndicator.startAnimating()
            case false where activityIndicator.isAnimating:
            activityIndicator.stopAnimating()
            
            default: break
        }
    }
    
    func navigateToHome() {
        // Function to navigate next view
        let homeStoryboard = UIStoryboard(name: self.storyboardName, bundle: nil)
        
        
        guard let destinationViewController = homeStoryboard.instantiateInitialViewController() as? HomeViewController else { return }
        
        //Manual inyection viewModel
        destinationViewController.viewModel = HomeViewModel(viewDelegate: destinationViewController)
        
        
        
        self.navigationController?.setViewControllers([destinationViewController], animated: true)
    }
}
