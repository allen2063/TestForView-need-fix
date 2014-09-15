//
//  ThirdViewController.m
//  TestForView
//
//  Created by ZengYifei on 14-3-10.
//  Copyright (c) 2014年 allen. All rights reserved.
//

#import "ThirdViewController.h"
#import "AppDelegate.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CGRect bounds = [[UIScreen mainScreen]applicationFrame];
        UITextView * textView =  [[UITextView alloc]initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y+44, bounds.size.width, bounds.size.height)];
        textView.editable = NO;
        textView.text = @"third View third View third View third View third View third View third View third View third View third View third View third View third View third View third View third View third View third View third View third View third View third View third View third View third View third View ";
        [self.view addSubview: textView];
        self.title = @"third";
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"third3" image:Nil tag:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
