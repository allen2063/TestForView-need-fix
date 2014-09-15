//
//  BackgroundOfHax.m
//  TestForView
//
//  Created by ZengYifei on 14-3-11.
//  Copyright (c) 2014年 allen. All rights reserved.
//

#import "BackgroundOfHax.h"

@interface BackgroundOfHax ()

@end

@implementation BackgroundOfHax

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        ThirdViewController * tab3 = [[ThirdViewController alloc]init];
//        SecondViewController * tab2 = [[SecondViewController alloc]init];
//        
//        UINavigationController *tab2Nav = [[[UINavigationController alloc] init] autorelease];
//        [tab2Nav pushViewController:tab2 animated:NO];
//        
//        self.viewControllers = [NSArray arrayWithObjects:tab3,tab2, nil];
        
        self.title = @"UIWebView测试";
        webView = [[UIWebView alloc ]init];
        webView.delegate = self;
        CGRect bounds = [[UIScreen mainScreen]applicationFrame];
        webView.frame = CGRectMake(bounds.origin.x, bounds.origin.y+44, bounds.size.width, bounds.size.height);
        webView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:webView];
    
        reloadButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reloadDidPush)];
        backButton = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(backDidPush)];
        
        forwardButton = [[UIBarButtonItem alloc]initWithTitle:@"Forward" style:UIBarButtonItemStyleBordered target:self action:@selector(forwardDidPush)];
        stopButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(stopDidPush)];
        
        UIToolbar * myToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0.0f, 518.0f, 320.0f, 50.0f)];
        NSArray * butttons = [NSArray arrayWithObjects:backButton,forwardButton,reloadButton,stopButton, nil];
            //[self setToolbarItems:butttons animated:YES];
        [myToolbar setItems:butttons animated:YES];
        [self.view addSubview:myToolbar];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //    self.title = @"UIWebView测试";
    //    webView = [[UIWebView alloc ]init];
    //    webView.delegate = self;
    //    webView.frame = self.view.frame;
    //    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    //    [self.view addSubview:webView];
    //
    //    reloadButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reloadDidPush)];
    //    backButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(backDidPush)];
    //    forwardButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(forwardDidPush)];
    //    stopButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(stopDidPush)];
    //
    //    NSArray * butttons = [NSArray arrayWithObjects:backButton,forwardButton,reloadButton,stopButton, nil];
    //    [self setToolbarItems:butttons animated:YES];
}

- (void)reloadDidPush{
    [webView reload];
}

- (void)stopDidPush{
    if (webView.loading) {
        [webView stopLoading];
    }
    
}

- (void)backDidPush{
    if (webView.canGoBack) {
        [webView goBack];
    }
}

- (void)forwardDidPush{
    if (webView.canGoForward) {
        [webView goForward];
    }
}

- (void)updateControlEnabled{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = webView.loading;
    stopButton.enabled = webView.loading;
    backButton.enabled = webView.canGoBack;
    forwardButton.enabled = webView.canGoForward;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com/"]];
    [webView loadRequest:request];
    [self updateControlEnabled];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self updateControlEnabled];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self updateControlEnabled];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self updateControlEnabled];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
