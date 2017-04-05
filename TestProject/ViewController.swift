//
//  ViewController.swift
//  TestProject
//
//  Created by GlebRadchenko on 3/31/17.
//  Copyright © 2017 Gleb Rachenko. All rights reserved.
//

import UIKit
import AmazingBubbles

class ViewController: UIViewController {

    @IBOutlet weak var bubblesView: ContentBubblesView! {
        didSet {
            bubblesView.delegate = self
            bubblesView.dataSource = self
        }
    }
    
    var selectedBubbleIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bubblesView.reload(randomizePosition: true)
        
        bubblesView.tapEnabled = true
        bubblesView.panEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: ContentBubblesViewDelegate {
    
    func minimalSizeForBubble(in view: ContentBubblesView) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func maximumSizeForBubble(in view: ContentBubblesView) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func contentBubblesView(_ view: ContentBubblesView, didSelectItemAt index: Int) {
        if let labelView = view.bubbleViews[index] as? LabelBubbleView {
            labelView.imageView.isHidden = labelView.currentSize == 3
            labelView.label.isHidden = labelView.currentSize != 3
            labelView.label.text = "Hello, \(index)"
        }
        
        if let selectedIndex = selectedBubbleIndex, selectedIndex != index {
            // a previous bubble was selected and is different to the one that was just selected
            let oldBubble = view.bubbleViews[selectedIndex]
            view.toggleBubble(bubbleView: oldBubble)
        }
        
        selectedBubbleIndex = index
    }
    
//    func contentBubblesView(_ view: ContentBubblesView, sizeForItemAt index: Int) -> CGSize {
//        return CGSize(width: 150, height: 150)
//    }
//    
//    func contentBubblesView(_ view: ContentBubblesView, selectedSizeForItemAt index: Int) -> CGSize {
//        return CGSize(width: 180, height: 180)
//    }
}

extension ViewController: ContentBubblesViewDataSource {
    func countOfSizes(in view: ContentBubblesView) -> Int {
        return 2
    }
    
    func numberOfItems(in view: ContentBubblesView) -> Int {
        return 15
    }
    
    func addOrUpdateBubbleView(forItemAt index: Int, currentView: BubbleView?) -> BubbleView {
        var view: BubbleView! = currentView
        
        if view == nil {
            if let labelView = UINib(nibName: "LabelBubbleView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? LabelBubbleView {
                labelView.label.text = "Hello!"
                view = labelView
            }
        }
        
        view.backgroundColor = .clear
        let randomOrigin = CGPoint(x: CGFloat(drand48() * Double(self.view.frame.width * 2 / 3)),
                                   y: CGFloat(drand48() * Double(self.view.frame.height * 2 / 3)))
            
        view.frame = CGRect(origin: randomOrigin,
                            size: .zero)
        return view
    }
    
    
}
