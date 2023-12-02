//
//  ViewController.swift
//  ExDefaultValueInInit
//
//  Created by 김종권 on 2023/12/02.
//

import UIKit

class ViewController: UIViewController {
    private let textView1 = {
        let v = UITextView()
        v.font = .systemFont(ofSize: 32)
        v.textColor = .black
        v.text = "text1\n123\n123"
        v.backgroundColor = .blue.withAlphaComponent(0.5)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    private let textView2 = {
        let v = UITextView()
        v.font = .systemFont(ofSize: 32)
        v.textColor = .black
        v.text = "text2\n123\n123"
        v.backgroundColor = .green.withAlphaComponent(0.5)
        v.textContainer.lineFragmentPadding = 30 // <-
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(textView1.textContainer.lineFragmentPadding)
        
        view.addSubview(textView1)
        view.addSubview(textView2)
        
        NSLayoutConstraint.activate([
            textView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            textView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView1.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        NSLayoutConstraint.activate([
            textView2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView2.topAnchor.constraint(equalTo: textView1.bottomAnchor, constant: 16),
            textView2.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}

class MyViewController: UIViewController {
    var myValue = 0
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(myValue: Int = 1) {
        self.init(nibName: nil, bundle: nil)
        self.myValue = myValue
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
