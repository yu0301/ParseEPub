//
//  BookMarkVC + extension tableview delegate.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/4/13.
//

import UIKit

extension BookMarkVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bookMarkTableView.bookMarkData.count + 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            present(bookMarkALC, animated: true, completion: nil)
        case 1...bookMarkTableView.bookMarkData.count :
            let data = self.bookMarkTableView.bookMarkData[indexPath.row - 1]
            goToBookMarkPageDelegate.goToBookMarkPage(bookMark: data)
            //向旁收
            dismiss(animated: true, completion: nil)
        default:
            fatalError()
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookMarksTVCell.cellIdentifier(), for: indexPath) as! BookMarksTVCell
        
        switch indexPath.row{
        case 0:
            cell.upLeftCornerView.removeFromSuperview()
            cell.annotationTextView.removeFromSuperview()
            cell.chapterLabel.removeFromSuperview()
            cell.editButton.removeFromSuperview()
            cell.garbageButton.removeFromSuperview()
        case 1...bookMarkTableView.bookMarkData.count:
            cell.rankImageView.isHidden = true
            cell.rankLabel.isHidden = true
            cell.editButton.addTarget(self, action: #selector(goToEditVC), for: .touchUpInside)
            cell.garbageButton.addTarget(self, action: #selector(deleteCell(sender:)), for: .touchUpInside)
            let array = bookMarkTableView.bookMarkData[indexPath.row - 1]
            cell.upLeftCornerView.dateLabel.text = timeCompare(bookMarkData: array)
            cell.garbageButton.tag = indexPath.row
            cell.editButton.tag = indexPath.row
            cell.upLeftCornerView.bookMarkImageView.tintColor = array.bookMarkColor?.uiColor
            cell.annotationTextView.text = array.bookMarkContent
            cell.upLeftCornerView.chapterTitleLabel.text = array.bookMarkTitle
        default:
            fatalError()
        }
        
        return cell
    }
}
