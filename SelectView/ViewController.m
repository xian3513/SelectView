//
//  ViewController.m
//  SelectView
//
//  Created by kt on 15/1/12.
//  Copyright (c) 2015年 kt. All rights reserved.
//

#import "ViewController.h"
#import "SelectView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SelectView *view = [[SelectView alloc]initWithFrame:CGRectMake(20, 40, 300, 300)];
    [self.view addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
