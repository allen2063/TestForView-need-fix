//
//  BackgroundOfPoies.m
//  TestForView
//
//  Created by ZengYifei on 14-3-11.
//  Copyright (c) 2014年 allen. All rights reserved.
//

#import "BackgroundOfPoies.h"

@interface BackgroundOfPoies ()

@end

@implementation BackgroundOfPoies

- (void)dealloc{
    [keys release];
    [dataSource release];
    [super dealloc];
}

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
- (id)init
{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        // Custom initialization
        self.title = @"GroupTable";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    CGRect bounds = [[UIScreen mainScreen]applicationFrame];
    self.view.frame = CGRectMake(bounds.origin.x, bounds.origin.y+44, bounds.size.width, bounds.size.height);

    
    keys = [[NSArray alloc]initWithObjects:@"哺乳类",@"爬虫类",@"两栖类",@"鱼类", nil];
    NSArray * object1 = [NSArray arrayWithObjects:@"Monkey",@"Dog",@"Lion",@"Elephant", nil];
    NSArray * object2 = [NSArray arrayWithObjects:@"Snake",@"Gecko",@"Lion",@"Elephant", nil];
    NSArray * object3 = [NSArray arrayWithObjects:@"Frog",@"Newts",@"Lion",@"Elephant", nil];
    NSArray * object4 = [NSArray arrayWithObjects:@"Shark",@"Salmon",@"Lion",@"Elephant", nil];
    NSArray * objects = [NSArray arrayWithObjects:object1,object2,object3,object4, nil];
    dataSource = [[NSDictionary alloc]initWithObjects:objects forKeys:keys];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView setEditing:YES animated:YES];
}

-  (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (UITableViewCellEditingStyleDelete == editingStyle) {
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id key = [keys objectAtIndex:section];
    return [[dataSource objectForKey:key]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"basis-cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell autorelease];
    }
    id key = [keys objectAtIndex:indexPath.section];
    NSString * text = [[dataSource objectForKey:key]objectAtIndex:indexPath.row];
    cell.textLabel.text = text;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [keys count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return  [keys objectAtIndex:section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return  keys;
}













- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
