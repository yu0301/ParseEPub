//
//  UnderLineView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/25.
//

import UIKit

class UnderLineEditView: UIView {

    var underLineDtaArray:[UnderLineData]!
    var underLineData:UnderLineData!
    var underLineContent:((String)->Void)?
    var cvBottonAnchor = NSLayoutConstraint()
    var quoteColor:UIColor!
    
    let fakeNavigationBar:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    
    let cancelButton:UIButton = {
        let button = UIButton()
        button.setTitle("取消", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .highlighted)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-semiBold", size: 25)
        return button
    }()
    
    let completeButton:UIButton = {
        let button = UIButton()
        button.setTitle("完成", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .highlighted)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-semiBold", size: 25)
        return button
    }()
    
    var quoteImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "text.quote"))
        return imageView
    }()
    
    let chapterTitleLabel:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-semiBold", size: 25)
        return label
    }()
    
    var annotationTextView:UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.9809144139, green: 0.9119312763, blue: 0, alpha: 1)
        textView.isEditable = true
        textView.isSelectable = true
        return textView
    }()
    
    //重寫，增加可以改變顏色的功能，閉包回傳改變quota tint color
    lazy var colorButtonCV:UnderLineEditCV = {
        let collectionView = UnderLineEditCV()
        return collectionView
    }()
    
    //MARK:-constaints
    func setFakeNavigationBarConstraints(){
        fakeNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fakeNavigationBar.heightAnchor.constraint(equalToConstant: fullScreenY * 0.1),
            fakeNavigationBar.topAnchor.constraint(equalTo: topAnchor),
            fakeNavigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            fakeNavigationBar.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setCancelButtonConstraints(){
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.heightAnchor.constraint(equalToConstant: fullScreenX * 0.1),
            cancelButton.centerYAnchor.constraint(equalTo: fakeNavigationBar.centerYAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: fakeNavigationBar.leadingAnchor,constant: fullScreenX * 0.05)
        ])
    }
    
    func setCompleteButtonConstraints(){
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            completeButton.heightAnchor.constraint(equalToConstant: fullScreenX * 0.1),
            completeButton.centerYAnchor.constraint(equalTo: fakeNavigationBar.centerYAnchor),
            completeButton.trailingAnchor.constraint(equalTo: fakeNavigationBar.trailingAnchor,constant: fullScreenX * -0.05)
        ])
    }
    
    func setQuoteImageViewConstraints(){
        quoteImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quoteImageView.widthAnchor.constraint(equalToConstant: fullScreenX * 0.1),
            quoteImageView.heightAnchor.constraint(equalToConstant: fullScreenX * 0.1),
            quoteImageView.leadingAnchor.constraint(equalTo: cancelButton.leadingAnchor),
            quoteImageView.topAnchor.constraint(equalTo: fakeNavigationBar.bottomAnchor,constant: fullScreenY * 0.05)
        ])
    }
    
    func setChapterTitleLabelConstraints(){
        chapterTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chapterTitleLabel.leadingAnchor.constraint(equalTo: quoteImageView.trailingAnchor),
            chapterTitleLabel.centerYAnchor.constraint(equalTo: quoteImageView.centerYAnchor)
        ])
    }
    
    func setAnnotationTextFieldConstraints(){
        annotationTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            annotationTextView.topAnchor.constraint(equalTo: chapterTitleLabel.bottomAnchor,constant: fullScreenY * 0.05),
            annotationTextView.bottomAnchor.constraint(equalTo: bottomAnchor),
            annotationTextView.widthAnchor.constraint(equalToConstant: fullScreenX * 0.9),
            annotationTextView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setColorButtonCVConstraints(){
        cvBottonAnchor =  colorButtonCV.bottomAnchor.constraint(equalTo: bottomAnchor)
        colorButtonCV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorButtonCV.widthAnchor.constraint(equalToConstant: fullScreenX),
            colorButtonCV.heightAnchor.constraint(equalToConstant: fullScreenX * 0.1),
           cvBottonAnchor
        ])
    }
    
    //MARK: -setView
    
    func setView(){
        addSubview(fakeNavigationBar)
        addSubview(cancelButton)
        addSubview(completeButton)
        addSubview(quoteImageView)
        addSubview(chapterTitleLabel)
        addSubview(annotationTextView)
        
        setFakeNavigationBarConstraints()
        setCancelButtonConstraints()
        setCompleteButtonConstraints()
        setQuoteImageViewConstraints()
        setChapterTitleLabelConstraints()
        setAnnotationTextFieldConstraints()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    convenience init(underLineData:[UnderLineData],underLine:UnderLineData?,state:EditState.state,tag:Int?) {
        self.init()
        //路徑1
        switch state{
        
        case .edit:
            quoteColor = underLineData[tag!].underLineColor?.color
            quoteImageView.tintColor = underLineData[tag!].underLineColor?.color
            chapterTitleLabel.text = underLineData[tag!].underLineTitle
            annotationTextView.text = underLineData[tag!].underLineContent
            
        case .create:
            quoteImageView.tintColor = underLine?.underLineColor?.color
            chapterTitleLabel.text = underLine?.underLineTitle
            annotationTextView.text = underLine?.underLineContent
        }
        
        addSubview(colorButtonCV)
        setColorButtonCVConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
