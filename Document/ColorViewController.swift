//
//  ColorViewController.swift
//  Document
//
//  Created by Austin Terranova on 2/1/19.
//  Copyright © 2019 Austin Terranova. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBAction func saveButton(_ sender: Any) {
        let fileName = "Colors"
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileManager = FileManager.default
       // if fileManager.fileExists(atPath: documentsURL.appendingPathComponent("Colors").path) {
         //   print("File exists")
       // } else {
       //     print("File not found")
        //}
        
        fileManager.createFile(atPath: documentsURL.appendingPathComponent("Colors.txt").path, contents: nil, attributes: nil)
        
        let file: FileHandle? = try! FileHandle(forUpdating: documentsURL.appendingPathComponent("\(nameTextField.text ?? "fghg").txt"))
        if file == nil {
            print("File open failed")
        } else {
            print("file opened for updating")
            if let text = nameTextField.text, let data = (text as
                NSString).data(using: String.Encoding.utf8.rawValue) {
                file?.seek(toFileOffset: 10)
                file?.write(data)
                file?.closeFile()
            }
            
        }
        print(documentsURL)

    }
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

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
