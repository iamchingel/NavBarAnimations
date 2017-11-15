//
//  TableViewController.swift
//  NavigationBarAnimations
//
//  Created by Sanket  Ray on 15/11/17.
//  Copyright © 2017 Sanket  Ray. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var headerHeight: CGFloat = 300
    var headerView : UIView!
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
       
        headerView = table.tableHeaderView
        table.tableHeaderView = nil
        table.addSubview(headerView)

        table.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        table.contentOffset = CGPoint(x: 0, y: -headerHeight)

        updateHeaderView()


        
    }
    
    func updateHeaderView(){
        var headerRect = CGRect(x: 0, y: -headerHeight, width: table.bounds.width, height: headerHeight)
        if table.contentOffset.y < -headerHeight {
            headerRect.origin.y = table.contentOffset.y
            headerRect.size.height = -table.contentOffset.y
        }
        headerView.frame = headerRect
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        updateHeaderView()
        
        print(scrollView.contentOffset.y)
        
        var offset = (scrollView.contentOffset.y+300) / 150
        if offset > 1 {
            offset = 1
            self.navigationController?.navigationBar.tintColor = UIColor(hue: 1, saturation: offset, brightness: 1, alpha: 1)
            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
        } else {
            self.navigationController?.navigationBar.tintColor = UIColor(hue: 1, saturation: offset, brightness: 1, alpha: 1)
            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
        }
    }

}
