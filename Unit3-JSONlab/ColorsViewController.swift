//
//  ColorsViewController.swift
//  Unit3-JSONlab
//
//  Created by Liubov Kaper  on 12/3/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var colors = [Colors]() {
        didSet {
            tableView.reloadData()
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        navigationItem.title = "COLORS"
        
    }
    
    func loadData() {
        colors = ColorData.getColors()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailColorVC = segue.destination as? DetailColorViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("verify class name in identity inspector")
        }
        let color = colors[indexPath.row]
        detailColorVC.detailColor = color
    }


}

extension ColorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.name.value
        cell.textLabel?.textColor = .white
        cell.backgroundColor = UIColor(red: CGFloat(color.rgb.r)/255, green: CGFloat(color.rgb.g)/255, blue: CGFloat(color.rgb.b)/255, alpha: 1)
        
        return cell
    }
}
