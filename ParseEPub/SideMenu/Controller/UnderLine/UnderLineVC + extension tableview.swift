//
//  UnderLineVC + extension tableview.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/26.
//

import UIKit

extension UnderLineVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return underLineTableView.underLineDataArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            present(underLineALC, animated: true, completion: nil)
        case 1...underLineTableView.underLineDataArray.count:
            break
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UnderLineTVCell.cellIdentifier(), for: indexPath) as! UnderLineTVCell
        switch indexPath.row{
        case 0:
            cell.quoteImageView.isHidden         = true
            cell.dateLabel.isHidden              = true
            cell.annotationTextView.isHidden     = true
            cell.dateLabel.isHidden              = true
            cell.garbageButton.isHidden          = true
            cell.editButton.isHidden             = true
            cell.shareButton.isHidden            = true
            cell.underLineContentView.isHidden   = true
        case 1...underLineTableView.underLineDataArray.count :
            //根據當前顏色選擇畫面
            cell.rankLabel.isHidden          = true
            cell.rankImageView.isHidden      = true
            cell.editButton.addTarget(self, action: #selector(goToEditVC), for: .touchUpInside)
            cell.garbageButton.addTarget(self, action: #selector(deleteCell(sender:)), for: .touchUpInside)
            let array = underLineTableView.underLineDataArray[indexPath.row - 1]
            print("this is\(underLineTableView.underLineDataArray)")
            cell.dateLabel.text = timeCompare(underLineData: array)
            cell.editButton.tag = indexPath.row
            cell.garbageButton.tag = indexPath.row
            cell.quoteImageView.tintColor = array.underLineColor?.color
            cell.annotationTextView.text = array.underLineTitle
            cell.underLineContentView.contentLabel.text = array.underLineContent
        default:
            fatalError()
        }
        return cell
    }
}
    
