//
//  ViewController.swift
//  PageViewCtrUse
//
//  Created by lotawei on 16/9/20.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit
extension UIColor{
    class func randomcolor() -> UIColor {
        let   r = CGFloat( arc4random() % 255 )
        
         let   g = CGFloat( arc4random() % 255 )
         let   b = CGFloat( arc4random() % 255 )
        return  UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
}
class ViewController: UIViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    var pageController:UIPageViewController!
   
    var currentPage:Int = 0
   
    var viewControllers = NSMutableArray(capacity:0)
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化
   
        //transitionStyle:转换样式，有PageCurl和Scroll两种
     
        //navigationOrientation:导航方向，有Horizontal和Vertical两种
     
        //options: UIPageViewControllerOptionSpineLocationKey---书脊的位置
       
        //         UIPageViewControllerOptionInterPageSpacingKey---每页的间距
      
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation:.horizontal, options:nil)
       
        pageController.delegate = self;//设置delegate,提供展示相关的信息和接收手势发起的转换的通知
       
        pageController.dataSource = self;//设置datasource,提供展示的内容
       
        
      
        currentPage = 0
      
        //初始化要展示的Controller,自定义
       
        for index in 0...9 {
           
         
          
            let pViewController =  PageViewController()
            pViewController.title = "第\(index+1)页"
            pViewController.view.backgroundColor = UIColor.randomcolor()
            viewControllers.add(pViewController)
          
            
           
        }
       
        //展示之前进行初始化第一个Controller, 单个显示放一个,两个显示则放两个,和样式有关
        
        pageController.setViewControllers([viewControllers[0] as! PageViewController], direction: .reverse, animated: true, completion: nil)
       
        //UIPageController必须放在Controller Container中
       
        self.addChildViewController(pageController)
        
        self.view.addSubview(pageController.view)
      
        
      
        currentPage = 0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        currentPage -= 1
        
        if currentPage < 0 {
            
            currentPage = 0
            
            return nil
            
        }
        
        return viewControllers[currentPage] as? UIViewController

    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
         currentPage+=1
        
        if currentPage > 9 {
           
            currentPage = 9
         
            return nil
            
        }
        
        return viewControllers[currentPage] as? UIViewController
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
       
        return .min
        
    }
    private func pageViewControllerSupportedInterfaceOrientations(pageViewController: UIPageViewController) -> Int {
      
        return 2
        
    }
    func pageViewControllerPreferredInterfaceOrientationForPresentation(_ pageViewController: UIPageViewController) -> UIInterfaceOrientation {
    
        return .portrait
       
    }
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
       
        return pageController.viewControllers!.count
      
    }
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
       
        return currentPage
        
    }
}

