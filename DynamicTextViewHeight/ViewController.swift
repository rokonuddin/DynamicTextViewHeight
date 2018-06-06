//
//  ViewController.swift
//  DynamicTextViewHeight
//
//  Created by Rokon Uddin on 6/6/18.
//  Copyright © 2018 Rokon Uddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: GrowingTextView!
    private var previousPosition:CGRect = CGRect.zero
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // *** Customize GrowingTextView ***
        textView.layer.cornerRadius = 4.0
        textView.placeholder = "Say something..."
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.minHeight = 30
        textView.maxHeight = 100
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateTextViewFrame()
    }
    
    private func updateTextViewFrame() {
        var frame = textView.frame
        frame.size.height = textView.contentSize.height
        textView.frame = frame
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
}

extension ViewController: GrowingTextViewDelegate {
    
    // *** Call layoutIfNeeded on superview for animation when changing height ***
    func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [.curveLinear], animations: { () -> Void in
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

