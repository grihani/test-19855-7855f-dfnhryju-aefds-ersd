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
    @IBOutlet weak var listeButtonsForPages: UIView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var identifiers: [String] = ["baba", "Vue 360°", "bibi"]
    var firstPageC: Test1ViewController = Test1ViewController()
    var vue360: Vue360ViewController = Vue360ViewController()
    var thirdPage: Test3ViewController = Test3ViewController()
    var pageControllers: [UIViewController] = []
    var pageViews: [UIView] = []
    var firstPage = 1
    var account: AccountModel!
    
    @IBOutlet var buttonPages: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showList.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        buttonForPages(listeButtonsForPages)
        if account != nil {
            self.navigationBar.title = account.nameAccount
        }
        
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
        containerView.backgroundColor = UIColor(red: 0, green: 0, blue: 100, alpha: 0.2)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getViewControllers() -> [UIViewController]{
        var viewControllers: [UIViewController] = [UIViewController]()
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[0]) as? Test1ViewController {
            viewControllers.append(viewController)
            self.firstPageC = viewController
        }
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[1]) as? Vue360ViewController {
            viewControllers.append(viewController)
            self.vue360 = viewController
            vue360.account = self.account
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
            newPageView.frame = pageBoundsForViews.rectByInsetting(dx: 0, dy: 0)
            containerView.addSubview(newPageView)
        }
    }
    
    @IBAction func goPage(sender: UIButton) {
        let textLabel = sender.titleLabel?.text
        var index = find(buttonPages, sender)
        if let index = index {
            showPage(index)
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
        self.view.endEditing(true)
    }
    
    @IBAction func showList(sender: UIBarButtonItem) {
        self.revealViewController().revealToggle(sender)
    }
    
    func buttonForPages(view: UIView) {
        let frame = view.frame
        var i = 0
        let width = CGFloat(100)
        for identifier in identifiers {
            let button = UIButton(frame: CGRect(x: CGFloat(i) * width, y: 0, width: 92, height: 37))
            button.setTitle(identifier, forState: UIControlState.Normal)
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.backgroundColor = UIColor.blueColor()
            button.addTarget(self, action: Selector("goPage:"), forControlEvents: UIControlEvents.TouchUpInside)
            view.addSubview(button)
            buttonPages.append(button)
            
            i++
        }
    }
}
