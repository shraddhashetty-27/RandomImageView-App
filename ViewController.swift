//
//  ViewController.swift
//  RandomImageView
//
//  Created by Shraddha Shetty on 8/16/22.
//  Copyright © 2022 Shraddha Shetty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView =
    {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
        
    }()
    
    var colors  : [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemGray,
        .systemPink,
        .brown,
        .cyan,
        .white,
        .systemTeal,
        .systemOrange,
        .systemPurple]
    
    private let button: UIButton =
    {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        
        button.frame = CGRect(x: 45, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-90, height: 55)
        
        getRandomPhoto()
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    func getRandomPhoto(){
        let urlSring="https://source.unsplash.com/random/600x600"
        let url = URL(string : urlSring)
        guard let data=try? Data(contentsOf: url!) else{
            return
        }
        imageView.image=UIImage(data:data)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

