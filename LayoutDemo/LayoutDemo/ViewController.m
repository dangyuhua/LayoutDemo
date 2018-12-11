//
//  ViewController.m
//  LayoutDemo
//
//  Created by 党玉华 on 2018/12/10.
//  Copyright © 2018年 dangyuhua. All rights reserved.
//

#import "ViewController.h"

#define ScreenW self.view.frame.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *bgview = [[UIView alloc]init];
    bgview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bgview];
    NSArray *array = @[@"东方大厦",@"方法",@"反反复复反反复复",@"共",@"大声点大叔的",@"f",@"都撒到",@"大声点啊到底",@"得到的",@"点点滴滴的",@"是官方广告",@"刚刚",@"刚刚好",@"斤斤计较",@"胡特如图",@"后天如火如荼"];
    CGFloat x = 15;
    CGFloat y = 10;
    for (int i=0; i<array.count; i++) {
        CGFloat width = [self calculatedStringWidth:array[i] WithSize:CGSizeMake(MAXFLOAT, 30) font:15]+30;
        if (x+width+10>ScreenW) {
            x = 15;
            y += 40;
        }
        UIButton *btn = [self UIButtonWithFrame:CGRectMake(x, y, width, 30) backgroundColor:[UIColor greenColor] title:array[i] image:nil selectImage:nil font:15 textColor:[UIColor whiteColor] selectTextColor:[UIColor whiteColor] edgeInsets:UIEdgeInsetsZero tag:i target:self action:@selector(btnClick:)];
        btn.layer.cornerRadius = 5;
        x = x + width + 10;
        [bgview addSubview:btn];
    }
    bgview.frame = CGRectMake(0, 100, ScreenW, y+40);
}

-(void)btnClick:(UIButton *)btn{
    NSLog(@"%@",btn.titleLabel.text);
}

-(CGFloat)calculatedStringWidth:(NSString *)string WithSize:(CGSize)size font:(CGFloat)fontSize{
    CGFloat h = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size.width;
    return h;
}
-(UIButton *)UIButtonWithFrame:(CGRect )frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage font:(CGFloat)font textColor:(UIColor *)textColor selectTextColor:(UIColor *)selectTextColor edgeInsets:(UIEdgeInsets )edgeInsets tag:(NSInteger)tag target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = backgroundColor;
    button.frame = frame;
    if (title != nil) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:textColor forState:UIControlStateNormal];
        [button setTitleColor:selectTextColor forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:font];
        button.titleEdgeInsets = edgeInsets;
    }else{
        [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
        button.imageEdgeInsets = edgeInsets;
    }
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
