//
//  ViewControllerDetailed.swift
//  Project_UIViewController_Lifecycle
//
//  Created by user226947 on 12/19/22.
//

import UIKit

class ViewControllerDetailed: UIViewController {

    @IBOutlet var SchemeView: UIImageView!
    @IBOutlet var ImageView: UIImageView!
    
    var selectedImage: String?
    var selectedScheme: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let selectedImageUW = selectedImage ?? ""
        

        title = lc_dict[selectedImageUW]
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage, let schemeToLoad = selectedScheme {
            
            SchemeView.image = UIImage(named: schemeToLoad)
            SchemeView.layer.borderWidth = 1
            SchemeView.layer.borderColor = UIColor.gray.cgColor
            
            ImageView.image = UIImage(named: imageToLoad)
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
        
    }
}


