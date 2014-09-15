//
//  AppDelegate.h
//  TestForView
//
//  Created by allen on 13-11-3.
//  Copyright (c) 2013年 allen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    ViewController * viewController;
    UINavigationController * navigationController;
    CreditsViewController * creditsViewController;
    UIWindow * window;
}

@property (nonatomic,retain) IBOutlet CreditsViewController * creditsViewController;

@property (retain, nonatomic) IBOutlet UIWindow *window;

@property (retain, nonatomic) IBOutlet ViewController *viewController;

@property (nonatomic,retain) IBOutlet UINavigationController * navigationController;

@end
