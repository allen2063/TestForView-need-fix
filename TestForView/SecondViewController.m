//
//  SecondViewController.m
//  TestForView
//
//  Created by ZengYifei on 14-3-10.
//  Copyright (c) 2014年 allen. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"
@interface SecondViewController ()

@end

@implementation SecondViewController
- (void)dealloc{
    if (webView.loading) {
        [webView stopLoading];
    }
    webView.delegate = nil;
    [webView release];
    [reloadButton release];
    [stopButton release];
    [backButton release];
    [forwardButton release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CGRect bounds = [[UIScreen mainScreen]applicationFrame];
        UITextView * textView =  [[UITextView alloc]initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y+44, bounds.size.width, bounds.size.height)];
        textView.editable = NO;
        textView.text = @"second View second View second View second View second View second View second View second View second View second View second View second View second View second View second View second View second View second View second View second View second View  ";
        [self.view addSubview: textView];
        self.title = @"second";
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"second2" image:nil tag:nil];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"UIWebView测试";
    webView = [[UIWebView alloc ]init];
    webView.delegate = self;
    webView.frame = self.view.frame;
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:webView];
    
    reloadButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reloadDidPush)];
    backButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(backDidPush)];
    forwardButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(forwardDidPush)];
    stopButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(stopDidPush)];
    
    NSArray * butttons = [NSArray arrayWithObjects:backButton,forwardButton,reloadButton,stopButton, nil];
    [self setToolbarItems:butttons animated:YES];
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
