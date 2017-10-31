//
//  JYDropDownMenuItem.h
//  PicaDo
//
//  Created by YunQue on 2017/10/18.
//  Copyright © 2017年 owen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYDropDownMenuItem : NSObject
//必须要有的字段(展示的标题内容)
@property(nonatomic,copy)NSString *value;
//下面的属性字段根据业务需要自己添加
@property(nonatomic,assign)NSInteger no;
//是否是选中状态
@property(nonatomic,assign)BOOL isCurrentSelectedItem;

@end
