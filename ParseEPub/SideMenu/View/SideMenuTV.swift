//
//  SideMenuTV.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/14.
//

import UIKit

class SideMenuTV: UITableView {
    
    let chapterArray = ["CH.1","CH.2","CH.3","CH.4","CH.5","CH.6","CH.7","CH.8","CH.9","CH.10","CH.11"]
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)
        register(SideMenuTVCell.self, forCellReuseIdentifier: "SideMenuTVCell")
        rowHeight = fullScreenY * 0.05
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SideMenuTV:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chapterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = dequeueReusableCell(withIdentifier: "SideMenuTVCell", for: indexPath) as! SideMenuTVCell
        cell.chapterLabel.text = chapterArray[indexPath.row]
        return cell
    }
    
}
