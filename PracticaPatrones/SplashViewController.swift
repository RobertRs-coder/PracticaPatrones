//
//  SplashViewController.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 19/9/22.
//

import UIKit

class SplashViewController: UIViewController {
    
    //MARK: IBOutlets

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: Constants
    
    let storyboardName = "HomeView"

    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
    }
    
    //We animate the activityIndicator if it is not animated when viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !activityIndicator.isAnimating {
            activityIndicator.startAnimating()
        }
    }
    //We stop animating the activityIndicator when viewDidDisappear
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicator.stopAnimating()
    }
    
    // Function to load data
    private func loadData() {
        //Create new thread in main thread after now + 3 seconds and do the clousure -> navigate next view
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            // TODO: navigate next view
            let homeStoryboard = UIStoryboard(name: self.storyboardName, bundle: nil)
//            guard let destinationViewController = homeStoryboard.instantiateInitialViewController() else { return }
            
            //How & Why to do it without initialController option
            guard let destinationViewController = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return }
            
            
                self.navigationController?.setViewControllers([destinationViewController], animated: true)
                
        }
    }

}

