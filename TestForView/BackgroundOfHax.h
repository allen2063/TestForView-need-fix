//
//  BackgroundOfHax.h
//  TestForView
//
//  Created by ZengYifei on 14-3-11.
//  Copyright (c) 2014年 allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface BackgroundOfHax : UITabBarController <UIWebViewDelegate>
{
@private
    UIWebView * webView;
    UIBarButtonItem * reloadButton;
    UIBarButtonItem * stopButton;
    UIBarButtonItem * backButton;
    UIBarButtonItem * forwardButton;
}

@end
