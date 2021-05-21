//
//  UnderLineEditVC.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/19.
//

import UIKit

class UnderLineEditVC: UIViewController {
   
    var underLineDataArray = [UnderLineData]()
    var underLineData:UnderLineData?
    var state:EditState.state!
    var tag:Int?
    var triggerClickColorDelegate:TriggerClickColor?
    var reloadTableView:(()->Void)?
    
    
    lazy var underLineEditView = UnderLineEditView(underLineData: underLineDataArray, underLine: underLineData,state:state,tag:tag)
    
    //MARK:-select color
    func selectColor(underLineData:UnderLineData){
        let selectedcColor = underLineData.underLineColor
        let colorArray = underLineEditView.colorButtonCV.colorArray
        let index = colorArray.firstIndex { (color) -> Bool in
            return color == selectedcColor
        }
        let colorIndexPath = IndexPath(item: index!, section: 0)
        underLineEditView.colorButtonCV.selectItem(at: colorIndexPath, animated: true, scrollPosition: .bottom)
    }
    
    //MARK: - button action
    
    @objc func saveUnderLineData(){
        //從單一顏色去編輯會有其他的element消失的問題<
        switch state{
        case .edit:
            //解決點選單一顏色消除其他顏色的問題
            var data = UserDefaultData.loadUnderLineData()
            //找出修改的元素index
            let index = data.firstIndex { (UnderLineData) -> Bool in
                UnderLineData.time == self.underLineData?.time
            }
            //把改完後的資料放入相對應的位置再存檔
                data[index!] = self.underLineData!
                UserDefaultData.saveUnderLineData(underLineArray: data)
            //觸發點選顏色，使之重新排列
            triggerClickColorDelegate?.triggerClickColor()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadTV"), object: nil)
            dismiss(animated: true, completion: nil)
        case .create:
            underLineDataArray.append(self.underLineData!)
            UserDefaultData.saveUnderLineData(underLineArray: underLineDataArray)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadTV"), object: nil)
            dismiss(animated: true, completion: nil)
        case .none:
            print(123)
        }
    }
    
    @objc func backToBookMarksTVC(){
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- return data
    func returnEditData(){
        //回傳顏色
        underLineEditView.colorButtonCV.passSelectedColor = { [self](color) in
            underLineEditView.quoteImageView.tintColor = color
            underLineData?.underLineColor = color.colorToCircleColorChooseColor()
        }
        //回傳內容
        underLineEditView.underLineContent = { [self](content) in
            underLineData?.underLineContent = content
        }
    }
    
    //MARK:- setunderEditView
    func setUnderLineEditView(){
        underLineEditView.annotationTextView.delegate = self
        underLineEditView.cancelButton.addTarget(self, action: #selector(backToBookMarksTVC), for: .touchUpInside)
        underLineEditView.completeButton.addTarget(self, action: #selector(saveUnderLineData), for: .touchUpInside)
    }
    
    override func loadView() {
        view = underLineEditView
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    convenience init(underLineData:[UnderLineData],underLine:UnderLineData?,tag:Int?) {
        self.init()

        
        //如果是單一顏色，則此時的array只剩下該顏色的elements
        //nuderdefault
        self.underLineDataArray = underLineData
        if underLine != nil{
            self.state = underLine?.state
            self.underLineData = underLine
            selectColor(underLineData: underLine!)
        }else{
            self.state = .edit
            self.tag = tag
            self.underLineData = underLineData[tag!]
            selectColor(underLineData: underLineData[tag!])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setUnderLineEditView()
        returnEditData()
        //鍵盤
        underLineEditView.colorButtonCV.bindTokeyboaed()
    }
}

extension UnderLineEditVC:UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        underLineEditView.underLineContent!(textView.text)
    }
}

protocol TriggerClickColor{
    func triggerClickColor()
}
