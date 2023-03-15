//
//  ViewController.swift
//  UIAnimations
//
//  Created by Ahmet Ali ÇETİN on 15.03.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: OUTLETS
    @IBOutlet weak var animatableView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        UIView.animate(withDuration: 1) {
//            self.animatableView.backgroundColor = .red
//            self.animatableView.frame.size = CGSize(width: 100, height: 100)
//            self.animatableView.frame = CGRect(x: 100, y: 100, width: 70, height: 40)
//        }
        
        UIView.animate(withDuration: 2) {
            self.animatableView.backgroundColor = .red
            self.animatableView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        } completion: { _ in
            UIView.animate(withDuration: 1) {
                self.animatableView.backgroundColor = .systemPurple
                self.animatableView.frame = CGRect(x: 100, y: 100, width: 100, height: 700)
            }
        }

    }


}

