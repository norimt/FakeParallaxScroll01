//
//  ViewController.swift
//  ParallaxScroll
//
//  Created by m4c on 2020/04/05.
//  Copyright © 2020 cloudeleven. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SectionHeaderViewDelegate {
    @IBOutlet weak var sectionHeaderView: SectionHeaderView!
    func onButton1Tapped(button: UIButton) {
        print("button1 tapped")
        NSLog("abutton1 tapped")
    }
    
    func onButton2Tapped(button: UIButton) {
        print("button2 tapped")
        NSLog("abutton2 tapped")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sectionHeaderView.delegate = self
    }

    @IBAction func onStartButtonTapped(_ sender: Any) {
        let controller: ParallaxViewController = UIStoryboard(name: "ParallaxViewController", bundle: nil).instantiateViewController(withIdentifier: "ParallaxViewController") as! ParallaxViewController
        navigationController?.pushViewController(controller, animated: true)
//        present(controller, animated: true) {
//            print("aaaa")
//        }
    }
    

    
}

