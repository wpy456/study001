//
//  ViewController.swift
//  study001 001001
//
//  Created by PeiYu Wang on 2019/7/7.
//  Copyright © 2019 PeiYu Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate ,UIPickerViewDataSource,UIPickerViewDelegate {
    //输入框代理实现//输入框内容改变系统回调
    func textField(_ textField:UITextField,shouldChangeCharactersIn range:NSRange,replacementString string:String)->Bool{
        if string.count>0{
            let charas:[Character]=["0","1","2","3","4","5","6","7","8","9"]
            let char=string.first!
            if !charas.contains(char){
                print("请输入数字")
                return false
            }
            if textField.text!.count+string.count>11{
                print("超过11位啦")
                return false
            }
        }
        return true
    }
    //选择器列数--分区
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    //选择器行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }//
    //选择器内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(component)分区\(row)行数据"
    }//选择器行高
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 24
    }
    //选择器行宽
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 120
    }
    //选择值
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(component)分区\(row)行")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //滚动视图
        let frame=self.view.frame
        let scrollView=UIScrollView(frame: CGRect(x: 10, y: 10, width: frame.width-20, height: frame.height-40))
        scrollView.backgroundColor=UIColor.gray
//        scrollView.bounces=true//回弹效果
//        scrollView.alwaysBounceVertical=true//始终竖直回弹
//        scrollView.alwaysBounceHorizontal=true//始终水平回弹
        scrollView.isPagingEnabled=true//分页效果
        scrollView.showsVerticalScrollIndicator=true//竖直滚动条
        scrollView.showsHorizontalScrollIndicator=true//水平滚动条
        scrollView.indicatorStyle = .black//提示条风格
        scrollView.scrollsToTop=true//点击状态栏滚动到顶部
        scrollView.minimumZoomScale=0.5//缩小倍率
        scrollView.maximumZoomScale=2.0//放大倍率
        scrollView.bouncesZoom=true//回弹效果
        
//        let newView=UIView(frame: CGRect(x: 20, y: 10, width: frame.width*2, height: frame.height*2))
//        newView.backgroundColor=UIColor.green
//        scrollView.addSubview(newView)
//        self.view.addSubview(scrollView);
        //文本控件
        let label=UILabel(frame: CGRect(x: 40, y: 0, width: 240, height: 130))
        label.text="Hello World,HelloHello World,HelloHello World,HelloHello World,HelloHello World,Hello "
        label.numberOfLines=0//行数，0:无限换行
        label.lineBreakMode = .byClipping//换行方式
        label.backgroundColor = UIColor.red//背景颜色
        label.font=UIFont.systemFont(ofSize: 24)//字体字号
        label.textColor=UIColor.white//字体颜色
        label.textAlignment = .center//对齐模式// .left  .center  .right
        label.shadowColor=UIColor.green//阴影颜色
        label.shadowOffset=CGSize(width: 2, height: 2)//阴影偏移量
        
        scrollView.addSubview(label)
        
        //按钮控件
        let button_1=UIButton(type: .system)//system:系统类型，custom：自定义，detailDisclosure：详情，contactAdd：添加
        button_1.frame=CGRect(x: 40, y: 150, width: 240, height: 30)
        button_1.backgroundColor = UIColor.red
        button_1.setTitle("电我一下", for:.normal)
        button_1.addTarget(self, action:#selector(changeColor), for:.touchUpInside)
        scrollView.addSubview(button_1)
        
        let button = UIButton(type:.custom)
        button.setBackgroundImage(UIImage(named: "duanxinmoban_wancheng"), for: .normal)//背景图片
        button.setImage(UIImage(named: "wode_VIP"), for: .normal)//图片
        //button.setImage(UIImage(named: "timg"), for: .normal)
        button.frame = CGRect(x: 40, y: 200, width: 240, height: 30)
        button.backgroundColor = UIColor.red
        button.setTitle("电我一下", for:.normal)
        button.addTarget(self, action:#selector(changeColor), for:.touchUpInside)
        button.contentEdgeInsets=UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        button.imageEdgeInsets=UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
        button.titleEdgeInsets=UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)

        scrollView.addSubview(button)

        //文本输入框控件
        let textField = UITextField(frame: CGRect(x: 40, y: 250, width: 240, height: 30))
        textField.borderStyle = .roundedRect//风格
        textField.placeholder = "请输入文字"//提示
        textField.textColor=UIColor.red//字体颜色
        textField.font=UIFont.systemFont(ofSize: 14)//字体大小
        textField.textAlignment = .left//对齐方式
        let imageView=UIImageView(image: UIImage(named: "shouye1"))//
        textField.leftView=imageView//左视图
        textField.leftViewMode = .always//显示模式
        textField.delegate=self//设置代理
        
        scrollView.addSubview(textField)
        
        //开关控件
        let swi=UISwitch(frame: CGRect(x: 40, y: 300, width: 240, height: 30))
        swi.onTintColor=UIColor.green//开启颜色
        swi.tintColor=UIColor.red//关闭颜色
        swi.thumbTintColor=UIColor.orange//按钮颜色
        swi.addTarget(self, action: #selector(changeSelfColor), for: .touchUpInside)//交互
        
        scrollView.addSubview(swi)
        
        //分页控制器
        //self.view.backgroundColor=UIColor.black
        let page=UIPageControl(frame: CGRect(x: 40, y: 350, width: 240, height: 30))
        page.currentPageIndicatorTintColor=UIColor.red//高亮页码点颜色
        page.addTarget(self, action: #selector(changeNum), for: .valueChanged)//交互
        page.numberOfPages=8//页码数量
        
        scrollView.addSubview(page)
        
        //分段控制器
        let items=["one","three","four"]
        let seg=UISegmentedControl(items: items)
        seg.frame=CGRect(x: 40, y: 400, width: 240, height: 30)
        seg.setImage(UIImage(named: "wode_VIP")?.withRenderingMode(.alwaysOriginal), forSegmentAt: 1)//设置按钮图案
        seg.setContentOffset(CGSize(width: 0, height: 0), forSegmentAt: 0)//设置按钮偏移量
        seg.isMomentary=false//切换模式/按钮模式
        seg.addTarget(self, action: #selector(changeClick), for: .valueChanged)
        
        scrollView.addSubview(seg)
        
        //滑块控件
        let slider=UISlider(frame: CGRect(x: 40, y: 450, width: 240, height: 30))
        slider.isContinuous=true//触发是否连续
        slider.minimumValue=0//最小值
        slider.maximumValue=10//最大值
        slider.minimumTrackTintColor=UIColor.red//左颜色
        slider.maximumTrackTintColor=UIColor.green//右颜色
        //slider.thumbTintColor=UIColor.blue//滑块颜色
        slider.minimumValueImage=UIImage(named: "wode_VIP")//左y图
        slider.maximumValueImage=UIImage(named: "wode_VIP")//右图
        slider.setThumbImage(UIImage(named: "wode_VIP"), for: .normal)//滑块图
        slider.addTarget(self, action: #selector(changeValue), for: .valueChanged)//触发
        
        scrollView.addSubview(slider)
        
        //活动指示器控件---风火轮---加载状态
        let indicator=UIActivityIndicatorView(style: .white)//风格
        indicator.center=CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)//位置
        indicator.color=UIColor.red//颜色
        scrollView.addSubview(indicator)
        
        indicator.startAnimating()//开始
        
//        indicator.stopAnimating()//停止
        //进度条控件
        let progressView=UIProgressView(frame:CGRect(x: 40, y: 500, width: 240, height: 30))
        progressView.progressTintColor=UIColor.red//已走过颜色
        progressView.trackTintColor=UIColor.blue//未走过颜色
        scrollView.addSubview(progressView)
        
        progressView.progress=0.5//进度
        
        //步进控制器
        let stepper=UIStepper()
        stepper.center=CGPoint(x: self.view.frame.width/2, y: 550)
        stepper.isContinuous=true//触发是否连续执行
        stepper.autorepeat=true//值知否连续改变
        stepper.wraps=true//值知否循环
        stepper.minimumValue=1//最小值
        stepper.maximumValue=10//最大值
        stepper.stepValue=1//步长
        stepper.tintColor=UIColor.red//颜色
//        stepper.setDecrementImage(UIImage(named: "wode_VIP")?.withRenderingMode(.alwaysOriginal), for: .normal)
//        stepper.setIncrementImage(UIImage(named: "wode_VIP")?.withRenderingMode(.alwaysOriginal), for: .normal)
        stepper.addTarget(self, action: #selector(onClick), for: .valueChanged)
        
        scrollView.addSubview(stepper)
        
        //选择控制器
        let picker=UIPickerView(frame: CGRect(x: 40, y: 600, width: 280, height: 150))
        picker.delegate=self
        picker.dataSource=self
        
        scrollView.addSubview(picker)
        
        //通过calayer对视图进行修饰
        let btn=UIButton(type: .custom)
        btn.frame=CGRect(x: 40, y: 800, width: 240, height: 30)
        btn.backgroundColor=UIColor.red
        btn.layer.masksToBounds=true//对视图边界修饰
        btn.layer.cornerRadius=10
        btn.layer.borderColor=UIColor.green.cgColor
        btn.layer.borderWidth=1
        btn.layer.shadowColor=UIColor.gray.cgColor
        btn.layer.shadowOffset=CGSize(width: 10, height: 10)
        btn.layer.shadowOpacity=0.5
        scrollView.addSubview(btn)
        //警告控制器
        //搜索栏控件
        let searchBar=UISearchBar(frame: CGRect(x: 40, y: 750, width: 280, height: 30))
        searchBar.tintColor=UIColor.red
        searchBar.placeholder="请输入搜索内容"
        searchBar.showsScopeBar=true
        searchBar.showsCancelButton=true
        searchBar.showsBookmarkButton=true
        searchBar.showsSearchResultsButton=true
        searchBar.scopeButtonTitles=["one","two","three"]
        self.view.addSubview(searchBar)
        //日期时间选择器
        let datePicker=UIDatePicker(frame: CGRect(x: 40, y: 400, width: 280, height: 150))
        datePicker.datePickerMode = .time
        datePicker.addTarget(self, action: #selector(selector), for: .valueChanged)
        self.view.addSubview(datePicker)
        
        self.view.addSubview(scrollView);
    }
    @objc func selector(datePicker:UIDatePicker){
        print(datePicker.date)
    }
    //步进
    @objc func onClick(stepper:UIStepper){
        print(stepper.value)
    }
    //滑块交互
    @objc func changeValue(slider:UISlider) {
        print(slider.value)
    }
    @objc func changeColor(){
        self.view.backgroundColor=UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
        
    }
//开关控件交互
    @objc func changeSelfColor(swi:UISwitch){
        if(swi.isOn){
            self.view.backgroundColor=UIColor.red
        }else{
            self.view.backgroundColor=UIColor.white
        }
    }
    //页码交互
    @objc func changeNum(page:UIPageControl){
        print(page.currentPage)
    }
    //分段交互
    @objc func changeClick(seg:UISegmentedControl){
        print(seg.selectedSegmentIndex)
        if(seg.selectedSegmentIndex==1){
            seg.insertSegment(withTitle: "new1", at: 2, animated: true)
        }
        if(seg.selectedSegmentIndex==2){
            seg.removeSegment(at: 2, animated: true)
        }
        if(seg.selectedSegmentIndex==3){
            seg.setTitle("new", forSegmentAt: 3)
        }
        if(seg.selectedSegmentIndex==4){
            //seg.removeAllSegments()
            seg.setWidth(130, forSegmentAt: 4)
        }
        if(seg.selectedSegmentIndex==5){
            //seg.removeAllSegments()
            seg.apportionsSegmentWidthsByContent=true
        }
    }
    //警告控制器。 警告框。活动列表
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                let alertView=UIAlertController(title: "标题", message: "警告的内容", preferredStyle:.alert)
               // let alertView=UIAlertController(title: "标题", message: "警告的内容", preferredStyle:.actionSheet)
                let action=UIAlertAction(title: "按钮1", style: .default, handler: {(UIAlertAction)->Void in
                    print("click1")
                })
                let action2=UIAlertAction(title: "按钮2", style: .default, handler: {(UIAlertAction)->Void in
                    print("click2")
                })
                let action3=UIAlertAction(title: "按钮3", style: .default, handler: {(UIAlertAction)->Void in
                    print("click3")
                })
                alertView.addAction(action)
                alertView.addAction(action2)
                alertView.addAction(action3)
                alertView.addTextField{(textfield)in
                    textfield.placeholder="place"
                }
                self.present(alertView,animated: true,completion: nil)
        
        
//        let actionSheet = UIAlertController(title: "标题", message: "内容", preferredStyle: .actionSheet)
//        let action = UIAlertAction(title: "one", style: .destructive, handler: {(UIAlertAction) -> Void in
//            print("one")
//        })
//        let action2 = UIAlertAction(title: "two", style: .default, handler: {(UIAlertAction) -> Void in
//            print("two")
//        })
//        let action3 = UIAlertAction(title: "three", style: .cancel, handler: {(UIAlertAction) -> Void in
//            print("three")
//        })
//        actionSheet.addAction(action)
//        actionSheet.addAction(action2)
//        actionSheet.addAction(action3)
//        self.present(actionSheet, animated: true, completion: nil)
        
    }
 
    
    
}
