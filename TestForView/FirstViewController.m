//
//  FirstViewController.m
//  TestForView
//
//  Created by ZengYifei on 14-3-10.
//  Copyright (c) 2014年 allen. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

#define centerX  self.view.center.x
#define centerY  self.view.center.y

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CGRect bounds = [[UIScreen mainScreen]applicationFrame];
        UITextView * textView =  [[UITextView alloc]initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y+44, bounds.size.width, bounds.size.height)];
        textView.editable = NO;
        textView.userInteractionEnabled = YES;
        //textView.text = @"First View First View First View First View First View First View First View First View First View First View First View First View First View First View First View First View First View First View First View First View First View First View First View First View First View First View ";
        [self.view addSubview: textView];
        self.title = @"first";
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"first1" image:nil tag:nil];
        
        
        datePicker = [[[UIDatePicker alloc]init]autorelease];
        datePicker.center = self.view.center;
        [self.view addSubview:datePicker];
        
        chooseTime.userInteractionEnabled = YES;
        chooseTime = [[[UILabel alloc]init]autorelease];
        chooseTime.text = @"选择的时间";
        chooseTime.frame = CGRectMake(0, 0, 250, 30);
        chooseTime.center = CGPointMake(centerX, centerY-150);
        [chooseTime setTextAlignment:NSTextAlignmentCenter];//文字居中
        chooseTime.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.view addSubview:chooseTime];
        
        UIButton * selected = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        selected.frame = CGRectMake(0, 0, 80, 30);
        selected.center =CGPointMake(centerX, centerY+120);
        [selected setTitle:@"确定" forState:UIControlStateNormal];
        [selected addTarget:self action:@selector(checkTime) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:selected];
        
        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"00");
}

- (void)checkTime{
    NSDateFormatter * formatter = [[[NSDateFormatter alloc]init]autorelease];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    NSString * dateString = [formatter stringFromDate:datePicker.date];
    NSMutableString *date = [[NSMutableString alloc]initWithString:dateString];
    [date insertString:@"选择的时间:" atIndex:0];
    chooseTime.text = date;
    //[chooseTime sizeToFit];
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
