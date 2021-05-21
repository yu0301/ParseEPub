//
//  BookMarksTV.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/14.
//

import UIKit

class BookMarksTV: UITableView {

    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)
        register(BookMarksTVCell.self, forCellReuseIdentifier: "bookMarksTVCell")
        rowHeight = fullScreenY * 0.05
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookMarksTV:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "bookMarksTVCell", for: indexPath) as! BookMarksTVCell
        return cell
    }
    
    
}
