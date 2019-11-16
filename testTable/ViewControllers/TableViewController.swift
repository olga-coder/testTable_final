//
//  TableViewController.swift
//  testTable
//
//  Created by Mati on 13/11/2019.
//  Copyright © 2019 Swiftland Training. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,DetailViewControllerDelegate,AddViewControllerDelegate {
  
  
  @IBOutlet weak var vehiclesTableView: UITableView!
  
  func saveNewElementToList(data: Vehiculo) {
    
    print("SAVE ELEMENT AT TABLEVIEW")
    self.vehiculos.append(data)
   // UserDefaults.standard.setStructArray(vehiculos, forKey: "vehiculos")
    self.vehiclesTableView.reloadData()
    
    //REFRESH TABLE
  }
  
  
  
 func printMyNumber(data: String) {
     print("MY NUMBER IS AT FIRST VIEW",data)
  }
  
  
  
  
  
  
  var vehiculos:[Vehiculo] =
    [ Vehiculo(id:0,title:"Coche",text:"Este coche mola",image:UIImage(named:"coche")),
      
      Vehiculo(id:1,title:"Moto",text:"Esta moto mola",image:UIImage(named:"moto")),
      
      Vehiculo(id:2,title:"Patinete",text:"Este patinete mola",image:UIImage(named:"patinete"))]
  
  
  //["coche","moto","bicicleta","camion","patinete","barco","monopatin"]
  
  
  var sections:[String] = ["vehículos1"]
  

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return vehiculos.count
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
    
    //print("INDEXPATH:",indexPath.row);
    self.performSegue(withIdentifier: "segueToSecondScreen", sender: indexPath)
  }
  
  override func prepare(for segue:UIStoryboardSegue,sender:Any?){
    
    if(segue.identifier == "segueToSecondScreen"){
      
      let detailView:DetailViewController = segue.destination as! DetailViewController
      
      detailView.delegate = self;
      
      let indexPath:IndexPath = sender as! IndexPath;
      
      detailView.labelContent  = vehiculos[indexPath.row].title
      
    }else if(segue.identifier == "toAddView"){
      
      let addView:AddViewController = segue.destination as! AddViewController
      
      addView.delegate = self;
    
    }
    
  }
  
 
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell:VehiculoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VehiculoCell", for: indexPath) as! VehiculoTableViewCell
    
    
    let vehiculo:Vehiculo = vehiculos[indexPath.row]
    
    cell.vehiculoTitleLabel.text = vehiculo.title
    cell.vehiculoTextLabel.text = vehiculo.text
    cell.vehiculoImageView.image = vehiculo.image
      
    return cell
    
  }
  
  
  func numberOfSections(in tableView:UITableView)-> Int{
     return sections.count;
   }
   
   
   
   
   func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int)-> String? {
     
     return self.sections[section];
   }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
    
    return true;
    
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
    
    if editingStyle == .delete {
      self.vehiculos.remove(at: indexPath.row)
      
     // UserDefaults.standard.setStructArray(vehiculos, forKey: "vehiculos")
      
      tableView.beginUpdates()
      tableView.deleteRows(at: [indexPath], with:.automatic)
      tableView.endUpdates()
    }
  }
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
      /*if let vehiculosStored:[Vehiculo] = UserDefaults.standard.structArrayData(Vehiculo.self, forKey: "vehiculos"){
        self.vehiculos = vehiculosStored
        
      }else{
        UserDefaults.standard.setStructArray(vehiculos, forKey: "vehiculos")
      }*/
      
        // Do any additional setup after loading the view.
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
