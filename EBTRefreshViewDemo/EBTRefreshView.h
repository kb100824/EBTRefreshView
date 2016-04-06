//
//  EBTRefreshView.h
//  EBTRefreshViewDemo
//
//  Created by ebaotong on 16/3/25.
//  Copyright © 2016年 com.csst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EBTRefreshView : UIView
@property(nonatomic,copy)UIImage *imageName;
@property(nonatomic,assign)CGFloat progressValue;

- (void)startAnimation;

- (void)stopAnimation;


@end
