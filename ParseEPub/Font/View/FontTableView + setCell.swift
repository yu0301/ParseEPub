//
//  FontTableView + setCell.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/10.
//

import Foundation

extension FonTableView{
    //MARK: - set tableViewcell
    func generateHeaderCell(indexPath:IndexPath)->HeaderTableViewCell{
        let cell = dequeueReusableCell(withIdentifier: HeaderTableViewCell.cellIdentifier(), for: indexPath) as! HeaderTableViewCell
        return cell
    }
    
    
    func generateTextArrangementCell(indexPath:IndexPath)->TextArrangementCell{
        let cell = dequeueReusableCell(withIdentifier: TextArrangementCell.cellIdentifier(), for: indexPath) as! TextArrangementCell
        cell.selectedBackgroundView = selectedBackground
        return cell
    }
    
    func generateBoundaryTableViewCell(indexPath:IndexPath)->BoundaryTableViewCell{
        
        let cell = dequeueReusableCell(withIdentifier:BoundaryTableViewCell.cellIdentifier() , for: indexPath) as! BoundaryTableViewCell
        cell.setLeftRightBoundCV(model: model)
        return cell
    }
    
    func generateFontTableViewCell(indexPath:IndexPath)->FontTableViewCell{
        let cell = dequeueReusableCell(withIdentifier: FontTableViewCell.cellIdentifier(), for: indexPath) as! FontTableViewCell
        cell.setup(fontData:model.font!)
        return cell
    }
    
    func generatePagingModeTableViewCell(indexPath:IndexPath)->PagingModeTableViewCell{
        let cell = dequeueReusableCell(withIdentifier: PagingModeTableViewCell.cellIdentifier(), for: indexPath) as! PagingModeTableViewCell
        cell.setup(fontData:model.pagingMode!)
        return cell
    }
    
    func generateAlignmentTableViewCell(indexPath:IndexPath)->AlignmentTableViewCell{
        let cell = dequeueReusableCell(withIdentifier: AlignmentTableViewCell.cellIdentifier(), for: indexPath) as! AlignmentTableViewCell
        return cell
    }
    
    func generateDefaultSetTableViewCell(indexPath:IndexPath)->DefaultSetTableViewCell{
        let cell = dequeueReusableCell(withIdentifier: DefaultSetTableViewCell.cellIdentifier(), for: indexPath) as! DefaultSetTableViewCell
        return cell
    }
    

}

