//
//  FonTableView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/8.
//

import UIKit

class FonTableView: UITableView {
    
    var model:TextFontRelated!
    lazy var textFontViewModel = TextFontViewModel(model: model)
    
    var fontStyle:String = ""{
        didSet{
            //執行改變字體那格cell的labeltext
            changeFont(font: self.fontStyle)
            
            model.font = fontStyle
            UserDefaultData.saveFontData(fontData: model)
            textFontViewModel.textFont.value = fontStyle
            //將直傳回去
            //值
        }
    }
    
    var pagingStyle:String = ""{
        didSet{
            //執行改變翻頁模式那格cell的labeltext
            changePaging(paging: self.pagingStyle)
        }
    }
    
    var alaignmentStyle:String = ""{
        didSet{
            changeAlignment(alignment: self.alaignmentStyle)
        }
    }
    
    //取消點選底色
    let selectedBackground:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return view
    }()
    
    //MARK:-改變模式
    func changeFont(font:String){
         let cell = self.cellForRow(at: IndexPath(item: 3, section: 0)) as! FontTableViewCell
        cell.fontLabel.text = font
    }
    
    func changePaging(paging:String){
         let cell = self.cellForRow(at: IndexPath(item: 4, section: 0)) as! PagingModeTableViewCell
        cell.fontLabel.text = paging
    }
    
    func changeAlignment(alignment:String){
         let cell = self.cellForRow(at: IndexPath(item: 5, section: 0)) as! AlignmentTableViewCell
        cell.fontLabel.text = alignment
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.cellIdentifier())
        register(TextArrangementCell.self, forCellReuseIdentifier: TextArrangementCell.cellIdentifier())
        register(BoundaryTableViewCell.self, forCellReuseIdentifier: BoundaryTableViewCell.cellIdentifier())
        register(FontTableViewCell.self, forCellReuseIdentifier: FontTableViewCell.cellIdentifier())
        register(PagingModeTableViewCell.self, forCellReuseIdentifier: PagingModeTableViewCell.cellIdentifier())
        register(AlignmentTableViewCell.self, forCellReuseIdentifier: AlignmentTableViewCell.cellIdentifier())
        register(DefaultSetTableViewCell.self, forCellReuseIdentifier: DefaultSetTableViewCell.cellIdentifier())
        rowHeight = fullScreenY * 0.1
        isScrollEnabled = false
    }
    
    convenience init(model:TextFontRelated) {
        self.init()
        self.model = model
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

