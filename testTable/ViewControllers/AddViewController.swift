//
//  AddViewController.swift
//  testTable
//
//  Created by Mati on 15/11/2019.
//  Copyright © 2019 Swiftland Training. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate: NSObjectProtocol{
  func saveNewElementToList(data:Vehiculo)
}

class AddViewController: UIViewController {
  
  
  @IBOutlet weak var titleLabel: UITextField!
  
  @IBOutlet weak var textLabel: UITextField!
  
  
  
  @IBOutlet weak var imageView: UIImageView!
  
  
  
  weak var delegate : AddViewControllerDelegate?
  
  override func viewDidLoad() {
        super.viewDidLoad()

    
        // Do any additional setup after loading the view.
  }
    

  @IBAction func chooseImageClick(_ sender: Any) {
    
    ImagePickerManager().pickImage(self){ image in
      self.imageView.image = image
    }
  }
  
  
  
  @IBAction func saveClick(_ sender: Any) {
    let id:Int = Int(Date().timeIntervalSince1970)
    let title:String = titleLabel.text ?? "NO VALUE"
    let text:String = textLabel.text ?? "NO "
    let image:UIImage = self.imageView.image!;
    
    let vehiculo = Vehiculo(id:id,title:title,text:text ,image:image)
    
    if let delegate = delegate {
      delegate.saveNewElementToList(data: vehiculo)
    }
    
    self.dismiss(animated:true)
    
    
    
  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
