//
//  DetailAccountsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 30/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class DetailAccountsViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var showList: UIView!
    @IBOutlet weak var containerView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //var identifiers: [String: AnyObject] = ["baba": NSClassFromString("Test1ViewController"), "boubou": NSClassFromString("Test2ViewController")]
    var identifiers: [String] = ["baba", "boubou", "bibi"]
    var firstPageC: Test1ViewController = Test1ViewController()
    var secondPage: Test2ViewController = Test2ViewController()
    var thirdPage: Test3ViewController = Test3ViewController()
    var pageControllers: [AnyObject] = []
    var pageViews: [UIView] = []
    var firstPage = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showList.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    override func viewDidLayoutSubviews() {
               
        pageControllers = getViewControllers()
        pageViews = getViews(pageControllers)
        
        
        let pageCount = pageControllers.count
        loadVisiblePages(pageCount)
        pageControl.numberOfPages = pageCount
        
        showPage(firstPage)

        let pageScrollViewSize = containerView.frame.size
        containerView.contentSize = CGSize(width: pageScrollViewSize.width * CGFloat(pageCount), height: pageScrollViewSize.height)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getViewControllers() -> [AnyObject]{
        var viewControllers: [AnyObject] = [AnyObject]()
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[0]) as? Test1ViewController {
            viewControllers.append(viewController)
            self.firstPageC = viewController
        }
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[1]) as? Test2ViewController {
            viewControllers.append(viewController)
            self.secondPage = viewController
        }
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[2]) as? Test3ViewController {
            viewControllers.append(viewController)
            self.thirdPage = viewController
        }
        return viewControllers
    }
    
    func getViews(viewControllers: [AnyObject]) -> [UIView] {
        var views: [UIView] = []
        for viewController in viewControllers {
            if let view = viewController.view as UIView? {
                views.append(view)
            }
        }
        return views
    }
    
    func loadVisiblePages(numberOfPages: Int) {
        let pageSize = containerView.bounds
        var pageBoundsForViews = pageSize
        
        for i in 0..<numberOfPages {
            pageBoundsForViews.origin.x = CGFloat(i) * pageSize.width
            let newPageView = pageViews[i]
            newPageView.frame = pageBoundsForViews.rectByInsetting(dx: 10, dy: 0)
            containerView.addSubview(newPageView)
        }
    }
    
    func showPage(page: Int) {
        let  pageSize = containerView.bounds
        let xContentOffset = pageSize.width * CGFloat(page)
        containerView.setContentOffset(CGPoint(x: xContentOffset, y: 0), animated: false)
        pageControl.currentPage = page
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        pageControl.currentPage = page
    }
    
    func changeLabels() {
        firstPageC.setLabelText()
        secondPage.setLabelText()
        thirdPage.setLabelText()
    }
    
    @IBAction func showList(sender: UIBarButtonItem) {
        self.revealViewController().revealToggle(sender)
        changeLabels()
    }
}
