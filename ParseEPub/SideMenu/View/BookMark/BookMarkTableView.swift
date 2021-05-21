//
//  BookMarkTableView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/25.
//

import UIKit

class BookMarkTableView: UITableView {
    
    lazy var bookMarkData = [BookMarkData](){
        didSet{
            bookMarkData.count != 0 ? (oneLabel.isHidden = true) : (oneLabel.isHidden = false)
            bookMarkData.count != 0 ? (twoLabel.isHidden = true) : (twoLabel.isHidden = false)
        }
    }
    
    var bookMarkRank:RankModel = .newTimeToOldTime{
        didSet{
            let cell = cellForRow(at:IndexPath(item: 0, section: 0)) as! BookMarksTVCell
            cell.rankLabel.text = bookMarkRank.rank
            switch bookMarkRank{
            
            case .newTimeToOldTime:
                self.bookMarkData = bookMarkData.sorted { $0.time![0] > $1.time![0]}
            case .OldTimeToNewTime:
                self.bookMarkData = bookMarkData.sorted {$0.time![0] < $1.time![0]}
            case .FrontChapterToBackChapter:
                self.bookMarkData = bookMarkData.sorted {$0.chapterIndex < $1.chapterIndex}
            case .BackChapterToFrontChapter:
                self.bookMarkData = bookMarkData.sorted {$0.chapterIndex > $1.chapterIndex}
            }
            reloadData()
        }
    }
    
    var annotation = ""{
        didSet{
            let cell = cellForRow(at:IndexPath(item: bookMarkData.count - 1, section: 0)) as! BookMarksTVCell
            cell.annotationTextView.text = annotation
            reloadData()
        }
    }
    
    let headerView:BookMarkHeaderCV = {
        let headerView = BookMarkHeaderCV(frame: CGRect(x: 0, y: 0, width: fullScreenX * 0.8, height: fullScreenY * 0.05))
        return headerView
    }()
    
    let footerView = UIView()
    
    let oneLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "暫時沒有書籤"
        return label
    }()
    
    let twoLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "無符合篩選條件的書籤"
        return label
    }()
    
    //MARK: - set constraints
    func setOneLabelConstraints(){
        oneLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            oneLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            oneLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setTwoLabelConstraints(){
        twoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            twoLabel.topAnchor.constraint(equalTo: oneLabel.bottomAnchor,constant: fullScreenY * 0.03),
            twoLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setBookMarkTableView(){
        tableHeaderView = headerView
        tableFooterView = footerView
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 100
        register(BookMarksTVCell.self, forCellReuseIdentifier: BookMarksTVCell.cellIdentifier())
        addSubview(oneLabel)
        addSubview(twoLabel)
        setOneLabelConstraints()
        setTwoLabelConstraints()
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setBookMarkTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(bookMarkData:[BookMarkData]!) {
        self.init()
        self.bookMarkData = bookMarkData
    }
}


