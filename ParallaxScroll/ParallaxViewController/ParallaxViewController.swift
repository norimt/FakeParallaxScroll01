//
//  ParallaxViewController.swift
//  ParallaxScroll
//
//  Created by m4c on 2020/04/05.
//  Copyright © 2020 cloudeleven. All rights reserved.
//

import UIKit

enum CellContentType:Int {
    case Detail = 0
    case Notices
}

class ParallaxViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SectionHeaderViewDelegate {
    func onButton1Tapped(button: UIButton) {
        showDetail()
    }
    
    func onButton2Tapped(button: UIButton) {
        showNotices()
    }
    
    func showDetail() {
        if (showingContent == .Detail) {
            return
        }
        print(String(format: "current notice offset : %f", tableView.contentOffset.y))
        scrollTops[.Notices] = tableView.contentOffset.y
        print(String(format: "detail: %f, notices: %f", scrollTops[.Detail]!, scrollTops[.Notices]!))

        print(String(format: "offset: %f, headerheight: %f", self.tableView.contentOffset.y, self.headerHeight))
        if (self.scrollTops[.Notices]! > self.headerHeight) {
            if (self.scrollTops[.Detail]! <= self.headerHeight) {
                print("change to header height")
                self.scrollTops[.Detail] = self.headerHeight
            }
            print(String(format: "before scrolling offset : %f", self.scrollTops[.Detail]!))
//            tableView.contentOffset.y = scrollTops[.Detail]!
            self.tableView.setContentOffset(CGPoint(x: 0, y: self.scrollTops[.Detail]!), animated: false)
            print(String(format: "after scrolling offset : %f", self.tableView.contentOffset.y))
        }
        self.showingContent = .Detail
        tableView.reloadData()
        
//        print(String(format: "offset: %f, headerheight: %f", self.tableView.contentOffset.y, self.headerHeight + self.sectionHeaderHeight))
        if (self.scrollTops[.Notices]! > self.headerHeight) {
            DispatchQueue.main.async {
//                if (self.scrollTops[.Detail]! <= self.headerHeight) {
//                    self.scrollTops[.Detail] = self.headerHeight
//                }
                print(String(format: "scrolling offset : %f", self.scrollTops[.Detail]!))
//                self.tableView.contentOffset.y = self.scrollTops[.Detail]!
//                self.tableView.setContentOffset(CGPoint(x: 0, y: self.scrollTops[.Detail]!), animated: true)
                print(String(format: "scrolled offset : %f", self.tableView.contentOffset.y))
            }
        }
    }
    
    func showNotices() {
        if (showingContent == .Notices) {
            return
        }
        print(String(format: "current detail offset : %f", tableView.contentOffset.y))
        scrollTops[.Detail] = tableView.contentOffset.y
        print(String(format: "detail: %f, notices: %f", scrollTops[.Detail]!, scrollTops[.Notices]!))
        
        print(String(format: "offset: %f, headerheight: %f", self.tableView.contentOffset.y, self.headerHeight))
        if (scrollTops[.Detail]! > self.headerHeight) {
            if (self.scrollTops[.Notices]! <= self.headerHeight) {
                print("change to header height")
                self.scrollTops[.Notices] = self.headerHeight
            }
            print(String(format: "1before scrolling offset : %f", self.scrollTops[.Notices]!))
//            tableView.contentOffset.y = scrollTops[.Notices]!
            self.tableView.setContentOffset(CGPoint(x: 0, y: self.scrollTops[.Notices]!), animated: false)
            print(String(format: "1after scrolling offset : %f", self.tableView.contentOffset.y))
        }
        self.showingContent = .Notices
        tableView.reloadData()
        
//        print(String(format: "offset: %f, headerheight: %f", self.tableView.contentOffset.y, self.headerHeight + self.sectionHeaderHeight))
        if (self.scrollTops[.Detail]! > self.headerHeight) {
            DispatchQueue.main.async {
//                if (self.scrollTops[.Notices]! <= self.headerHeight) {
//                    self.scrollTops[.Notices] = self.headerHeight
//                }
                print(String(format: "2before scrolling offset : %f", self.scrollTops[.Notices]!))
//                self.tableView.contentOffset.y = self.scrollTops[.Notices]!
//                self.tableView.setContentOffset(CGPoint(x: 0, y: self.scrollTops[.Notices]!), animated: true)
                print(String(format: "2scrolled offset : %f", self.tableView.contentOffset.y))
            }
        }
    }

    @IBOutlet weak var tableView: UITableView!
    var showingContent: CellContentType = .Detail
    let sectionHeaderView: SectionHeaderView = SectionHeaderView.init()
    var scrollTops: [CellContentType: CGFloat] = [.Detail: 0, .Notices: 0]
    var headerHeight:CGFloat = 0
    var sectionHeaderHeight:CGFloat = 0
    
    let titles = ["1header", "2header"]
    let TODO = [
        ["wawawa"],
        [
         "牛乳を買う",
         "掃除をする",
         "アプリ開発の勉強をする",
         "basadfsadf",
         "basdfasdfasfasdfs",
         "asdaf",
         "sadfasd",
        "牛乳を買う",
        "掃除をする",
        "アプリ開発の勉強をする",
        "basadfsadf",
        "basdfasdfasfasdfs",
        "asdaf",
        "sadfasd",
        "牛乳を買う",
        "掃除をする",
        "アプリ開発の勉強をする",
        "basadfsadf",
        "basdfasdfasfasdfs",
        "asdaf",
        "sadfasd",
        "牛乳を買う",
        "掃除をする",
        "アプリ開発の勉強をする",
        "basadfsadf",
        "basdfasdfasfasdfs",
        "asdaf",
        "sadfasd"
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        view = SectionHeaderView.init()
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        sectionHeaderView.delegate = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        } else {
            if (showingContent == .Detail) {
                return 1
            } else {
                return TODO[section].count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            // セルを取得する
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            // セルに表示する値を設定する
            cell.textLabel!.text = TODO[indexPath.section][indexPath.row]
//            cell.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50)
            self.headerHeight = cell.frame.height
//            print(String(format:"header height = %f", self.headerHeight))
            return cell
        } else {
            if (self.showingContent == .Detail) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath)
                return cell
            } else {
                let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                // セルに表示する値を設定する
                cell.textLabel!.text = TODO[indexPath.section][indexPath.row]
                return cell
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TODO.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if (section == 0) {
//            return nil
//        }
//        return titles[section]
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0) {
            return nil
        }
        self.sectionHeaderView.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 0)
        return self.sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            return 0
        }
        self.sectionHeaderHeight = 80
        return 80
    }
    
}
