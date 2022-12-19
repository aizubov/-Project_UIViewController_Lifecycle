//
//  ViewController.swift
//  Project_UIViewController_Lifecycle
//
//  Created by user226947 on 12/19/22.
//

import UIKit

class ViewController: UITableViewController {

    
    var pictures = [String]()
    var schemes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UIViewController Lifecycle"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        print(items)
        
        for item in items {
            if item.hasSuffix("text.jpg"){

                pictures.append(item)
            } else if item.hasSuffix("scheme.jpg"){
                print()
                schemes.append(item)
            }        }
        pictures.sort()
        schemes.sort()
        print(pictures)
        print(schemes)
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = lc_dict[pictures[indexPath.row]]
        
        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? ViewControllerDetailed {
            print(pictures[indexPath.row])
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedScheme = schemes[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


