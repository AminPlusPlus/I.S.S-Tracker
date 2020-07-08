//
//  Box.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 7/8/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation

class Box<T> {
       typealias Listener = (T) -> ()
       fileprivate var listener : Listener?
       
       var value : T {
           didSet {
               listener?(value)
           }
       }
       
       
       /// Binding Boxing data
       /// - Parameter listener: Listener
       func bind(listener : @escaping Listener) {
           self.listener = listener
           listener(value)
       }
       
       init(_ value : T) {
           self.value = value
       }
    
}
