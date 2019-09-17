//
//  ViewController.m
//  炫酷的登陆界面
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "ViewController.h"
#import "basicView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]init];
    label.center = self.view.center;
    label.bounds = CGRectMake(0, 0, 100, 30);
    label.text = @"点击屏幕";
    [self.view addSubview:label];
    self.view.backgroundColor = [UIColor orangeColor];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    basicView *basic = [basicView new];
    [basic show];
}
@end
