//
//  EditViewController.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/16.
//

import UIKit

class BookMarkEditVC: UIViewController {
    
    var bookMarkDataArray = [BookMarkData]()
    var chapterIndex:Int?
    var heightIndex:Int?
    var bookMarkData:BookMarkData?
    var state:EditState.state!
    var tag:Int?
    var triggerClickColorDelegate:TriggerClickColor?
    lazy var bookMarkEditView = BookMarkEditView(bookMarkArray: self.bookMarkDataArray, bookMarkData: self.bookMarkData, state: state, tag: tag)
    
    //MARK:- select color
    func selectColor(bookMarkData:BookMarkData){
        let selectedcColor = bookMarkData.bookMarkColor
        let colorArray = bookMarkEditView.colorButtonCV.colorArray
        let index = colorArray.firstIndex { (color) -> Bool in
            return color.color == selectedcColor?.uiColor
        }
        let colorIndexPath = IndexPath(item: index!, section: 0)
        bookMarkEditView.colorButtonCV.selectItem(at: colorIndexPath, animated: true, scrollPosition: .bottom)
    }
    //MARK: - button action
    
    @objc func saveBookMarkData(){
        switch state{
        case .edit:
//            bookMarkDataArray[self.tag!] = self.bookMarkData!
            var data = UserDefaultData.loadBookMarkData()
            //找出修改的元素index
            let index = data.firstIndex { (BookMarkData) -> Bool in
                BookMarkData.time == self.bookMarkData?.time
            }
            //把改完後的資料放入相對應的位置再存檔
                data[index!] = self.bookMarkData!
            UserDefaultData.saveBookMarkData(bookMakArray: data)
            triggerClickColorDelegate?.triggerClickColor()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadtv"), object: nil)
            dismiss(animated: true, completion: nil)
        case .create:
            bookMarkDataArray.append(self.bookMarkData!)
            UserDefaultData.saveBookMarkData(bookMakArray: bookMarkDataArray)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadtv"), object: nil)
            dismiss(animated: true, completion: nil)
        case .none:
            print(123)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func backToBookMarksTVC(){
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- return data
    func returnEditData(){
        //回傳顏色
        bookMarkEditView.colorButtonCV.passSelectedColor = { [self](color) in
            bookMarkEditView.bookMarkImageView.tintColor = color
            bookMarkData?.bookMarkColor = .init(uiColor: color)
        }
        //回傳內容
        bookMarkEditView.bookMarkContent = { [self](content) in
            bookMarkData?.bookMarkContent = content
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func loadView() {
        view = bookMarkEditView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        bookMarkEditView.annotationTextView.delegate = self
        bookMarkEditView.cancelButton.addTarget(self, action: #selector(backToBookMarksTVC), for: .touchUpInside)
        bookMarkEditView.completeButton.addTarget(self, action: #selector(saveBookMarkData), for: .touchUpInside)
        returnEditData()
        bookMarkEditView.colorButtonCV.bindTokeyboaed()
    }
    
    //進來的全是編輯模式，修改
    convenience init(bookMarkDataArray:[BookMarkData]?,bookMarkData:BookMarkData?,tag:Int?) {
        self.init()
        self.bookMarkDataArray = bookMarkDataArray!
        
        
        if bookMarkData != nil{
            //創造模式
            self.state = bookMarkData?.state
            self.chapterIndex = bookMarkData?.chapterIndex
            self.heightIndex = bookMarkData?.heightIndex
            self.bookMarkData = bookMarkData
            selectColor(bookMarkData: bookMarkData!)
        }else{
            //編輯模式
            self.state = .edit
            self.tag = tag
            self.chapterIndex = bookMarkDataArray![tag!].chapterIndex
            self.heightIndex = bookMarkDataArray![tag!].heightIndex
            self.bookMarkData = bookMarkDataArray![tag!]
            selectColor(bookMarkData: bookMarkDataArray![tag!])
        }
    }
}

extension BookMarkEditVC:UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        bookMarkEditView.bookMarkContent!(textView.text)
    }
}
