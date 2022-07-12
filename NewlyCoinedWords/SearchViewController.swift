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

    @IBOutlet var searchHistoryTagButtonCollection: [UIButton]!

    @IBOutlet weak var resultFrameImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!

//    let newlyCoinedWordsDict = [
//        "스불재": "스스로 불러온 재앙",
//        "갓생": "갓(God)+생(生) 부지런하고 열심히 사는 인생",
//        "알잘딱깔센": "알아서 잘 딱깔끔하고 센스있게",
//        "머선129": "무슨 일이야의 사투리 표현인 '머선 일이고?'의 일이고를 숫자 129로 표현한 말",
//        "whyrano": "왜 이러냐의 사투리 표현인 와 이라노를 영어로 적은 말",
//        "군싹": "군침이 싹 도네",
//        "웃안웃": "웃긴데 안 웃김"
//    ]

    enum NewlyCoinedWord: String {
        case 스불재 = "스불재"
        case 갓생 = "갓생"
        case 알잘딱깔센 = "알잘딱깔센"
        case 머선129 = "머선129"
        case whyrano = "whyrano"
        case 군싹 = "군싹"
        case 웃안웃 = "웃안웃"
    }

//    var searchHistoryArray = [String](repeating: "", count: 4)  // 초기화 시 배열 크기를 정할 수 있지만 추후에 추가가 가능
    var searchHistoryArray: [String] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        designSearchBar()
        designTagButtons()
        designResultFrame()

        resultLabel.text = "결과가 이 곳에 나타납니다."
        resultLabel.numberOfLines = 0

    }
    
// MARK: - Design


    func designSearchBar() {
        searchBarView.layer.borderWidth = 2
        searchBarView.layer.borderColor = UIColor.label.cgColor

        searchTextField.placeholder = "검색어를 입력해 주세요"
        searchTextField.clearButtonMode = .whileEditing

        searchButton.setTitle("", for: .normal)
        searchButton.tintColor = .systemBackground
        searchButton.backgroundColor = .label
    }


    func designTagButtons() {
        for tagButton in searchHistoryTagButtonCollection {
            tagButton.layer.cornerRadius = 12
            tagButton.layer.borderWidth = 1
            tagButton.layer.borderColor = UIColor.label.cgColor
            tagButton.tintColor = .label  // setTitleColor와의 차이?

            tagButton.titleLabel?.font = UIFont.systemFont(ofSize: 2)  // 바뀌지 X
//            tagButton.configuration?.buttonSize = .larger
//            tagButton.configuration = .pad

            tagButton.setTitle("", for: .normal)
            tagButton.isHidden = true
        }
    }


    func designResultFrame() {
        resultFrameImageView.image = UIImage(named: "ResultFrame")
        resultFrameImageView.contentMode = .scaleToFill
    }


    // MARK: - Actions


    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    // return 키 누르면 키보드 내려가도록: 이벤트를 DidEndOnExit로 Action 연결 시 자동으로 return 키 누르면 키보드 내려감

    @IBAction func didEndOnExit(_ sender: Any) {
//        checkWordAndShowResult(searchTextField.text!)
        resultLabel.text = checkWordAndShowResult(searchTextField.text!)
    }


    @IBAction func searchButtonClicked(_ sender: UIButton) {
//        checkWordAndShowResult(searchTextField.text!)
        resultLabel.text = checkWordAndShowResult(searchTextField.text!)
    }


    // MARK: - 신조어 Dictionary

    // 반환 X
//    func checkWordAndShowResult(_ userInputText: String) {
//        if newlyCoinedWordsDict.keys.contains(userInputText) {
//            resultLabel.text = newlyCoinedWordsDict[userInputText]
//            updateSearchHistoryTagButtons(userInputText)
//        } else {
//            resultLabel.text = "입력하신 단어의 뜻을 찾을 수 없습니다.\n다른 신조어를 입력해 보세요!"
//        }
//    }

    // 반환 O
//    func checkWordAndShowResult(_ userInputText: String) -> String {
//        if newlyCoinedWordsDict.keys.contains(userInputText) {
//            updateSearchHistoryTagButtons(userInputText)
//            return newlyCoinedWordsDict[userInputText]!
//        } else {
//            return "입력하신 단어의 뜻을 찾을 수 없습니다.\n다른 신조어를 입력해 보세요!"
//        }
//
//        return "Error"
//    }


    // MARK: - 신조어 Enum

    // 반환 O
    func checkWordAndShowResult(_ userInputText: String) -> String {

        // case 이름과 userInputText 비교 방법
//        switch userInputText {
//        case String(describing: NewlyCoinedWord.스불재):
//            return NewlyCoinedWord.스불재.rawValue  // "스스로 불러온 재앙"
//        default:
//            return "Error"
//        }

        var meaning = ""

        switch userInputText {
        case NewlyCoinedWord.스불재.rawValue:
            meaning = "스스로 불러온 재앙"
        case NewlyCoinedWord.갓생.rawValue:
            meaning = "갓(God)+생(生) 부지런하고 열심히 사는 인생"
        case NewlyCoinedWord.알잘딱깔센.rawValue:
            meaning = "알아서 잘 딱깔끔하고 센스있게"
        case NewlyCoinedWord.머선129.rawValue:
            meaning = "무슨 일이야의 사투리 표현인 '머선 일이고?'의 일이고를 숫자 129로 표현한 말"
        case NewlyCoinedWord.whyrano.rawValue:
            meaning = "왜 이러냐의 사투리 표현인 와 이라노를 영어로 적은 말"
        case NewlyCoinedWord.군싹.rawValue:
            meaning = "군침이 싹 도네"
        case NewlyCoinedWord.웃안웃.rawValue:
            meaning = "웃긴데 안 웃김"
        default:
            meaning = ""
        }


        if meaning != "" {
            updateSearchHistoryTagButtons(userInputText)
            return meaning
        } else {
            return "입력하신 단어의 뜻을 찾을 수 없습니다.\n다른 신조어를 입력해 보세요!"
        }
    }


    // MARK: - 버튼 업데이트
    func updateSearchHistoryTagButtons(_ userInputText: String) {
        print(searchHistoryArray)
        // searchHistoryArray에 단어가 있으면 지우기 (중복 방지)
        if searchHistoryArray.contains(userInputText) {
            searchHistoryArray.remove(at: searchHistoryArray.firstIndex(of: userInputText)!)
        }

        searchHistoryArray.insert(userInputText, at: 0)
        print(searchHistoryArray)

        if searchHistoryArray.count > 4 {
            searchHistoryArray.removeLast()
        }

        for i in 0..<searchHistoryArray.count {
            print(i)
            print("버튼 컬렉션 개수: \(searchHistoryTagButtonCollection.count)")

            searchHistoryTagButtonCollection[i].setTitle(searchHistoryArray[i], for: .normal)
            searchHistoryTagButtonCollection[i].isHidden = false
            print("\(searchHistoryTagButtonCollection[i].currentTitle)")
            print("\(searchHistoryArray[i])")
        }
    }
}
