//
//  BackGroundViewController.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/10.
//

import UIKit

class BackGroundVC: UIViewController {
    
    var changeBackGroundColorDelegate:ChangeBackGroundColor?
    var data:TextFontRelated!
    lazy var backGroundModel = BackGroundViewModel(model: data!)
    let contentView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return view
    }()
    
    //    let bgStackView = BackGroundStackView()
    lazy var firsrBackGroundCV = FirstBackGroundCV(data: data)
    lazy var moreColorView = MoreColorView(data: data)
    
    lazy var lightSlider:UISlider = {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 1
        slider.isContinuous = true
        slider.value = (data?.colorLightIndex)!
        return slider
    }()
    
    
    let rightSun = UIImageView(image: UIImage(systemName: "sun.max"))
    let leftSun = UIImageView(image: UIImage(systemName: "sun.max"))
    
    //MARK:- button action
    @objc func changeTheBrightness(sender:UISlider){
        backGroundModel.colorLightIndex.value = sender.value
    }
    
    //MARK: -constraints
    func setContenViewConstraints(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.widthAnchor.constraint(equalToConstant: fullScreenX).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: fullScreenY * 0.2).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setLeftSunConstraints(){
        leftSun.translatesAutoresizingMaskIntoConstraints = false
        leftSun.widthAnchor.constraint(equalToConstant: fullScreenX * 0.05).isActive = true
        leftSun.heightAnchor.constraint(equalToConstant: fullScreenX * 0.05).isActive = true
        leftSun.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant:  fullScreenX * 0.035).isActive = true
        leftSun.centerYAnchor.constraint(equalTo: lightSlider.centerYAnchor).isActive = true
    }
    
    func setRightSunConstraints(){
        rightSun.translatesAutoresizingMaskIntoConstraints = false
        rightSun.widthAnchor.constraint(equalToConstant: fullScreenX * 0.07).isActive = true
        rightSun.heightAnchor.constraint(equalToConstant: fullScreenX * 0.07).isActive = true
        rightSun.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant:  fullScreenX * -0.035).isActive = true
        rightSun.centerYAnchor.constraint(equalTo: lightSlider.centerYAnchor).isActive = true
    }
    
    func setFirsrBackGroundCVConstraints(){
        firsrBackGroundCV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firsrBackGroundCV.widthAnchor.constraint(equalToConstant: fullScreenX * 0.9),
            firsrBackGroundCV.heightAnchor.constraint(equalToConstant: fullScreenY * 0.065),
            firsrBackGroundCV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firsrBackGroundCV.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: fullScreenY * -0.025)
        ])
    }
    
    func setLightSliderConstraints(){
        lightSlider.translatesAutoresizingMaskIntoConstraints = false
        lightSlider.widthAnchor.constraint(equalToConstant: fullScreenX * 0.7).isActive = true
        lightSlider.heightAnchor.constraint(equalToConstant: fullScreenY * 0.05).isActive = true
        lightSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lightSlider.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: fullScreenY * -0.025).isActive = true
    }
    
    func setMoreColorViewConstraints(){
        moreColorView.translatesAutoresizingMaskIntoConstraints = false
        moreColorView.widthAnchor.constraint(equalToConstant: fullScreenX * 1).isActive = true
        moreColorView.heightAnchor.constraint(equalToConstant: fullScreenY * 1).isActive = true
        moreColorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        moreColorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if moreColorView.isHidden {
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(contentView)
        view.addSubview(moreColorView)
        contentView.addSubview(leftSun)
        contentView.addSubview(rightSun)
        contentView.addSubview(firsrBackGroundCV)
        contentView.addSubview(lightSlider)
        
       
        setContenViewConstraints()
        setFirsrBackGroundCVConstraints()
        setLightSliderConstraints()
        setMoreColorViewConstraints()
        setLeftSunConstraints()
        setRightSunConstraints()
        moreColorView.isHidden = true
        firsrBackGroundCV.delegate = self
        moreColorView.secondBackGroundCV.delegate = self
        lightSlider.addTarget(self, action: #selector(changeTheBrightness), for: .valueChanged)
    }
    
    convenience init(data:TextFontRelated) {
        self.init()
        self.data = data
    }

}

protocol ChangeBackGroundColor{
    func changeBackGroundColor(color:String)
}
