//
//  DetailContactsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 19/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class DetailContactsViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK : - Read/Update
    var read: Bool = false
    var update: Bool = false
    var delete: Bool = false
    var create: Bool = false
    
    func updateContact() {
        self.update = true
        self.read = false
        self.delete = false
        self.create = false
    }
    
    func saveContact() {
        self.update = false
        self.read = true
        self.delete = false
        self.create = false
    }
    
    func createContact() {
        self.update = false
        self.read = false
        self.create = true
        self.delete = false
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak var showList: UIView!
    @IBOutlet weak var listeButtonForPages: UIView!
    @IBOutlet weak var lineUnderMenu: UIView! {
        didSet {
            lineUnderMenu.backgroundColor = blueCheckedColor
        }
    }
    @IBOutlet weak var actionsOnContactButton: UIBarButtonItem! {
        didSet {
        }
    }
    @IBAction func showActionsOnContact(sender: UIBarButtonItem) {
        performSegueWithIdentifier("show actions", sender: sender)
    }
    @IBAction func favorisButtonPressed(sender: UIBarButtonItem) {
        
    }
    @IBOutlet weak var containerView: UIScrollView! {
        didSet {
            containerView.delegate = self
        }
    }
    @IBOutlet weak var pageControl: UIPageControl! {
        didSet {
            pageControl.pageIndicatorTintColor = blueUncheckedColor
            pageControl.currentPageIndicatorTintColor = blueCheckedColor
        }
    }
    @IBOutlet var createContactButton: UIBarButtonItem!
    @IBAction func createContact(sender: UIBarButtonItem) {
        createContact()
        self.contactDetail.createContact()
        self.contactDetail.updateUIForCreating()
        navigationBar.title = "Create Contact"
        let editButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "saveAccount:")
        navigationBar.rightBarButtonItem = editButton
    }
    @IBOutlet var homeButton: UIBarButtonItem!
    @IBAction func goHome(sender: UIBarButtonItem) {
        self.presentingViewController?.contentViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet var menuButton: UIBarButtonItem!
    @IBAction func showMenu(sender: UIBarButtonItem) {
        performSegueWithIdentifier("show Menu", sender: sender)
    }
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var editSaveButton: UIBarButtonItem!
    
    // MARK: - Variable
    var contact: ContactModel! {
        didSet {
            if contact.favoriteContact == 0 {
                var favorisBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                favorisBtn.setImage(UIImage(named: "notFavoris"), forState: UIControlState.Normal)
                favorisBtn.addTarget(self.navigationController, action: Selector("favorisButtonPressed"), forControlEvents: UIControlEvents.TouchUpInside)
                var favorisButton = UIBarButtonItem(customView: favorisBtn)
                navigationItem.rightBarButtonItems?.append(favorisButton)
            } else {
                var favorisBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                favorisBtn.setImage(UIImage(named: "addedToFavoris"), forState: UIControlState.Normal)
                favorisBtn.addTarget(self.navigationController, action: Selector("favorisButtonPressed"), forControlEvents: UIControlEvents.TouchUpInside)
                var favorisButton = UIBarButtonItem(customView: favorisBtn)
                navigationItem.rightBarButtonItems?.append(favorisButton)
            }
        }
    }
    var account: AccountModel!
    
    var identifiers: [String] = ["Informations", "Contacts Meetings", "Activity Relationship"]
    var contactDetail: ContactDetailsViewController = ContactDetailsViewController()
    var contactMeetings: MeetingsOfContactViewController = MeetingsOfContactViewController()
    var contactActivities: TasksOfContactViewController = TasksOfContactViewController()
    var pageControllers: [UIViewController] = []
    var pageViews: [UIView] = []
    var firstPage = 0
    
    var viewDidItsLayout: Bool = false
    
    @IBOutlet var buttonPages: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createMenuButtons(identifiers, lastCreatedFrame: CGRectZero, view: listeButtonForPages)
        
        colorButtons(firstPage)
        
        navigationItem.leftBarButtonItems?.append(createContactButton)
        navigationItem.leftBarButtonItems?.append(homeButton)
        navigationItem.leftBarButtonItems?.append(menuButton)
        
        var favorisBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        favorisBtn.setImage(UIImage(named: "notFavoris"), forState: UIControlState.Normal)
        favorisBtn.addTarget(self.navigationController, action: Selector("favorisButtonPressed"), forControlEvents: UIControlEvents.TouchUpInside)
        var favorisButton = UIBarButtonItem(customView: favorisBtn)
        
        navigationItem.rightBarButtonItems?.append(favorisButton)
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if contact == nil && !self.create {
            contact = ContactDataModel().getFirstFavoriteContact()
            navigationBar.title = ("\(contact.lastNameContact)")
        }
        if self.read {
            self.contactDetail.updateUIForReading()
        } else if self.update {
            self.contactDetail.updateUIForUpdating()
        } else if self.create {
            self.contactDetail.updateUIForCreating()
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
            viewController.contact = self.contact
            viewController.account = self.account
            self.contactDetail = viewController
        }
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[1]) as? MeetingsOfContactViewController {
            viewControllers.append(viewController)
            self.contactMeetings = viewController
            self.contactMeetings.contact = self.contact
            self.contactMeetings.visible = true
        }
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[2]) as? TasksOfContactViewController {
            viewControllers.append(viewController)
            self.contactActivities = viewController
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
            frame.size.height = 38
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
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show Menu" {
            if let menuTableViewController = segue.destinationViewController as? MenuTableViewController {
                var minimumSize = menuTableViewController.view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
                minimumSize.width = 320
                minimumSize.height = 164
                menuTableViewController.preferredContentSize = minimumSize
                if let ppc = menuTableViewController.popoverPresentationController {
                    ppc.barButtonItem = sender as! UIBarButtonItem
                }
            }
        }
    }
    
    // MARK: - Actions of showing the Master
    @IBOutlet weak var languette: UIImageView!
    var leftListShown: Bool = true {
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
    
    @IBAction func showListTapGestureRecognizer(sender: UITapGestureRecognizer) {
        self.revealViewController().revealToggle(sender)
        if !leftListShown {
            leftListShown = true
        } else {
            leftListShown = false
        }
    }
    
    @IBAction func editAccount(sender: UIBarButtonItem) {
        self.contactDetail.update = true
        self.contactDetail.updateUIForUpdating()
        navigationBar.title = "Update contact : " + contact.lastNameContact
        let editButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "saveAccount:")
        navigationBar.rightBarButtonItem = editButton
    }
    
    @IBAction func saveAccount(sender: UIBarButtonItem) {
        self.contactDetail.read = true
        self.contactDetail.updateUIForReading()
        navigationBar.title = "\(contact.lastNameContact)"
        let editButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "editAccount:")
        navigationBar.rightBarButtonItem = editButton
    }
}