//
//  FontViewController + delegate datasource.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/8.
//

import UIKit
extension FontViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            break
        case 1:
            break
        case 2:
            break
        case 3:
            present(fontTypeChooseALC, animated: true, completion: nil)
        case 4:
            present(pagingModeChooseALC, animated: true, completion: nil)
        case 5:
            present(alignmentStyleALC, animated: true, completion: nil)
        case 6:
            print(13)
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return fullScreenY * 0.15
        case 1...6:
            return fullScreenY * 0.1
        default:
            fatalError()
        }
    }
    
    //討論，客製化cell，以及邏輯
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let model = UserDefaultData.loadFontData()
            let viewModel = HeaderViewModel(model: model)
            let cell = fonTableView.generateHeaderCell(indexPath: indexPath)
            cell.minusButton.addTarget(self, action: #selector(minusTextSize), for: .touchUpInside)
            cell.plusButton.addTarget(self, action: #selector(plusTextSize), for: .touchUpInside)
            cell.closeButton.addTarget(self, action: #selector(closeTextSpacing), for: .touchUpInside)
            cell.sparseButton.addTarget(self, action: #selector(sparseTextSpacing), for: .touchUpInside)
            cell.setup(viewModel: viewModel.cellModel!)
            return cell
        case 1:
            let cell = fonTableView.generateTextArrangementCell(indexPath: indexPath)
            return cell
        case 2:
            let cell = fonTableView.generateBoundaryTableViewCell(indexPath: indexPath)
            cell.leftRightBoundCV.passTextBorder = { [self] (textBorder) in
                boundaryViewModel.textBorder.value = textBorder
            }
            return cell
        case 3:
            let cell = fonTableView.generateFontTableViewCell(indexPath: indexPath)
            fontTypeChooseALC.passFontStyle = {(fontStyle) in
                cell.fontLabel.text = fontStyle
                self.fontViewModel.textFont.value = fontStyle
            }
            return cell
        case 4:
            let cell = fonTableView.generatePagingModeTableViewCell(indexPath: indexPath)
            pagingModeChooseALC.passPagingMode = {(pagingMMode) in
                cell.fontLabel.text = pagingMMode
                self.pagingModeViewModel.pagingMode.value = pagingMMode
            }
            //通知webview可以滾動，並且取消手勢
            //removegesture
            //isscroll true 切換
            //switch paging mode
            return cell
        case 5:
            let cell = fonTableView.generateAlignmentTableViewCell(indexPath: indexPath)
            alignmentStyleALC.passAlignmentStyle = {(alignmentStyle) in
                cell.fontLabel.text = alignmentStyle
                self.alignmentStyleViewModel.alignmentStyle.value = alignmentStyle
            }
            
            return cell
        case 6:
            let cell = fonTableView.generateDefaultSetTableViewCell(indexPath: indexPath)
            return cell
        default:
            fatalError()
        }
    }
}
