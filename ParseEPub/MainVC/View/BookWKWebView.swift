//
//  BookWKWebView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/20.
//

import UIKit
import WebKit
import MenuItemKit

class BookWKWebView: WKWebView{
    
    //這兩個之後要設值
    private var underLineColor:CircleColor.ChooseColor = .red
    private var response:String!
    private var state:EditState.state = .create
    private var time:[Int]!
    
    
    var underLineData:UnderLineData{
        return UnderLineData(time:time,state:state,underLineTitle: response, underLineColor: underLineColor, underLineContent: "")
    }
    
    var passSelectedTextDelegate:PassSelectedText?
    //把被選出來的顏色挑出來，存成new array
    var colorArray:[CircleColor.ChooseColor]{ return [.red,.green,.purple,.yellow].filter { $0 != underLineColor}}
    
    func setWKWebViewMenuItem(){
        let moreColorsImage = UIImage(view: CircleFactory.makeThreeViewOverlap(colorOne: colorArray[0], colorTwo: colorArray[1], colorThree: colorArray[2]))
        
        //        //第二層的menuItem
        let moreColorsItem = UIMenuItem(title: "Show More Colors...",image:moreColorsImage) { _ in
            
            let item0Image = UIImage(systemName: "chevron.backward")
            let item1Image = UIImage(view: CircleFactory.makeCircle(color: .red))
            let item2Image = UIImage(view: CircleFactory.makeCircle(color: .green))
            let item3Image = UIImage(view: CircleFactory.makeCircle(color: .purple))
            let item4Image = UIImage(view: CircleFactory.makeCircle(color: .yellow))
            
            let item0 = UIMenuItem(title: "red", image: item0Image) { [self] _ in
                setWKWebViewMenuItem()
            }
            
            let item1 = UIMenuItem(title: "red", image: item1Image) { [self]  _ in
                underLineColor = .red
                setWKWebViewMenuItem()
            }
            let item2 = UIMenuItem(title: "green", image: item2Image) { [self] _ in
                underLineColor = .green
                setWKWebViewMenuItem()
            }
            
            let item3 = UIMenuItem(title: "purple", image: item3Image) { [self] _ in
                underLineColor = .purple
                setWKWebViewMenuItem()
            }
            
            let item4 = UIMenuItem(title: "yellow", image: item4Image) { [self] _ in
                underLineColor = .yellow
                setWKWebViewMenuItem()
            }
            
            UIMenuController.shared.menuItems = [item0,item1,item2,item3,item4]
            UIMenuController.shared.setMenuVisible(true, animated: true)
        }
        
        let colorImage =        UIImage(view: CircleFactory.makeCircle(color: underLineColor))
        let colorImageItem =    UIMenuItem(title: "ColorImage", image: colorImage) { _ in
            print("當前顏色")
        }
        
        let markItem =          UIMenuItem(title: "註記", action:markTheText )
        let shareItem =         UIMenuItem(title: "分享", action:shareText )
        let reportItem =        UIMenuItem(title: "報錯", action:reportError )
        let dictionaryItem =    UIMenuItem(title: "字典", action:searchDictionary )
        let mondicItem =        UIMenuItem(title: "萌典", action:searchMongDictionary )
        let webItem =           UIMenuItem(title: "網頁", action:searchWebPage )
        let wikiItem =          UIMenuItem(title: "維基", action:searchWikiPedia )
        
        //        //將選項放入controller裡
        UIMenuController.shared.menuItems = [moreColorsItem,colorImageItem,markItem,shareItem,reportItem,dictionaryItem,mondicItem,webItem,wikiItem]
        UIMenuController.shared.showMenu(from: self, rect: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    //MARK: - MenuItem's action
    @objc func chooseMoreColor(sender: UIMenuItem){   print(123)}
    
    //拿到註解文字
    @objc func markTheText(sender: UIMenuItem){
        self.evaluateJavaScript("window.getSelection().toString()") { [self] (response, error) in
            guard response != nil && error == nil else {
                return
            }
            //傳送當前number
            self.response = response as? String
            self.time = Date().timeArray
            self.passSelectedTextDelegate?.passSelectedText(underLineDataArray: nil, underLineData: self.underLineData)
        }
    }
    
    @objc func shareText(sender: UIMenuItem){            print("分享")}
    @objc func reportError(sender: UIMenuItem){          print("報錯")}
    @objc func searchDictionary(sender: UIMenuItem){     print("搜尋字典")}
    @objc func searchMongDictionary(sender: UIMenuItem){ print("搜尋萌典")}
    @objc func searchWebPage(sender: UIMenuItem){        print("搜尋網頁")}
    @objc func searchWikiPedia(sender: UIMenuItem){      print("搜尋維基")}
    
    //將預設的拿掉
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        //當self.scrollView.contentOffset >大於時，載入pageIndex + 1的chapter
        //小於是載入pageindex - 1 的chapter
        print(self.scrollView.contentOffset)
    }
    
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        scrollView.alwaysBounceVertical = true
        scrollView.isScrollEnabled = false
        scrollView.bouncesZoom = false
        setWKWebViewMenuItem()
    }
    
    convenience init(color:CircleColor.ChooseColor) {
        self.init()
        self.underLineColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
