//
//  starRating.m
//  评价
//
//  Created by tusm on 2016/10/28.
//  Copyright © 2016年 帝国天下. All rights reserved.
//

#import "starRating.h"

@interface StarRating ()
{
    UIButton *preBTN;
}
@property(nonatomic,weak)UILabel *textLabel;

@property(nonatomic,strong)NSMutableArray *btnArray;

@end
@implementation StarRating

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 创建一个可变数组
        self.btnArray = [[NSMutableArray alloc]init];
        //1.初始化按钮
        [self setupButton];
        //2.初始化文本框
        [self setupLabel];
    }
    
    return self;
}

//初始化文本框
-(void)setupLabel
{
    //1. 创建一个静态文本框
    UILabel *label = [[UILabel alloc]init];
    //2. 设置文本框的属性
    label.textColor = [UIColor redColor];
    label.frame = CGRectMake(0, 0, 100, 30);
    label.center = CGPointMake(self.center.x + 30, self.center.y);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:13];
    [self addSubview:label];
    self.textLabel = label;
}
//初始化按钮
-(void)setupButton
{
    for (int i = 0; i < 5; i++) {
        
        // 1.创建按钮
        UIButton *btn = [[UIButton alloc]init];
        
        //2.设置属性
        //2.1 普通状态下的按钮背景
        [btn setBackgroundImage:[UIImage imageNamed:@"star2"] forState:UIControlStateNormal];
        // 2.2选中状态下的按钮背景
        [btn setBackgroundImage:[UIImage imageNamed:@"star"] forState:UIControlStateSelected];
        CGFloat margin = 10;
        CGFloat btnY = self.center.y;
        CGFloat btnW = 30;
        CGFloat btnH = 30;
        CGFloat btnX = i * btnW + margin;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        //3.设置按钮点击事件
        [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchDown];
        
        //4.将按钮添加到视图中
        [self addSubview:btn];
        //5.设置tag
        btn.tag = i;
        //6.将按钮添加到数组中
        [self.btnArray addObject:btn];
    }
}

-(void)btnOnClick:(UIButton *)btn
{
    //1. 被点击的按钮之前之后的按钮状态改变
    for(UIButton *button in self.btnArray)
    {
        if (button.tag <= btn.tag) {
            if ((preBTN.tag == btn.tag)&&(button.tag==btn.tag)) {
                btn.selected = !btn.selected;
            }else{
                button.selected = YES;
            }
        }else{
            button.selected = NO;
        }
        
    }
    //2.上一次被点击的按钮
    preBTN = btn;
    //3.设置静态文本框的内容
    if (btn.selected) {
        [self.textLabel  setText:[NSString stringWithFormat:@"%ld分好评",btn.tag + 1]];
    }else
    {
        [self.textLabel  setText:[NSString stringWithFormat:@"%ld分好评",btn.tag]];
    }
    
}

@end
