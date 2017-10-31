//
//  JYDropDownMenu.h
//  PicaDo
//
//  Created by YunQue on 2017/9/29.
//  Copyright © 2017年 owen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYDropDownMenuItem.h"

@interface JYDropDownMenu : UIView
//当前展示button的title属性
@property(nonatomic,strong)NSDictionary *currentShowTitleAttributes;
//展示列表title的属性
@property(nonatomic,strong)NSDictionary *cellTitleAttributesDic;
//展示列表title选中状态颜色
@property(nonatomic,strong)UIColor *selectedTitleColor;
//展示列表title未选中状态颜色
@property(nonatomic,strong)UIColor *normalTitleColor;
//展示列表cell高度默认45
@property(nonatomic,assign)CGFloat listTableRowHeight;
//展示列表高度默认220
@property(nonatomic,assign)CGFloat listTableHeight;
//选项分割线宽度
@property(nonatomic,assign)CGFloat splitLineWidth;
@property(nonatomic,strong)NSArray *currentShowItems;
//每一项之间的分割线的颜色
@property(nonatomic,strong)UIColor *splitLineColor;
//每一项的背景颜色
@property(nonatomic,strong)UIColor *menuBtBgColor;
//数据源
@property(nonatomic,strong)NSArray<NSArray<JYDropDownMenuItem *> *> *eachSectionListDataSource;
//选择回调方法
@property(nonatomic,copy)void(^selectedItem)(NSInteger sectionIdx,NSInteger rowIdx,NSArray<JYDropDownMenuItem *> *selectedItems);

@end
