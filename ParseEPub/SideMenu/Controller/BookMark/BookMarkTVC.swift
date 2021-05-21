//
//  BookMarksTVCTableViewController.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/13.
//

//import UIKit
//
//class BookMarkTVC: UITableViewController {
//
//    let bookMarkALC = BookMarkALC()
//    var deleteCellTag:Int?
//    
//    //cell數
//    var row = [1,1,1]
//    
//    var bookMarkRank = "依時間 (新到舊)"{
//        didSet{
//             let cell = tableView.cellForRow(at:IndexPath(item: 0, section: 0)) as! BookMarksTVCell
//            
//            cell.rankLabel.text = bookMarkRank
//            tableView.reloadData()
//        }
//    }
//    
//    var annotation = ""{
//        didSet{
//            let cell = tableView.cellForRow(at:IndexPath(item: row.count - 1, section: 0)) as! BookMarksTVCell
//            cell.annotationTextView.text = annotation
//            tableView.reloadData()
//        }
//    }
//    
//    let headerView:BookMarkHeaderCV = {
//        let headerView = BookMarkHeaderCV(frame: CGRect(x: 0, y: 0, width: fullScreenX * 0.8, height: fullScreenY * 0.05))
//        return headerView
//    }()
//    
//    let footerView = UIView()
//    
//    let oneLabel:UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.text = "暫時沒有書籤"
//        return label
//    }()
//    
//    let twoLabel:UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.text = "無符合篩選條件的書籤"
//        return label
//    }()
//    
//    //MARK:- button action
//    @objc func goToEditVC(){
//        let vc = BoorMarkEditVC()
////        vc.returnTheAnnotationDelegate = self
//        vc.modalPresentationStyle = .overCurrentContext
//        present(vc, animated: true, completion: nil)
//    }
//    
//    @objc func deleteCell(sender:UIButton){
//        deleteCellTag = sender.tag
//        let alc = DeleteBookMarkALC()
//        alc.message = "是否刪除該筆書籤"
////        alc.removeCellDelegate = self
//        present(alc, animated: false, completion: nil)
//    }
//    
//    func deleteCell(){
//        guard deleteCellTag != nil else{return}
//        row.remove(at: deleteCellTag!)
//        tableView.deleteRows(at: [IndexPath(row: deleteCellTag!, section: 0)], with: .automatic)
//    }
//    
////    MARK: -constraints
//    
//    func setOneLabelConstraints(){
//        oneLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            oneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            oneLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
//    }
//    
//    func setTwoLabelConstraints(){
//        twoLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            twoLabel.topAnchor.constraint(equalTo: oneLabel.bottomAnchor,constant: fullScreenY * 0.03),
//            twoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        tableView.reloadData()
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        bookMarkALC.returnRankCoditionDelegate = self
//        view.tag = 1
//        tableView.tableHeaderView = headerView
//        tableView.tableFooterView = footerView
//        tableView.register(BookMarksTVCell.self, forCellReuseIdentifier: BookMarksTVCell.cellIdentifier())
//        view.addSubview(oneLabel)
//        view.addSubview(twoLabel)
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 100
//        setOneLabelConstraints()
//        setTwoLabelConstraints()
//    
//    
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch indexPath.row {
//        case 0:
//            present(bookMarkALC, animated: true, completion: nil)
//        case 0...2:
//           break
//        default:
//            fatalError()
//        }
//    }
//    
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//    
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: BookMarksTVCell.cellIdentifier(), for: indexPath) as! BookMarksTVCell
//        switch indexPath.row{
//        case 0:
//            cell.upLeftCornerView.isHidden = true
//            cell.annotationTextView.isHidden = true
//            cell.chapterLabel.isHidden = true
//            cell.editButton.isHidden = true
//            cell.garbageButton.isHidden = true
//        case 1...row.count:
//            cell.rankImageView.isHidden = true
//            cell.rankLabel.isHidden = true
////            cell.annotationTextView.text = annotation
//            cell.garbageButton.tag = indexPath.row
//            cell.editButton.addTarget(self, action: #selector(goToEditVC), for: .touchUpInside)
//            cell.garbageButton.addTarget(self, action: #selector(deleteCell(sender:)), for: .touchUpInside)
//        default:
//            fatalError()
//        }
//        
//        return cell
//    }
//}
//}
////排列條件
////extension BookMarkVC:ReturnRankCodition{
////    func returnRankCodition(condition: String) {
////        self.bookMarkRank = condition
////    }
////}
//
////註解內容
//
//
////刪除cell
////extension BookMarkVC:RemoveCell{
////    func removeCell() {
////        deleteCell()
////    }
////}
//
////}
