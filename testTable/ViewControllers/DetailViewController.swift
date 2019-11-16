//
//  DetailViewController.swift
//  testTable
//
//  Created by Mati on 14/11/2019.
//  Copyright © 2019 Swiftland Training. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: NSObjectProtocol{
  func printMyNumber(data:String)
}

class DetailViewController: UIViewController {

  @IBOutlet weak var labelSecondView: UILabel!
  
  @IBOutlet weak var labelNumber: UILabel!
 
    var labelContent:String?
  
  weak var delegate : DetailViewControllerDelegate?
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
        labelSecondView.text = labelContent
        labelNumber.text = String(arc4random_uniform(10))

        // Do any additional setup after loading the view.
    }
  
  
  override func viewWillDisappear(_ animated:Bool) {
      if let delegate = delegate {
        delegate.printMyNumber(data: String(labelNumber.text ?? "NO NUMBER"))
      }
      
  }
  
  
  @IBAction func actionButton(_ sender: Any) {
  
    if let delegate = delegate {
      delegate.printMyNumber(data: String(labelNumber.text ?? "NO NUMBER"))
    }
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
