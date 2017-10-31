//
//  JYDropDownItemCell.h
//  PicaDo
//
//  Created by YunQue on 2017/10/25.
//  Copyright © 2017年 owen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JYDropDownMenuItem;
@interface JYDropDownItemCell : UITableViewCell

@property(nonatomic,strong)NSMutableDictionary *cellTitleAttributesDic;
@property(nonatomic,strong)UIColor *selectedTitleColor;
@property(nonatomic,strong)UIColor *normalTitleColor;
@property (weak, nonatomic) IBOutlet UILabel *itemTitle;
@property (weak, nonatomic) IBOutlet UIImageView *correctImg;

-(void)setupUI:(JYDropDownMenuItem *)menuItem;
@end
