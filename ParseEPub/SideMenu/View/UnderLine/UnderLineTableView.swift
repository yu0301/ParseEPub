//
//  UnderLineTableView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/25.
//

import UIKit

class UnderLineTableView: UITableView {

    let footerView = UIView()
    //如果有資料則背景的label消除
    lazy var underLineDataArray = [UnderLineData](){
        didSet{
            underLineDataArray.count != 0 ? (oneLabel.isHidden = true) : (oneLabel.isHidden = false)
            underLineDataArray.count != 0 ? (twoLabel.isHidden = true) : (twoLabel.isHidden = false)
        }
    }
    
    var underLineRank:RankModel = .newTimeToOldTime{
        didSet{
             let cell = cellForRow(at:IndexPath(item: 0, section: 0)) as! UnderLineTVCell
            cell.rankLabel.text = underLineRank.rank
            switch underLineRank{
            
            case .newTimeToOldTime:
                self.underLineDataArray = underLineDataArray.sorted { $0.time![0] > $1.time![0]}
            case .OldTimeToNewTime:
                self.underLineDataArray = underLineDataArray.sorted { $0.time![0] < $1.time![0]}
            case .FrontChapterToBackChapter:
                self.underLineDataArray = underLineDataArray.sorted { $0.chapterIndex! < $1.chapterIndex!}
            case .BackChapterToFrontChapter:
                self.underLineDataArray = underLineDataArray.sorted { $0.chapterIndex! > $1.chapterIndex!}
            }
            //重排
            reloadData()
        }
    }
    
    let headerView:UnderLineHeaderCV = {
        let headerView = UnderLineHeaderCV(frame: CGRect(x: 0, y: 0, width: fullScreenX * 0.8, height: fullScreenY * 0.05))
        return headerView
    }()
    
    
    let oneLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "暫時沒有劃線"
        return label
    }()
    
    let twoLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "無符合篩選條件的劃線註記"
        return label
    }()
    
    //MARK: - constrains
    
    func setHeaderViewConstraints(){
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalToConstant: fullScreenX * 0.8),
            headerView.heightAnchor.constraint(equalToConstant:fullScreenY * 0.05)
        ])
    }
    
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
    
    func setUnderLineTableView(){
        register(UnderLineTVCell.self, forCellReuseIdentifier: UnderLineTVCell.cellIdentifier())
        tableHeaderView = headerView
        tableFooterView = footerView
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 100
        addSubview(oneLabel)
        addSubview(twoLabel)
        setOneLabelConstraints()
        setTwoLabelConstraints()
        setHeaderViewConstraints()
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setUnderLineTableView()
    }
    
    convenience init(underLineData:[UnderLineData]) {
        self.init()
        self.underLineDataArray = underLineData
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
