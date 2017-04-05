//
//  BubbleViewProtocols.swift
//  AmazingBubbles
//
//  Created by GlebRadchenko on 3/31/17.
//  Copyright © 2017 Gleb Rachenko. All rights reserved.
//

import Foundation

@objc public protocol ContentBubblesViewDelegate: class {
    @objc optional func minimalSizeForBubble(in view: ContentBubblesView) -> CGSize
    @objc optional func maximumSizeForBubble(in view: ContentBubblesView) -> CGSize
    
    @objc optional func contentBubblesView(_ view: ContentBubblesView, didSelectItemAt index: Int)
    @objc optional func contentBubblesView(_ view: ContentBubblesView, shouldChangeSizeForItemAt index: Int) -> Bool
    @objc optional func contentBubblesView(_ view: ContentBubblesView, didChangeSizeForItemAt index: Int)

    /// Enables the implementer to provide a size for a standard item at an index
    ///
    /// - Parameters:
    ///   - view: The content bubbles view
    ///   - index: The index of the item
    ///
    /// - Returns: The size of the item
    ///
    @objc optional func contentBubblesView(_ view: ContentBubblesView, sizeForItemAt index: Int) -> CGSize
    
    
    /// Enables the implementer to provide a size for a selected item at an index
    ///
    /// - Parameters:
    ///   - view: The content bubbles view
    ///   - index: The index of the item
    ///
    /// - Returns: The size of the selected state of the item
    ///
    @objc optional func contentBubblesView(_ view: ContentBubblesView, selectedSizeForItemAt index: Int) -> CGSize
}

@objc public protocol ContentBubblesViewDataSource: class {
    @objc optional func countOfSizes(in view: ContentBubblesView) -> Int
    
    func numberOfItems(in view: ContentBubblesView) -> Int
    func addOrUpdateBubbleView(forItemAt index: Int, currentView: BubbleView?) -> BubbleView
}
