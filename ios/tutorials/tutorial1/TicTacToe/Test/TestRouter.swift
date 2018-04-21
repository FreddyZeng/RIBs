//
//  TestRouter.swift
//  TicTacToe
//
//  Created by fanrong on 2018/4/11.
//  Copyright © 2018年 Uber. All rights reserved.
//

import RIBs

protocol TestInteractable: Interactable {
    weak var router: TestRouting? { get set }
    weak var listener: TestListener? { get set }
}

protocol TestViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class TestRouter: ViewableRouter<TestInteractable, TestViewControllable>, TestRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: TestInteractable, viewController: TestViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
