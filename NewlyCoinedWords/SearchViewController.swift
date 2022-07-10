//
//  SearchViewController.swift
//  NewlyCoinedWords
//
//  Created by SC on 2022/07/10.
//

import UIKit

class SearchViewController: UIViewController {


    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!


    @IBOutlet var searchTagButtonCollection: [UIButton]!

    @IBOutlet weak var resultFrameImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        designSearchBar()
        designTagButtons()
        designResultFrame()

        resultLabel.text = "결과가 이 곳에 나타납니다."

        // Do any additional setup after loading the view.
    }
    

    func designSearchBar() {
        searchBarView.layer.borderWidth = 2
        searchBarView.layer.borderColor = UIColor.label.cgColor

        searchTextField.placeholder = "검색어를 입력해 주세요"

        searchButton.setTitle("", for: .normal)
        searchButton.tintColor = .systemBackground
        searchButton.backgroundColor = .label
    }

    func designTagButtons() {
        for tagButton in searchTagButtonCollection {
            tagButton.layer.cornerRadius = 12
            tagButton.layer.borderWidth = 1
            tagButton.layer.borderColor = UIColor.label.cgColor
            tagButton.setTitle("", for: .normal)
        }
    }

    func designResultFrame() {
        resultFrameImageView.image = UIImage(named: "ResultFrame")
        resultFrameImageView.contentMode = .scaleToFill
    }
}
