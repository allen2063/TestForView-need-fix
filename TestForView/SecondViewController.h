//
//  SecondViewController.h
//  TestForView
//
//  Created by ZengYifei on 14-3-10.
//  Copyright (c) 2014年 allen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UIWebViewDelegate>
{
    @private
    UIWebView * webView;
    UIBarButtonItem * reloadButton;
    UIBarButtonItem * stopButton;
    UIBarButtonItem * backButton;
    UIBarButtonItem * forwardButton;
}

@end
