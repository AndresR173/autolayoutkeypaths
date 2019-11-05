//
//  UIView+Extensions.swift
//  AutoLayoutKeyPaths
//
//  Created by Andres Rojas on 5/11/19.
//  Copyright © 2019 Andres Rojas. All rights reserved.
//

import UIKit

typealias Constraint = (UIView, UIView) -> NSLayoutConstraint

func equal<L, Axis>(_ to: KeyPath<UIView, L>, constant: CGFloat = 0) -> Constraint where L: NSLayoutAnchor<Axis> {
    return equal(to, to, constant: constant)
}

func equal<L, Axis>(_ from: KeyPath<UIView, L>, _ to: KeyPath<UIView, L>, constant: CGFloat = 0) -> Constraint where L: NSLayoutAnchor<Axis> {
    return { view1, view2 in
        view1[keyPath: from].constraint(equalTo: view2[keyPath: to], constant: constant)
    }
}

func equal<L, Axis>(_ from: KeyPath<UIView, L>, _ to: NSLayoutAnchor<Axis>, constant: CGFloat = 0) -> Constraint where L: NSLayoutAnchor<Axis> {
    return { view1, view2 in
        view1[keyPath: from].constraint(equalTo: to, constant: constant)
    }
}

/// Accepts key paths to dimension anchors
func equal<L>(_ keyPath: KeyPath<UIView, L>, constant: CGFloat) -> Constraint where L: NSLayoutDimension {
    return { view1, _ in
        view1[keyPath: keyPath].constraint(equalToConstant: constant)
    }
}

func equal<L>(_ from: KeyPath<UIView, L>, _ to: KeyPath<UIView, L>, multiplier: CGFloat) -> Constraint where L: NSLayoutDimension {
    return { view1, view2 in
        view1[keyPath: from].constraint(equalTo: view2[keyPath: to], multiplier: multiplier)
    }
}

func equal<L>(_ from: KeyPath<UIView, L>, _ to: NSLayoutDimension, multiplier: CGFloat = 0) -> Constraint where L: NSLayoutDimension {
    return { view1, _ in
        view1[keyPath: from].constraint(equalTo: to, multiplier: multiplier)
    }
}

extension UIView {
    func addSubview(_ subview: UIView, constraints: [Constraint]) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        addConstraints(constraints.map { $0(subview, self) })
    }

}
