//
//  UnderLineVC.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/25.
//

import UIKit

class UnderLineVC: UIViewController {
    
    lazy var underLineTableView = UnderLineTableView(underLineData:self.underLineDataArray)
    let underLineALC = UnderLineALC()
    var deleteCellTag:Int?
    var underLineDataArray:[UnderLineData]!
//    var underLineData:UnderLineData!
    var circleColor:CircleColor.ChooseColor = .allColor
    
    //MARK: - 時間判斷
    func timeCompare(underLineData:UnderLineData)->String{
        let nowTime = Date().timeArray
        let dataTime = underLineData.time
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
    //MARK: - button ation
    
    @objc func goToEditVC(sender:UIButton){
        
        //indexPath?
        let tag = sender.tag - 1
        let vc = UnderLineEditVC( underLineData: underLineTableView.underLineDataArray, underLine: nil, tag: tag)
        vc.triggerClickColorDelegate = self
        vc.reloadTableView = { [self] in
            underLineTableView.reloadData()
        }
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    
    @objc func deleteCell(sender:UIButton){
        deleteCellTag = sender.tag
        let alc = DeleteBookMarkALC()
        alc.message = "是否刪除該筆劃線"
        alc.removeCellDelegate = self
        present(alc, animated: false, completion: nil)
    }
    
    //根據delete tag刪除資料
    func deleteCell(){
        guard deleteCellTag != nil else{return}
        //根據點選時的tag去刪除該位置的cell
        underLineTableView.underLineDataArray.remove(at: deleteCellTag! - 1)
        underLineTableView.deleteRows(at: [IndexPath(row: deleteCellTag!, section: 0)], with: .none)
        underLineTableView.reloadData()
        UserDefaultData.saveUnderLineData(underLineArray: underLineTableView.underLineDataArray)
        //發通知告訴主頁，更新資料
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadTV"), object: nil)
    }
    
    func decideSelectedItem(){
        switch circleColor{
        case .white:
            print("blank")
        case .allColor:
            self.collectionView(underLineTableView.headerView, didSelectItemAt: IndexPath(item: 1, section: 0))
        case .blue:
            print("no blue")
        case .red:
            self.collectionView(underLineTableView.headerView, didSelectItemAt: IndexPath(item: 2, section: 0))
        case .green:
            self.collectionView(underLineTableView.headerView, didSelectItemAt: IndexPath(item: 4, section: 0))
        case .purple:
            self.collectionView(underLineTableView.headerView, didSelectItemAt: IndexPath(item: 5, section: 0))
        case .yellow:
            self.collectionView(underLineTableView.headerView, didSelectItemAt: IndexPath(item: 3, section: 0))
        }
    }
    
    func setView(){
        underLineALC.returnRankCoditionDelegate = self
        underLineTableView.delegate = self
        underLineTableView.dataSource = self
        underLineTableView.headerView.delegate = self
        underLineTableView.headerView.dataSource = self
//        self.collectionView(underLineTableView.headerView, didSelectItemAt: IndexPath(item: 1, section: 0))
        
        underLineTableView.headerView.selectItem(at: IndexPath(item: 1, section: 0), animated: true, scrollPosition: .bottom)
    }
    
    convenience init(underLineData:[UnderLineData]) {
        self.init()
        self.underLineDataArray = underLineData
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //每次進來觸發點選
        decideSelectedItem()
    }
    
    override func loadView() {
        view = underLineTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tag = 2
        setView()
    }
}

extension UnderLineVC:ReturnRankCodition{
    func returnRankCodition(condition: RankModel) {
        self.underLineTableView.underLineRank = condition
    }
}

//delete cell
extension UnderLineVC:RemoveCell{
    func removeCell() {
        deleteCell()
    }
}

extension UnderLineVC:TriggerClickColor{
    func triggerClickColor() {
        decideSelectedItem()
    }
}
