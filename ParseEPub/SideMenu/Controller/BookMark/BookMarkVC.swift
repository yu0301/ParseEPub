//
//  BookMarkVC.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/25.
//

import UIKit

class BookMarkVC: UIViewController {
    
    lazy var bookMarkTableView = BookMarkTableView(bookMarkData:self.bookMarkDataArray)
    let bookMarkALC = BookMarkALC()
    var deleteCellTag:Int?
    var bookMarkDataArray:[BookMarkData]!
    var goToBookMarkPageDelegate:GoToBookMarkPage!
    var circleColor:CircleColor.ChooseColor = .allColor
    
    //MARK:- button action
    
    @objc func goToEditVC(sender:UIButton){
        let tag = sender.tag - 1
        let vc = BookMarkEditVC(bookMarkDataArray: bookMarkTableView.bookMarkData, bookMarkData: nil, tag: tag)
//        vc.returnTheAnnotationDelegate = self
        vc.triggerClickColorDelegate = self
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    
    @objc func deleteCell(sender:UIButton){
        deleteCellTag = sender.tag 
        let alc = DeleteBookMarkALC()
        alc.message = "是否刪除該筆書籤"
        alc.removeCellDelegate = self
        present(alc, animated: false, completion: nil)
    }
    
    func deleteCell(){
        guard deleteCellTag != nil else{return}
        bookMarkTableView.bookMarkData.remove(at: deleteCellTag!-1)
        bookMarkTableView.deleteRows(at: [IndexPath(row: deleteCellTag!, section: 0)], with: .automatic)
        bookMarkTableView.reloadData()
        UserDefaultData.saveBookMarkData(bookMakArray: bookMarkTableView.bookMarkData)
        //主頁更新
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadtv"), object: nil)
//        dismiss(animated: true, completion: nil)
    }
    
    func decideSelectedItem(){
        switch circleColor{
        case .white:
            print("blank")
        case .allColor:
            self.collectionView(bookMarkTableView.headerView, didSelectItemAt: IndexPath(item: 1, section: 0))
        case .blue:
            self.collectionView(bookMarkTableView.headerView, didSelectItemAt: IndexPath(item: 2, section: 0))
        case .red:
            self.collectionView(bookMarkTableView.headerView, didSelectItemAt: IndexPath(item: 3, section: 0))
        case .green:
            self.collectionView(bookMarkTableView.headerView, didSelectItemAt: IndexPath(item: 5, section: 0))
        case .purple:
            self.collectionView(bookMarkTableView.headerView, didSelectItemAt: IndexPath(item: 6, section: 0))
        case .yellow:
            self.collectionView(bookMarkTableView.headerView, didSelectItemAt: IndexPath(item: 4, section: 0))
        }
    }
    
    //MARK: - 時間判斷
    func timeCompare(bookMarkData:BookMarkData)->String{
        let nowTime = Date().timeArray
        let dataTime = bookMarkData.time
        var time:String!
        let deltaSeconds:Int = (nowTime[0] - dataTime![0])
        //直接比較秒數
        if deltaSeconds < 59{
            time = "\(deltaSeconds)秒前"
        }else if 59 < deltaSeconds && deltaSeconds < 3599{
            time = "\(Int(deltaSeconds / 60))分前"
        }else if 3599 < deltaSeconds && deltaSeconds < 86399{
            time = "\(Int(deltaSeconds / 3600))小時前"
        }else if 86399 < deltaSeconds{
            time = "\(Int(deltaSeconds / 86400))日前"
        }
        return time
    }
    
    func setView(){
        view.tag = 1
        bookMarkTableView.delegate = self
        bookMarkTableView.dataSource = self
        bookMarkTableView.headerView.delegate = self
        bookMarkTableView.headerView.dataSource = self
        bookMarkALC.returnRankCoditionDelegate = self
        bookMarkTableView.headerView.selectItem(at: IndexPath(item: 1, section: 0), animated: true, scrollPosition: .bottom)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //每次進來觸發點選
        decideSelectedItem()
//        bookMarkTableView.reloadData()
    }
    
    override func loadView() {
        view = bookMarkTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    convenience init(bookMarkData:[BookMarkData]) {
        self.init()
        self.bookMarkDataArray = bookMarkData
    }
}

//排列條件
extension BookMarkVC:ReturnRankCodition{
    func returnRankCodition(condition: RankModel) {
        self.bookMarkTableView.bookMarkRank = condition
    }
}

//刪除cell
extension BookMarkVC:RemoveCell{
    func removeCell() {
        deleteCell()
    }
}

extension BookMarkVC:TriggerClickColor{
    func triggerClickColor() {
        decideSelectedItem()
    }
}


protocol GoToBookMarkPage{
    func goToBookMarkPage(bookMark:BookMarkData)
}

