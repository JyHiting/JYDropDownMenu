//
//  JYMenuButton.h
//  PicaDo
//
//  Created by YunQue on 2017/9/29.
//  Copyright © 2017年 owen. All rights reserved.
//

#import <UIKit/UIKit.h>
//标题图片间距
static CGFloat const titleImgSpace = 5;
//元素距离边框上下边距
static CGFloat const verticalMargeSpace = 5;
//元素距离边框左右边距
static CGFloat const horizontalMargeSpace = 10;

@class JYDropDownMenuItem;
@interface JYMenuButton : UIView

@property(nonatomic,strong)UILabel *btTitle;
@property(nonatomic,assign)BOOL jy_selected;
@property(nonatomic,strong)JYDropDownMenuItem *menuItem;
@property(nonatomic,strong)NSDictionary *currentShowTitleAttributes;

@end
