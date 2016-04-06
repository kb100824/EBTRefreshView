//
//  EBTRefreshView.m
//  EBTRefreshViewDemo
//
//  Created by ebaotong on 16/3/25.
//  Copyright © 2016年 com.csst. All rights reserved.
//

#import "EBTRefreshView.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface EBTRefreshView ()
{
    CAShapeLayer *layerCircle;
    CAShapeLayer *layerImageView;


}
@end
@implementation EBTRefreshView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setUp];
        
}
    return self;

}
- (void)awakeFromNib
{
    [self setUp];
}
- (void)setUp
{
   
    layerCircle = [CAShapeLayer layer];
    layerCircle.frame = self.bounds;
    layerCircle.lineWidth = 1.5f;
    layerCircle.strokeColor = UIColorFromRGB(0xC89D7C).CGColor;
    layerCircle.fillColor = [UIColor clearColor].CGColor;
    layerCircle.lineCap = kCALineCapRound;
    
    [self.layer addSublayer:layerCircle];
    
    layerImageView = [CAShapeLayer layer];
    layerImageView.frame = CGRectMake((self.bounds.size.width-20)/2.f, (self.bounds.size.height-20)/2.f, 20, 20);
    layerImageView.fillColor = nil;
    layerImageView.masksToBounds = YES;
    layerImageView.contentsGravity = kCAGravityResizeAspect;
    layerImageView.contentsScale = [UIScreen mainScreen].scale;
    [self.layer addSublayer:layerImageView];
    

}
- (void)setImageName:(UIImage *)imageName
{
    _imageName = imageName;
    layerImageView.contents = (id)_imageName.CGImage;
    [self drawPath];
    
}

-(void)drawPath
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat startAngle = -M_PI_2;
    CGFloat step = M_PI * 1.8 * self.progressValue;
    
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidX(self.bounds));
    [path addArcWithCenter:center radius:self.bounds.size.width / 6.0f startAngle:startAngle endAngle:startAngle + step clockwise:YES];
    
    layerCircle.path = [path CGPath];
}
/**
 *  开始动画
 */
-(void)startAnimation
{
    [layerCircle removeAnimationForKey:@"RotationZAnimation"];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(0);
    animation.toValue = @(M_PI * 2);
    animation.repeatCount = MAXFLOAT;
    animation.duration = 0.5f;
    animation.fillMode = kCAFillModeForwards;
    
    [layerCircle addAnimation:animation forKey:@"RotationZAnimation"];
}

/**
 *  停止动画
 */
-(void)stopAnimation
{
    [layerCircle removeAnimationForKey:@"RotationZAnimation"];
}
@end
