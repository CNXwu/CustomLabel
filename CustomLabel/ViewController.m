//
//  ViewController.m
//  CustomLabel
//
//  Created by Gaochao on 16/11/23.
//  Copyright © 2016年 tou360. All rights reserved.
//

#import "ViewController.h"
#import "CLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CLabel *label = [[CLabel alloc] initWithFrame:CGRectMake(20, 100, 300, 250)];
    label.verticalLocation = VerticalLocationMiddle;
    label.backgroundColor = [UIColor grayColor];
    label.text = @"我是一只小码农，我骄傲我自豪。我是一只小码农，我骄傲我自豪。我是一只小码农，我骄傲我自豪。我是一只小码农，我骄傲我自豪。我是一只小码农，我骄傲我自豪。我是一只小码农，我骄傲我自豪。我是一只小码农，我骄傲我自豪。";
    label.numberOfLines = 0;
    label.textColor = [UIColor greenColor];
    [self.view addSubview:label];
    
    [label setLineSpace:8.7];
    
    label.attributedText = [label setLabelText:label.text frontTextFontSize:24 frontColor:[UIColor redColor] andFrontRange:NSMakeRange(0, 4) behindTextFontSize:20 behindColor:[UIColor orangeColor] andBehindRange:NSMakeRange(8, 3)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
