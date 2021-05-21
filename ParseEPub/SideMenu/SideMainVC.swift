//
//  ContentsMainVCViewController.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/13.
//

import UIKit
//view拆出去
class SideMainVC: UIViewController {
    
    var contentViewOneleftAnchor = NSLayoutConstraint()
    var contentViewTwoleftAnchor = NSLayoutConstraint()
    
    var chapterTitleArray:[String]!
    var chapterPathAray:[String]!
    
    lazy var sideMenuCVC = SideMainCVC(collectionViewLayout: layout)
    lazy var sideMenuPVC = SideMainPVC(underLineData: self.underLineData, bookMarkData: self.bookMarkData,titleArray: chapterTitleArray,chapterPathArray: chapterPathAray)
    
    var underLineData:[UnderLineData]!
    var bookMarkData:[BookMarkData]!
    
    let contentViewOne = UIView()
    let contentViewTwo = UIView()
    
    
    //MARK: - layout
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: fullScreenX * 0.266, height: fullScreenY * 0.1)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    //MARK:- constraints
    
    func setContentsOneViewConstraints(){
        contentViewOne.translatesAutoresizingMaskIntoConstraints = false
        contentViewOneleftAnchor = contentViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: fullScreenX * -0.8)
        NSLayoutConstraint.activate([
            contentViewOneleftAnchor,
            contentViewOne.widthAnchor.constraint(equalToConstant: fullScreenX * 0.8) ,
            contentViewOne.heightAnchor.constraint(equalToConstant: fullScreenY * 0.1),
            contentViewOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: fullScreenX * 1)
        ])
    }
    
    func setSideMenuCVCConstraints(){
        sideMenuCVC.collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sideMenuCVC.collectionView.topAnchor.constraint(equalTo: contentViewOne.topAnchor),
            sideMenuCVC.collectionView.bottomAnchor.constraint(equalTo: contentViewOne.bottomAnchor),
            sideMenuCVC.collectionView.leadingAnchor.constraint(equalTo: contentViewOne.leadingAnchor),
            sideMenuCVC.collectionView.trailingAnchor.constraint(equalTo: contentViewOne.trailingAnchor)
        ])
    }
    
    func setContentViewTwoConstraints(){
        contentViewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        contentViewTwoleftAnchor = contentViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: fullScreenX * -0.8)
        NSLayoutConstraint.activate([
            contentViewTwoleftAnchor,
            contentViewTwo.widthAnchor.constraint(equalToConstant: fullScreenX * 0.8) ,
            contentViewTwo.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentViewTwo.topAnchor.constraint(equalTo: contentViewOne.bottomAnchor),
        ])
    }
    
    func setSideMenuPVCConstraints(){
        sideMenuPVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sideMenuPVC.view.topAnchor.constraint(equalTo: contentViewTwo.topAnchor),
            sideMenuPVC.view.bottomAnchor.constraint(equalTo: contentViewTwo.bottomAnchor),
            sideMenuPVC.view.leadingAnchor.constraint(equalTo: contentViewTwo.leadingAnchor),
            sideMenuPVC.view.trailingAnchor.constraint(equalTo: contentViewTwo.trailingAnchor)
        ])
        
    }
    
    //側邊選單出現動畫
    func showAnimate(){
        contentViewOneleftAnchor.constant = 0
        //        contentViewOneleftAnchor.priority = 1
        contentViewTwoleftAnchor.constant = 0
        UIView.animate(withDuration: 0.2) { [self] in
            view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.8)
            self.view.layoutIfNeeded()
        }
    }
    
    //側邊選單返回動畫
    func showBackAnimate(){
        contentViewOneleftAnchor.constant = fullScreenX * -0.8
        contentViewTwoleftAnchor.constant = fullScreenX * -0.8
        UIView.animate(withDuration: 0.2) { [self] in
            view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0)
            self.view.layoutIfNeeded()
        }
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { (timer) in
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchesPosition = touches.first!.location(in: view)
        let limitedPosition = CGPoint(x: fullScreenX * 0.8, y: 0)
        
        if touchesPosition.x > limitedPosition.x{
            showBackAnimate()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.layoutIfNeeded()
        showAnimate()
    }
    
    convenience init(underLinedate:[UnderLineData],bookMarkData:[BookMarkData],titleArray:[String],chapterPathArray:[String]) {
        self.init()
        self.underLineData = underLinedate
        self.bookMarkData = bookMarkData
        self.chapterTitleArray = titleArray
        self.chapterPathAray = chapterPathArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //contentview
        contentViewOne.backgroundColor = #colorLiteral(red: 0.9809144139, green: 0.9119312763, blue: 0, alpha: 1)
        contentViewTwo.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        view.addSubview(contentViewOne)
        view.addSubview(contentViewTwo)
        setContentsOneViewConstraints()
        setContentViewTwoConstraints()
        
        
        //collectionview
        addChild(sideMenuCVC)
        sideMenuCVC.didMove(toParent: self)
        contentViewOne.addSubview(sideMenuCVC.collectionView)
        setSideMenuCVCConstraints()
        
        //pageview
        addChild(sideMenuPVC)
        sideMenuPVC.didMove(toParent: self)
        contentViewTwo.addSubview(sideMenuPVC.view)
        setSideMenuPVCConstraints()
        
        sideMenuCVC.pagingToThePageDelegate = self
    }
}

extension SideMainVC:PagingToThePage{
    func pagingToThePage(page: Int) {
        sideMenuPVC.setViewControllers([sideMenuPVC.tableViews[page]], direction: .forward, animated: false, completion: nil)
    }
}

