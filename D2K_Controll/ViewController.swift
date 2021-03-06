//
//  ViewController.swift
//  D2K_Controll
//
//  Created by Jan Peltzer on 02.04.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoTextOutput: UILabel!
    @IBOutlet weak var fetchButton: FetchButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func doLabelChange( text: String ) {
        DispatchQueue.main.async {
            self.infoTextOutput.text = text
            }
    }
    
    @IBAction func fetchButtonPress(_ sender: Any) {
    //   infoTextOutput.text = "Pressed"
       let url = URL(string: "https://b2kserver.herokuapp.com/api/fixture/getlist")!
        
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { [self] (data, response, error) in
              if let error = error {
                print("Error with fetching films: \(error)")
                return
              }

              guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                  print("httpResponse Error")
                return
              }
            do {
                let fixtures = try! JSONDecoder ().decode ([String].self, from: data!)
                
                var text:String = "";
                
                fixtures.forEach { word in
                    text += word
                    text += ", "
                }
                
                doLabelChange( text: text )
                
                print(fixtures)
            }
            
                                
            })
            task.resume()
    }
    

}


