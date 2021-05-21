//
//  ContensPVCViewController.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/13.
//

import UIKit

class SideMainPVC: UIPageViewController {
    
    var chapterTitleArray:[String]!
    var chapterPathAray:[String]!
    
    var underLineData:[UnderLineData]!
    var bookMarkData:[BookMarkData]!
    lazy var tableViews = [MenuVC(titleArray: chapterTitleArray, chapterPathArray: chapterPathAray),BookMarkVC(bookMarkData: self.bookMarkData),UnderLineVC(underLineData: self.underLineData)]
    
    
    init(){
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
    }
    
    convenience init(underLineData:[UnderLineData],bookMarkData:[BookMarkData],titleArray:[String],chapterPathArray:[String]) {
        self.init()
        self.chapterTitleArray = titleArray
        self.bookMarkData = bookMarkData
        self.chapterPathAray = chapterPathArray
        self.underLineData = underLineData
        setViewControllers([tableViews[0]], direction: .forward, animated: false, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
//        setViewControllers([tableViews[0]], direction: .forward, animated: false, completion: nil)
//        view.isUserInteractionEnabled = false
        
    }
}

extension SideMainPVC:UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = viewController.view.tag
        return tableViews.indices.contains(index - 1) ? tableViews[index - 1] : nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = viewController.view.tag
        return tableViews.indices.contains(index + 1) ? tableViews[index + 1] : nil
    }
}
