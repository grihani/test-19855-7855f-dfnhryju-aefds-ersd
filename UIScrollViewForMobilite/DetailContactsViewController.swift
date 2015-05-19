//
//  DetailContactsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 19/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class DetailContactsViewController: UIViewController {
    
    @IBOutlet weak var showList: UIView!
    @IBOutlet weak var listeButtonForPages: UIView!
    @IBOutlet weak var lineUnderMenu: UIView! {
        didSet {
            lineUnderMenu.backgroundColor = blueCheckedColor
        }
    }
    @IBOutlet weak var favorisButton: UIButton! {
        didSet {
            if contact != nil {
                if contact.favoriteContact == 0 {
                    favorisButton.setImage(UIImage(named: "notFavoris")!, forState: UIControlState.Normal)
                } else {
                    favorisButton.setImage(UIImage(named: "addedToFavoris")!, forState: UIControlState.Normal)
                }
            }
        }
    }
    @IBOutlet weak var containerView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl! {
        didSet {
            pageControl.pageIndicatorTintColor = blueUncheckedColor
            pageControl.currentPageIndicatorTintColor = blueCheckedColor
        }
    }
    @IBOutlet var homeButton: UIBarButtonItem!
    @IBAction func goHome(sender: UIBarButtonItem) {
        self.presentingViewController?.contentViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet var menuButton: UIBarButtonItem!
    @IBAction func showMenu(sender: UIBarButtonItem) {
        println("show menu")
        performSegueWithIdentifier("show Menu", sender: sender)
    }
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var contact: ContactModel!
    
    var identifiers: [String] = ["Contacts Details", "Meetings", "Activities"]
    var contactDetail: ContactDetailsViewController = ContactDetailsViewController()
    var pageControllers: [UIViewController] = []
    var pageViews: [UIView] = []
    var firstPage = 1
    
    var viewDidItsLayout: Bool = false
    
    @IBOutlet var buttonPages: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItems?.append(homeButton)
        navigationItem.leftBarButtonItems?.append(menuButton)
    }
    
    
    // every action that has relation to the layout of the view has to be put in here
    // here we get the viewControllers, their views, define which page we want first shown and define their content size
    override func viewDidLayoutSubviews() {
        if !viewDidItsLayout {
            
            pageControllers = getViewControllers()
            pageViews = getViews(pageControllers)
            
            
            let pageCount = pageControllers.count
            loadVisiblePages(pageCount)
            pageControl.numberOfPages = pageCount
            
            showPage(firstPage)
            
            let pageScrollViewSize = containerView.frame.size
            containerView.contentSize = CGSize(width: pageScrollViewSize.width * CGFloat(pageCount), height: pageScrollViewSize.height)
            var i: CGFloat = 0
            for button in buttonPages {
                button.frame.size.width = self.listeButtonForPages.frame.size.width / CGFloat(buttonPages.count) - 8
                button.frame.origin.x = i * (button.frame.size.width + 8)
                i++
            }
            viewDidItsLayout = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // get all the viewControllers that have identifiers defined in var identifiers
    func getViewControllers() -> [UIViewController]{
        var viewControllers: [UIViewController] = [UIViewController]()
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[0]) as? ContactDetailsViewController {
            viewControllers.append(viewController)
            self.contactDetail = viewController
            
        }
        return viewControllers
    }
    
    // from the controllers that we set up earlier, we get their views and show them
    func getViews(viewControllers: [UIViewController]) -> [UIView] {
        var views: [UIView] = []
        for viewController in viewControllers {
            if let view = viewController.view as UIView? {
                views.append(view)
            }
        }
        return views
    }
    
    // load the pages that we want shown
    func loadVisiblePages(numberOfPages: Int) {
        let pageSize = containerView.bounds
        var pageBoundsForViews = pageSize
        
        for i in 0..<numberOfPages {
            pageBoundsForViews.origin.x = CGFloat(i) * pageSize.width
            let newPageView = pageViews[i]
            newPageView.frame = pageBoundsForViews
            containerView.addSubview(newPageView)
        }
    }
    
    // action added to the buttons of the menu to show a specific page
    @IBAction func goPage(sender: UIButton) {
        let textLabel = sender.titleLabel?.text
        var index = find(buttonPages, sender)
        if let index = index {
            showPage(index)
        }
    }
    
    // show the page that we want seen and updates the pageControl's shown page
    func showPage(page: Int) {
        let  pageSize = containerView.bounds
        let xContentOffset = pageSize.width * CGFloat(page)
        containerView.setContentOffset(CGPoint(x: xContentOffset, y: 0), animated: false)
        firstPage = page
    }
    
    // delegate method of scrollview : called everytime the scrollView is scrolled and update the pageControl's shown page
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        colorButtons(page)
        pageControl.currentPage = page
        firstPage = page
        self.view.endEditing(true)
    }
    
    // colorier les boutons avec la couleur choisie
    func colorButtons(page:Int) {
        for button in buttonPages {
            button.backgroundColor = blueUncheckedColor
        }
        buttonPages[page].backgroundColor = blueCheckedColor
    }
    
    @IBAction func favorisButtonPressed(sender: UIButton) {
        var image: UIImage = favorisButton.imageForState(UIControlState.Normal)!
        let imageFav: UIImage = UIImage(named: "notFavoris")!
        let imageFavSelec: UIImage = UIImage(named: "addedToFavoris")!
        if image == imageFav {
            favorisButton.setImage(imageFavSelec, forState: UIControlState.Normal)
            //set favoris = true (1)
            println("ajouté aux favoris")
            self.contact.favoriteContact = 1
            println("favoris: \(self.contact.favoriteContact)")
        } else {
            favorisButton.setImage(imageFav, forState: UIControlState.Normal)
            //set favoris = false (0)
            println("supprimé des favoris")
            self.contact.favoriteContact = 0
            println("favoris: \(self.contact.favoriteContact)")
        }
        ContactDataModel().updateContact(self.contact)
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show Menu" {
            if let menuTableViewController = segue.destinationViewController as? MenuTableViewController {
                var minimumSize = menuTableViewController.view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
                minimumSize.width = 320
                minimumSize.height = 164
                menuTableViewController.preferredContentSize = minimumSize
                if let ppc = menuTableViewController.popoverPresentationController {
                    ppc.barButtonItem = sender as UIBarButtonItem
                }
            }
        }
    }
    
    // MARK: - Actions of showing the Master
    @IBOutlet weak var languette: UIImageView!
        var leftListShown: Bool = false {
            didSet {
                if leftListShown {
                    languette?.image = UIImage(named: "languetteFermeture")
                } else {
                    languette?.image = UIImage(named: "languette gauche")
                }
            }
        }
    
    @IBAction func showList(sender: UIBarButtonItem) {
        self.revealViewController().revealToggle(sender)
        if !leftListShown {
            leftListShown = true
        } else {
            leftListShown = false
        }
    }
    
    @IBAction func showList(sender: UITapGestureRecognizer) {
        self.revealViewController().revealToggle(sender)
        if !leftListShown {
            leftListShown = true
        } else {
            leftListShown = false
        }
    }
}