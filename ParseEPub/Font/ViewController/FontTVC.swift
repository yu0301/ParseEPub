//
//  FontTableViewTableViewController.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/7.
//

import UIKit

class FontTVC: UITableViewController {
    
    let header:FontHeaderView = {
        let view = FontHeaderView(frame: CGRect(x: 0, y: 0, width: fullScreenX, height: fullScreenY * 0.2))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        tableView.register(FontSizeTableViewCell.self, forCellReuseIdentifier: "fontSizeTableViewCell")
        tableView.register(TextArrangementCell.self, forCellReuseIdentifier: "textArrangementCell")
        tableView.register(BoundaryTableViewCell.self, forCellReuseIdentifier: "boundaryTableViewCell")
        tableView.register(FontTableViewCell.self, forCellReuseIdentifier: "fontTableViewCell")
        tableView.rowHeight = fullScreenY * 0.1
        tableView.isScrollEnabled = false
        tableView.tableHeaderView = header
        setTableViewConstraints()
    }
    
    func setTableViewConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.heightAnchor.constraint(equalToConstant: fullScreenY * 0.8).isActive = true
    }
    
    
    //MARK: - set tableViewcell
    func generateFontSizeTableViewCell(indexPath:IndexPath)->UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontSizeTableViewCell", for: indexPath) as! FontSizeTableViewCell
        return cell
    }
    
    func generateTextArrangementCell(indexPath:IndexPath)->UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "textArrangementCell", for: indexPath) as! TextArrangementCell
        return cell
    }
    
    func generateBoundaryTableViewCell(indexPath:IndexPath)->UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "boundaryTableViewCell", for: indexPath) as! BoundaryTableViewCell
        return cell
    }
    
    func generateFontTableViewCell(indexPath:IndexPath)->UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontTableViewCell", for: indexPath) as! FontTableViewCell
        return cell
    }
    
//    FontTableViewCell

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return fullScreenY * 0.1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch indexPath.row{
        case 0:
            cell = generateTextArrangementCell(indexPath: indexPath)
            return cell
        case 1:
            cell = generateBoundaryTableViewCell(indexPath: indexPath)
            return cell
        case 2:
            cell = generateFontTableViewCell(indexPath: indexPath)
            return cell
        case 3:
            cell = generateFontTableViewCell(indexPath: indexPath)
            return cell
        case 4:
            cell = generateFontTableViewCell(indexPath: indexPath)
            return cell
        case 5:
            cell = generateFontTableViewCell(indexPath: indexPath)
            return cell
        case 6:
            cell = generateFontTableViewCell(indexPath: indexPath)
            return cell
        default:
            fatalError()
        }

    }
}


