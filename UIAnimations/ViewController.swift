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
        //Deneme 1
//        UIView.animate(withDuration: 1) {
//            self.animatableView.backgroundColor = .red
//            self.animatableView.frame.size = CGSize(width: 100, height: 100)
//            self.animatableView.frame = CGRect(x: 100, y: 100, width: 70, height: 40)
//        }
        
        //Deneme 2
//        UIView.animate(withDuration: 2) {
//            self.animatableView.backgroundColor = .red
//            self.animatableView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        } completion: { _ in
//            UIView.animate(withDuration: 1) {
//                self.animatableView.backgroundColor = .systemPurple
//                self.animatableView.frame = CGRect(x: 100, y: 100, width: 100, height: 700)
//            }
//        }
        
        //Deneme 3
//        UIView.animate(withDuration: 1, delay: 1, options: [.beginFromCurrentState]) {
//            self.animatableView.backgroundColor = .systemBlue
//            self.animatableView.frame = CGRect(x:100, y: 100,width: 50, height: 50)
//        } completion: { _ in
//            UIView.animate(withDuration: 1, delay: 1) {
//                self.animatableView.backgroundColor = .red
//                self.animatableView.frame = CGRect(x: 100, y: 100, width: 50, height: 700)
//                self.applyScaleTransformation()
//            }
//        }
        
        //applyScaleTransformation()
        //applyRotationTransformation()
        //applyTranslationTransformation()
        applyComplexTransform()
    }

    //Transform: Arayüz elemeanları üzerinde, scale rotate ve translate gibi değişiklikler yapılmasını sağlayan bir property'dir
    private func applyScaleTransformation() {
        //Transform uygulanacak olan arayüz elemeanlarının genişlik ve yükseklik bilgisini iki katına çıkarır.
        let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        
        UIView.animate(withDuration: 2, delay: 1) {
            self.animatableView.transform = scaleTransform
        }
    }
    
    private func applyRotationTransformation() {
        //Transform uygulanacak arayüz elemanını saat yönünde 180 derece dönmesini sağlar
        //90 derece için .pi / 2
        //- 90 derece için ise -.pi / 2 kullanılabilir.
        
        let rotationTransformation = CGAffineTransform(rotationAngle: .pi)
        
        UIView.animate(withDuration: 1, delay: 1) {
            self.animatableView.transform = rotationTransformation
        }
    }
    
    private func applyTranslationTransformation() {
        let translationTransform = CGAffineTransform(translationX: -10, y: -10)
        
        UIView.animate(withDuration: 1, delay: 1) {
            self.animatableView.transform = translationTransform
        }
    }
    
    private func applyComplexTransform() {
        let scaleTransform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        let rotationTransformation = CGAffineTransform(rotationAngle: .pi / 2)
        let translationTransform = CGAffineTransform(translationX: -100, y: -150)
        
        let comboTransform = scaleTransform.concatenating(rotationTransformation).concatenating(translationTransform)
        //concateniating ile farklı işleri yapan transformation'lar tek bir outlette birlikte kullanılabilir.
//        UIView.animate(withDuration: 1, delay: 0) {
//            self.animatableView.transform = comboTransform
//        } completion: { _ in
//            UIView.animate(withDuration: 1, delay: 0) {
//                self.animatableView.backgroundColor = .red
//                self.animatableView.frame = CGRect(x: 0, y: 0, width: 10, height: 900)
//            }
//        }
        
        UIView.animate(withDuration: 2, delay: 1) {
            self.animatableView.transform = comboTransform
        } completion: { _ in
            //identity, animasyonların uygulanmadan önceki haline geri döndürür.
            UIView.animate(withDuration: 1, delay: 1) {
                self.animatableView.transform = .identity
            }
            
        }

        
    }
}

