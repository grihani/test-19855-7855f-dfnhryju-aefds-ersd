//
//  DetailAccountsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 30/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class DetailAccountsViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var lineUnderMenu: UIView! {
        didSet {
            lineUnderMenu.backgroundColor = blueCheckedColor
        }
    }
    @IBOutlet weak var showList: UIView!
    @IBOutlet weak var containerView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl! {
        didSet {
            pageControl.pageIndicatorTintColor = blueUncheckedColor
            pageControl.currentPageIndicatorTintColor = blueCheckedColor
        }
    }
    @IBOutlet weak var listeButtonsForPages: UIView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var addressAccount: UILabel! {
        didSet {
            if let account = account {
                addressAccount.text = account.adressAccount
            }
        }
    }
    @IBOutlet weak var favorisButton: UIButton!
    
    var identifiers: [String] = ["Meetings", "Vue 360°", "Contacts", "Activities", "Pipeline", "Account Details" ]
    // Manque 'Relation Activity'
    var meetingsOfAccount: MeetingsOfAccountV2ViewController = MeetingsOfAccountV2ViewController()
    var vue360: Vue360ViewController = Vue360ViewController()
    var contactsOfAccount: ContactsOfAccountViewController = ContactsOfAccountViewController()
    var tasksOfAccount: TasksOfAccountV2ViewController = TasksOfAccountV2ViewController()
    var opportunitiesOfAccount: OpportunitiesOfAccountViewController = OpportunitiesOfAccountViewController()
    var accountDetails: AccountDetailsViewController = AccountDetailsViewController()
    var pageControllers: [UIViewController] = []
    var pageViews: [UIView] = []
    var firstPage = 1
    var account: AccountModel! {
        didSet {
            addressAccount?.text = account.adressAccount
        }
    }
    var viewDidItsLayout: Bool = false
    
    @IBOutlet var buttonToShowMenu: UIBarButtonItem!
    @IBAction func showMenu(sender: UIBarButtonItem) {
        performSegueWithIdentifier("show Menu", sender: sender)
    }
    
    @IBOutlet var buttonHome: UIBarButtonItem!
    @IBAction func goHome(sender: UIBarButtonItem) {
        self.presentingViewController?.contentViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet var buttonPages: [UIButton] = []
    
    var shownView: UIView!
    
    // here we define the buttons in the top menu, add the pan gesture to show our list
    override func viewDidLoad() {
        super.viewDidLoad()
        println(self.presentingViewController)
        //self.view.window?.rootViewController = self
        
//        self.showList.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
//        buttonForPages(listeButtonsForPages)
        createMenuButtons(identifiers, lastCreatedFrame: CGRectZero, view: listeButtonsForPages)
        if account == nil {
            account = AccountDataModel().accountOfNextMeeting()
        }
        if account != nil {
            self.navigationBar.title = account.nameAccount
            if account.favoriteAccount == 0 {
                favorisButton.setImage(UIImage(named: "notFavoris")!, forState: UIControlState.Normal)
            } else {
                favorisButton.setImage(UIImage(named: "addedToFavoris")!, forState: UIControlState.Normal)
            }
        }
        colorButtons(firstPage)
        
        navigationBar.leftBarButtonItems?.append(buttonHome)
        
        navigationBar.leftBarButtonItems?.append(buttonToShowMenu)
        
        
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
                button.frame.size.width = self.listeButtonsForPages.frame.size.width / CGFloat(buttonPages.count) - 8
                button.frame.origin.x = i * (button.frame.size.width + 8)
                i++
            }
            viewDidItsLayout = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // get all the viewControllers that have identifiers defined in var identifiers
    func getViewControllers() -> [UIViewController]{
        var viewControllers: [UIViewController] = [UIViewController]()
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[0]) as? MeetingsOfAccountV2ViewController {
            viewControllers.append(viewController)
            self.meetingsOfAccount = viewController
            self.meetingsOfAccount.account = self.account
        }
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[1]) as? Vue360ViewController {
            viewControllers.append(viewController)
            viewController.account = self.account
            self.vue360 = viewController
        }
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[2]) as? ContactsOfAccountViewController {
            viewControllers.append(viewController)
            self.contactsOfAccount = viewController
            self.contactsOfAccount.account = self.account
        }
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[3]) as? TasksOfAccountV2ViewController {
            viewControllers.append(viewController)
            self.tasksOfAccount = viewController
            self.tasksOfAccount.account = self.account
        }
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[4]) as? OpportunitiesOfAccountViewController {
            viewControllers.append(viewController)
            self.opportunitiesOfAccount = viewController
            self.opportunitiesOfAccount.account = self.account
        }
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[5]) as? AccountDetailsViewController {
            viewController.account = self.account
            self.accountDetails = viewController
            self.accountDetails.read = true
            viewControllers.append(viewController)
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
//        pageControl.currentPage = page
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
    
    // action to show the list of accounts
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
    
    // creates the button to add to the view
    func buttonForPages(view: UIView) {
        let frame = view.frame
        var i = 0
        let width = CGFloat(100)
        for identifier in identifiers {
            
            let button = UIButton(frame: CGRect(x: CGFloat(i) * width, y: 0, width: 92, height: 37))
            button.setTitle(identifier, forState: UIControlState.Normal)
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.addTarget(self, action: Selector("goPage:"), forControlEvents: UIControlEvents.TouchUpInside)
            button.layer.cornerRadius = 8
            button.sizeToFit()
            view.addSubview(button)
            buttonPages.append(button)
            
            i++
        }
    }
    
    // colorier les boutons avec la couleur choisie
    func colorButtons(page:Int) {
        for button in buttonPages {
            button.backgroundColor = blueUncheckedColor
        }
        buttonPages[page].backgroundColor = blueCheckedColor
    }
    
    func createMenuButtons(menuTitles: [String], lastCreatedFrame: CGRect, view:UIView) {
        if menuTitles != [] {
            var menu = menuTitles
            var frame = lastCreatedFrame
            frame.origin.x = frame.origin.x + 8 + frame.size.width
            frame.size.height = 37
            let button = UIButton(frame: frame)
            let firstItemOfMenuTitles = menu.removeAtIndex(0)
            button.setTitle(firstItemOfMenuTitles, forState: .Normal)
            
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.addTarget(self, action: Selector("goPage:"), forControlEvents: UIControlEvents.TouchUpInside)
            view.addSubview(button)
            buttonPages.append(button)
            createMenuButtons(menu, lastCreatedFrame: button.frame, view: view)
        }
    }
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    @IBAction func editAccount(sender: UIBarButtonItem) {
        showPage(5)
        self.accountDetails.update = true
        let editButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "saveAccount:")
        navigationBar.rightBarButtonItem = editButton
    }
    
    @IBAction func saveAccount(sender: UIBarButtonItem) {
        showPage(1)
        self.accountDetails.read = true
        let editButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "editAccount:")
        navigationBar.rightBarButtonItem = editButton
    }
    
    @IBAction func favorisButtonPressed(sender: UIButton) {
        var image: UIImage = favorisButton.imageForState(UIControlState.Normal)!
        let imageFav: UIImage = UIImage(named: "notFavoris")!
        let imageFavSelec: UIImage = UIImage(named: "addedToFavoris")!
        if image == imageFav {
            favorisButton.setImage(imageFavSelec, forState: UIControlState.Normal)
            //set favoris = true (1)
            println("ajouté aux favoris")
            self.account.favoriteAccount = 1
            println("favoris: \(self.account.favoriteAccount)")
        } else {
            favorisButton.setImage(imageFav, forState: UIControlState.Normal)
            //set favoris = false (0)
            println("supprimé des favoris")
            self.account.favoriteAccount = 0
            println("favoris: \(self.account.favoriteAccount)")
        }
        AccountDataModel().updateAccount(account: self.account)
    }
    
    // MARK: - Navigation:
    
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
        } else if segue.identifier == "show map of account" {
            if let menuTableViewController = segue.destinationViewController.contentViewController as? MapOfAccountViewController {
                var minimumSize = menuTableViewController.view.systemLayoutSizeFittingSize(UILayoutFittingExpandedSize)
                minimumSize.width = self.view.frame.size.width/2
                minimumSize.height = self.view.frame.size.height/2
                menuTableViewController.preferredContentSize = minimumSize
//                if let ppc = menuTableViewController.popoverPresentationController {
//                    ppc.barButtonItem = sender as UIBarButtonItem
//                }
            }
        }
    }
}
