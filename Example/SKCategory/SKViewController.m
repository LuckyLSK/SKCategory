//
//  SKViewController.m
//  SKCategory
//
//  Created by luckyLSK on 04/17/2019.
//  Copyright (c) 2019 luckyLSK. All rights reserved.
//

#import "SKViewController.h"
#import <SKCategory/SKCategory.h>


@interface SKViewController ()

@end

@implementation SKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *testLable = [UILabel labelWithTitle:@"测试" color:[UIColor redColor] font:[UIFont systemFontOfSize:14]];
    testLable.x = 100;
    testLable.y = 200;
    testLable.width = 200;
    testLable.height = 40;
    [self.view addSubview:testLable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
