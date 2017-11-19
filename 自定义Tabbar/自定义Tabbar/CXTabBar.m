//
//  CXTabBar.m
//  自定义Tabbar
//
//  Created by chenxiang on 2017/10/29.
//  Copyright © 2017年 chenxiang. All rights reserved.
//

#import "CXTabBar.h"
@interface CXTabBar()
@property (nonatomic, strong) UIButton * erweimaButton;
@property (nonatomic, strong) UIImageView * backgroundImageView;
@end
@implementation CXTabBar
- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    //去掉TabBar上部的横线
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIImageView class]] && obj.bounds.size.height <= 1) {
            UIImageView * lineView = (UIImageView *)obj;
            lineView.hidden = YES;
            *stop = YES;
        }
    }];
    if (!_erweimaButton) {
        [self addSubview:self.erweimaButton];
    }
    

    if (!_backgroundImageView) {
        [self addSubview:self.backgroundImageView];
    }
    
    //重新调整各控件的位置
    int btnIndex = 0;
    for (UIView * view in self.subviews) {
        
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            CGFloat height = CGRectGetHeight(self.frame);
            CGFloat width  = (CGRectGetWidth(self.frame) - height) / 2;
            
            CGFloat x  = btnIndex * width;
            CGFloat y  = 1;
            view.tag   = btnIndex;
            view.userInteractionEnabled = YES;
            if (btnIndex == 1) {
                self.erweimaButton.frame = CGRectMake(width, -5, height, height);
                self.erweimaButton.layer.cornerRadius  = CGRectGetWidth(self.erweimaButton.frame) / 2;

            }
            if (btnIndex > 0) {
                x = x + height;
            }
            
            view.frame = CGRectMake(x, y, width, height);
            
            btnIndex++;
        }
    }
    //将自定义button放在最上层
    [self bringSubviewToFront:self.erweimaButton];
    //背景图
    [self sendSubviewToBack:self.backgroundImageView];
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    //如果tabbar没消失，点击到自定义的button返回自定义的button
    if (self.isHidden == NO) {
        CGPoint pointBtn = [self convertPoint:point toView:self.erweimaButton];
        if ([self.erweimaButton pointInside:pointBtn withEvent:event]) {
            return self.erweimaButton;
        }
    }
    return [super hitTest:point withEvent:event];
}
#pragma makr -- erweimaButton点击方法
- (void)erweimaButtonClick:(UIButton *)sender{
    if ([self.tabbarDelegate respondsToSelector:@selector(presentQrcCodeController)]) {
        [self.tabbarDelegate presentQrcCodeController];
    }
}
#pragma makr -- 懒加载
- (UIButton *)erweimaButton{
    if (!_erweimaButton) {
        _erweimaButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _erweimaButton.backgroundColor = [UIColor blackColor];
        _erweimaButton.layer.masksToBounds = YES;
        [_erweimaButton addTarget:self action:@selector(erweimaButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _erweimaButton;
}
- (UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundImageView.image = [UIImage imageNamed:@"background.png"];
    }
    return _backgroundImageView;
}
@end
