//
//  ViewController.m
//  EBTRefreshViewDemo
//
//  Created by ebaotong on 16/3/25.
//  Copyright © 2016年 com.csst. All rights reserved.
//

#import "ViewController.h"
#import "EBTRefreshView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

    
}
- (IBAction)btnClick:(id)sender {
    
    EBTRefreshView *refresh = [[EBTRefreshView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
        refresh.progressValue = 0.75;
        refresh.imageName = [UIImage imageNamed:@"1"];
        [refresh startAnimation];
        [self.view addSubview:refresh];

    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
