//
//  JYDropDownItemCell.m
//  PicaDo
//
//  Created by YunQue on 2017/10/25.
//  Copyright © 2017年 owen. All rights reserved.
//

#import "JYDropDownItemCell.h"
#import "JYDropDownMenuItem.h"


@implementation JYDropDownItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setupUI:(JYDropDownMenuItem *)menuItem{
    
    self.correctImg.hidden = !menuItem.isCurrentSelectedItem;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:menuItem.value];
    if (menuItem.isCurrentSelectedItem) {
       
        [self.cellTitleAttributesDic setObject:self.selectedTitleColor forKey:NSForegroundColorAttributeName];
    }else{
        
        [self.cellTitleAttributesDic setObject:self.normalTitleColor forKey:NSForegroundColorAttributeName];
    }
    [attributedString addAttributes:self.cellTitleAttributesDic range:NSMakeRange(0, attributedString.length)];
    self.itemTitle.attributedText = attributedString;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
