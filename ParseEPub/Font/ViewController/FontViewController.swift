//
//  FontViewController.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/7.
//

import UIKit

class FontViewController: UIViewController {
    
    //MARK:- model
    var fontData:TextFontRelated!
    
    //MARK:- viewModel
    lazy var headerViewModel = HeaderViewModel(model: fontData)
    lazy var boundaryViewModel = BoundaryViewModel(model: fontData)
    lazy var fontViewModel = TextFontViewModel(model: fontData)
    lazy var pagingModeViewModel = PagingModeViewModel(model: fontData)
    lazy var alignmentStyleViewModel = AlignmentStyleViewModel(model: fontData)
    
    //alertcontroller
    lazy var fonTableView = FonTableView(model: fontData)
    let fontTypeChooseALC = FontTypeChooseALC()
    let pagingModeChooseALC = PagingModeChooseALC()
    let alignmentStyleALC = AlignmentStyleALC()
    
    //MARK: - button action
    @objc func minusTextSize(){
        var textSize = Int(fontData.textSize!)
        textSize! -= 3
        headerViewModel.textSize.value = String(textSize!)
    }
    
    @objc func plusTextSize(){
        var textSize = Int(fontData.textSize!)
        textSize! += 3
        headerViewModel.textSize.value = String(textSize!)
    }
    
    @objc func closeTextSpacing(){
        var textSpacing = fontData.textSpacing
        textSpacing?.removeLast()
        var intTextSpacing = Int(textSpacing!)
        intTextSpacing! -= 1
        headerViewModel.textSpacing.value = "\(String(intTextSpacing!))%"
    }
    
    @objc func sparseTextSpacing(){
        var textSpacing = fontData.textSpacing
        textSpacing?.removeLast()
        var intTextSpacing = Int(textSpacing!)
        intTextSpacing! += 1
        headerViewModel.textSpacing.value = "\(String(intTextSpacing!))%"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with c: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:- constraints
    func setTableViewConstraints(){
        fonTableView.translatesAutoresizingMaskIntoConstraints = false
        fonTableView.heightAnchor.constraint(equalToConstant: fullScreenY * 0.8).isActive = true
        fonTableView.widthAnchor.constraint(equalToConstant: fullScreenX).isActive = true
        fonTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    convenience init(fontData:TextFontRelated) {
        self.init()
        self.fontData = fontData
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fonTableView.delegate = self
        fonTableView.dataSource = self
        view.addSubview(fonTableView)
        setTableViewConstraints()
    }
}
