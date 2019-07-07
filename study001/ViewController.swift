//
//  ViewController.swift
//  study001 001
//
//  Created by PeiYu Wang on 2019/7/7.
//  Copyright © 2019 PeiYu Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate ,UIPickerViewDataSource,UIPickerViewDelegate {
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
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(component)分区\(row)行数据"
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 144
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(component)分区\(row)行")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //文本控件
        let label=UILabel(frame: CGRect(x: 40, y: 50, width: 240, height: 30))
        label.text="Hello World,Hello World,Hello World,Hello World"
        label.numberOfLines=0
        label.backgroundColor = UIColor.red
        self.view.addSubview(label)
        //按钮控件
        let button = UIButton(type:.custom)
        button.setBackgroundImage(UIImage(named: "timg"), for: .normal)
        //button.setImage(UIImage(named: "timg"), for: .normal)
        button.frame = CGRect(x: 40, y: 100, width: 240, height: 30)
        button.backgroundColor = UIColor.red
        button.setTitle("电我一下", for:.normal)
        button.addTarget(self, action:#selector(changeColor), for:.touchUpInside)
        self.view.addSubview(button)
        //文本输入框控件
        let textField = UITextField(frame: CGRect(x: 40, y: 150, width: 240, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder = "请输入文字"
        textField.textColor=UIColor.red
        textField.font=UIFont.systemFont(ofSize: 14)
        textField.textAlignment = .center
        let imageView=UIImageView(image: UIImage(named: "timg-4"))
        textField.leftView=imageView
        textField.leftViewMode = .always
        textField.delegate=self
        self.view.addSubview(textField)
        //开关控件
        let swi=UISwitch(frame: CGRect(x: 40, y: 200, width: 240, height: 30))
        swi.onTintColor=UIColor.green
        swi.tintColor=UIColor.red
        swi.thumbTintColor=UIColor.orange
        swi.addTarget(self, action: #selector(changeSelfColor), for: .touchUpInside)
        self.view.addSubview(swi)
        //分页控制器
        //self.view.backgroundColor=UIColor.black
        let page=UIPageControl(frame: CGRect(x: 40, y: 250, width: 240, height: 30))
        page.currentPageIndicatorTintColor=UIColor.red
        page.addTarget(self, action: #selector(changeNum), for: .valueChanged)
        page.numberOfPages=8
        self.view.addSubview(page)
        //分段控制器
        let seg=UISegmentedControl(items: ["one","three","four"])
        seg.frame=CGRect(x: 40, y: 300, width: 240, height: 30)
        seg.setImage(UIImage(named: "timg-4")?.withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
        seg.setContentOffset(CGSize(width: 10, height: 10), forSegmentAt: 1)
        seg.isMomentary=true
        seg.addTarget(self, action: #selector(changeClick), for: .valueChanged)
        self.view.addSubview(seg)
        //滑块控件
        let slider=UISlider(frame: CGRect(x: 40, y: 350, width: 240, height: 30))
        slider.isContinuous=true
        slider.minimumValue=0
        slider.maximumValue=10
        slider.minimumTrackTintColor=UIColor.red
        slider.maximumTrackTintColor=UIColor.green
        //slider.thumbTintColor=UIColor.blue
        slider.minimumValueImage=UIImage(named: "timg-4")
        slider.maximumValueImage=UIImage(named: "timg-4")
        slider.setThumbImage(UIImage(named: "timg-4"), for: .normal)
        slider.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        self.view.addSubview(slider)
        //活动指示器控件
        let indicator=UIActivityIndicatorView(style: .gray)
        indicator.center=CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        indicator.color=UIColor.black
        self.view.addSubview(indicator)
        indicator.startAnimating()
        //进度条控件
        let progressView=UIProgressView(frame:CGRect(x: 40, y: 400, width: 240, height: 30))
        progressView.progressTintColor=UIColor.red
        progressView.trackTintColor=UIColor.blue
        self.view.addSubview(progressView)
        progressView.progress=0.5
        //步进控制器
        let stepper=UIStepper()
        stepper.center=CGPoint(x: self.view.frame.width/2, y: 500)
        stepper.isContinuous=true
        stepper.autorepeat=true
        stepper.wraps=true
        stepper.minimumValue=1
        stepper.maximumValue=10
        stepper.stepValue=1
        stepper.tintColor=UIColor.red
        stepper.setDecrementImage(UIImage(named: "timg-4")?.withRenderingMode(.alwaysOriginal), for: .normal)
        stepper.setIncrementImage(UIImage(named: "timg-4")?.withRenderingMode(.alwaysOriginal), for: .normal)
        stepper.addTarget(self, action: #selector(onClick), for: .valueChanged)
        self.view.addSubview(stepper)
        //选择控制器
        let picker=UIPickerView(frame: CGRect(x: 40, y: 550, width: 280, height: 150))
        picker.delegate=self
        picker.dataSource=self
        self.view.addSubview(picker)
        //通过calayer对视图进行修饰
        let btn=UIButton(type: .custom)
        btn.frame=CGRect(x: 40, y: 700, width: 240, height: 30)
        btn.backgroundColor=UIColor.red
        btn.layer.masksToBounds=true
        btn.layer.cornerRadius=10
        btn.layer.borderColor=UIColor.green.cgColor
        btn.layer.borderWidth=1
        btn.layer.shadowColor=UIColor.gray.cgColor
        btn.layer.shadowOffset=CGSize(width: 10, height: 10)
        btn.layer.shadowOpacity=0.5
        self.view.addSubview(btn)
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
        
        
        
    }
    @objc func selector(datePicker:UIDatePicker){
        print(datePicker.date)
    }
    @objc func onClick(stepper:UIStepper){
        print(stepper.value)
    }
    @objc func changeValue(slider:UISlider) {
        print(slider.value)
    }
    @objc func changeColor(){
        self.view.backgroundColor=UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
        
    }
    
    @objc func changeSelfColor(swi:UISwitch){
        if(swi.isOn){
            self.view.backgroundColor=UIColor.red
        }else{
            self.view.backgroundColor=UIColor.white
        }
    }
    @objc func changeNum(page:UIPageControl){
        print(page.currentPage)
    }
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //        let alertView=UIAlertController(title: "标题", message: "警告的内容", preferredStyle:.alert)
        //       // let alertView=UIAlertController(title: "标题", message: "警告的内容", preferredStyle:.actionSheet)
        //        let action=UIAlertAction(title: "按钮1", style: .default, handler: {(UIAlertAction)->Void in
        //            print("click1")
        //        })
        //        let action2=UIAlertAction(title: "按钮2", style: .default, handler: {(UIAlertAction)->Void in
        //            print("click2")
        //        })
        //        let action3=UIAlertAction(title: "按钮3", style: .default, handler: {(UIAlertAction)->Void in
        //            print("click3")
        //        })
        //        alertView.addAction(action)
        //        alertView.addAction(action2)
        //        alertView.addAction(action3)
        //        alertView.addTextField{(textfield)in
        //            textfield.placeholder="place"
        //        }
        //        self.present(alertView,animated: true,completion: nil)
        
        
        let actionSheet = UIAlertController(title: "标题", message: "内容", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "one", style: .destructive, handler: {(UIAlertAction) -> Void in
            print("one")
        })
        let action2 = UIAlertAction(title: "two", style: .default, handler: {(UIAlertAction) -> Void in
            print("two")
        })
        let action3 = UIAlertAction(title: "three", style: .cancel, handler: {(UIAlertAction) -> Void in
            print("three")
        })
        actionSheet.addAction(action)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    
}
