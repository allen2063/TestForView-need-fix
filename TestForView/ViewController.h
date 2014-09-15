//
//  ViewController.h
//  TestForView
//
//  Created by allen on 13-11-3.
//  Copyright (c) 2013年 allen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BackgroundOfBunnies.h"
#import "BackgroundOfPoies.h"
#import "BackgroundOfHax.h"
@class CreditsViewController;
@interface ViewController : UIViewController<UIActionSheetDelegate>{
    UITextView * textView;
    UIBarButtonItem * credits;
    UISegmentedControl * segmentedControl;
    //UINavigationController * navigationControl;
    
    BackgroundOfBunnies * background;
    BackgroundOfPoies * backgroundOfPoies;
    BackgroundOfHax * backgroundOfHax;
    CreditsViewController * creditsViewController;
    int page;
}

- (void) SetPage;
- (id)initWithAppDelegate:(id)appDelegate;

@end



@interface CreditsViewController : UIViewController<UIActionSheetDelegate,UITextFieldDelegate>{
    UITextView * textViewForCredits;
    UINavigationController * navigationController;
    UITextField * textField1;
    UISlider * slider;
    UILabel * label_;
}
- (id)initWithAppDelegate:(id)appDelegate;
@end
