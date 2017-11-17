//
//  ViewController.swift
//  RectiveNativeSwift
//
//  Created by tederen on 2017/10/31.
//  Copyright © 2017年 zhiyuehl. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    let speakerListViewModel = SpeakerListViewModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speakerListViewModel.data.bind(to: tableView.rx.items(cellIdentifier: "SpeakerCell")) {_,speaker, cell in
            cell.textLabel?.text = speaker.name
            cell.detailTextLabel?.text = speaker.twitterHandle
            cell.imageView?.image = speaker.image
        }.disposed(by: disposeBag)
        
    }

}



