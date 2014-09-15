//
//  ViewController.m
//  TestForView
//
//  Created by allen on 13-11-3.
//  Copyright (c) 2013年 allen. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (id)initWithAppDelegate:(id)appDelegate{
    self = [super init];
    if (self != nil) {
        credits = [[[UIBarButtonItem alloc]initWithTitle:@"Credits" style:UIBarButtonItemStylePlain target:appDelegate action:@selector(credits)]autorelease];
        self.navigationItem.rightBarButtonItem = credits;
        
        UIBarButtonItem * showAlert = [[[UIBarButtonItem alloc]initWithTitle:@"showAlert" style:UIBarButtonItemStylePlain target:self action:@selector(showAlert)]autorelease];
        self.navigationItem.leftBarButtonItem = showAlert;
        
        segmentedControl = [[UISegmentedControl alloc]initWithItems:nil];
        segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
        [segmentedControl insertSegmentWithTitle:@"Bunnies" atIndex:0 animated:NO];
        [segmentedControl insertSegmentWithTitle:@"Ponies" atIndex:1 animated:NO];
        [segmentedControl insertSegmentWithTitle:@"Hax" atIndex:2 animated:  NO];
        
        [segmentedControl addTarget:self action:@selector(controlPressed:) forControlEvents:UIControlEventValueChanged];
        
        self.navigationItem.titleView = segmentedControl;
        segmentedControl.selectedSegmentIndex = 0;
        
        background = [[BackgroundOfBunnies alloc]init];
        backgroundOfPoies = [[BackgroundOfPoies alloc]init];
        backgroundOfHax = [[BackgroundOfHax alloc]init];
    }
    return  self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

- (void)showAlert{
    //NSLog(@"alert");
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"alert" message:@"It's time to eat" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        NSLog(@"cancel");
        alertView.message = @"!!!!";
    }else NSLog(@"OK");
}

- (void)SetPage{
    
    NSInteger index = segmentedControl.selectedSegmentIndex;
    if (index == 0) {
            [self.view bringSubviewToFront:background.view];
        //backgroundOfHax.view.hidden = YES;
        //backgroundOfPoies.view.hidden =YES;
    }else if(index == 1){
            [self.view bringSubviewToFront:backgroundOfPoies.view];
    }else if(index == 2){
        [self.view bringSubviewToFront:backgroundOfHax.view];
    }
}

- (void)controlPressed:(id) sender{
    [self SetPage];
}

-(void)loadView{
    [super loadView];
    
    [self SetPage];
    [self.view addSubview: background.view];
    [self.view addSubview:backgroundOfPoies.view];
    [self.view addSubview:backgroundOfHax.view];
    [self.view bringSubviewToFront:background.view];
}

- (void)dealloc{
    [textView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


@implementation CreditsViewController

- (id)initWithAppDelegate:(id)appDelegate{
    self = [super init];
    if (self != nil) {
        
        //导航栏
        UIBarButtonItem * back = [[[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:appDelegate action:@selector(back)]autorelease];
        self.navigationItem.backBarButtonItem = back;
        
        UIBarButtonItem * sheet = [[[UIBarButtonItem alloc]initWithTitle:@"sheet" style:UIBarButtonItemStylePlain target:self action:@selector(sheet)]autorelease];
        self.navigationItem.rightBarButtonItem = sheet;
        
        //文本
        CGRect bounds = [[UIScreen mainScreen]applicationFrame];
        textViewForCredits = [[UITextView alloc]initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height-50)];
        
        //工具栏
        UIToolbar * myToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0.0f, 518.0f, 320.0f, 50.0f)];
        UIBarButtonItem * button1 = [[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(buttonDidPush)]autorelease];
        UIBarButtonItem * space = [[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:Nil]autorelease];
        UIBarButtonItem * button2 = [[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(buttonDidPush)]autorelease];
        
        NSArray * buttons = [NSArray arrayWithObjects:button1,space,button2, nil];
        [myToolbar setItems:buttons animated:YES];
        [self.view addSubview:myToolbar];
        
        //文本框
        textField1 = [[UITextField alloc]init];
        textField1.frame = CGRectMake(80, 200, 160, 30);
        [self.view addSubview:textField1];
        textField1.backgroundColor = [UIColor groupTableViewBackgroundColor];
        textField1.borderStyle = UITextBorderStyleRoundedRect;
        textField1.delegate = self;
        
        //滑块
        slider = [[[UISlider alloc]init]autorelease];
        slider.minimumValue = 0.0;
        slider.maximumValue = 1.0;
        slider.value = 0.5;
        [slider addTarget:self action:@selector(sliderDidChange:) forControlEvents:UIControlEventValueChanged];
        self.navigationItem.titleView = slider;
        label_ = [[[UILabel alloc]init]autorelease];
   
    }
    return self;
}

- (void)sliderDidChange:(id)sender{
    if ([sender isKindOfClass:[UISlider class]]) {
        UISlider * sliders = sender;
        textViewForCredits.font = [UIFont boldSystemFontOfSize:(26 * sliders.value)];
    }
}

- (void)buttonDidPush{
    NSLog(@"refresh");
}

- (void)sheet{
    UIActionSheet * mySheet = [[UIActionSheet alloc]initWithTitle:@"mySheet" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"Delete" otherButtonTitles:@"OK", nil];
    [self.view addSubview:mySheet];
    [mySheet showInView:self.view];
}

- (void)loadView{
    [super loadView];
    textViewForCredits.editable = NO;
    textViewForCredits.text = @"iPhone SDK Application Development\n"
                     "Copyright (c) 2008, O'Reilly Media.";
    [self.view addSubview: textViewForCredits];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField isFirstResponder]) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)dealloc{
    [textViewForCredits release];
    [super dealloc];
}

@end