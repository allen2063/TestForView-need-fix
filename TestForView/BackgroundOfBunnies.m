//
//  BackgroundOfTabBar.m
//  TestForView
//
//  Created by ZengYifei on 14-3-11.
//  Copyright (c) 2014年 allen. All rights reserved.
//

#import "BackgroundOfBunnies.h"

@interface BackgroundOfBunnies ()

@end

@implementation BackgroundOfBunnies

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        FirstViewController * tab1 = [[FirstViewController alloc]init];
        SecondViewController * tab2 = [[SecondViewController alloc]init];
        ThirdViewController * tab3 = [[ThirdViewController alloc]init];
        
        UINavigationController *tab1Nav = [[[UINavigationController alloc] init] autorelease];
        [tab1Nav pushViewController:tab1 animated:NO];

        self.viewControllers = [NSArray arrayWithObjects:tab1,tab2,tab3, nil];
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
