//
//  JYMenuButton.m
//  PicaDo
//
//  Created by YunQue on 2017/9/29.
//  Copyright © 2017年 owen. All rights reserved.
//

#import "JYMenuButton.h"
#import "JYDropDownMenuItem.h"

@interface JYMenuButton()

@property(nonatomic,strong)UIImageView *btImage;

@end
@implementation JYMenuButton

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
      
        self.jy_selected = NO;
    }
    return self;
}

-(instancetype)init{
    
    if (self = [super init]) {
        
        self.jy_selected = NO;
    }
    return self;
}

-(void)layoutSubviews{
    
    if (self.btTitle) {
  
        self.btTitle.attributedText = [[NSAttributedString alloc] initWithString:_menuItem.value attributes:self.currentShowTitleAttributes];
    }else{
        
        UILabel *title = [UILabel new];
        title.textAlignment = NSTextAlignmentCenter;
        self.btTitle = title;
        self.btTitle.attributedText = [[NSAttributedString alloc] initWithString:_menuItem.value attributes:self.currentShowTitleAttributes];
        [self addSubview:title];
        
        UIImageView *arrowImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jy_arrow_down"]];
        self.btImage = arrowImg;
        [self addSubview:arrowImg];
        
        arrowImg.frame = CGRectMake(self.bounds.size.width - arrowImg.bounds.size.width - horizontalMargeSpace, self.bounds.size.height / 2 - arrowImg.bounds.size.height / 2, arrowImg.bounds.size.width, arrowImg.bounds.size.height);
        title.frame = CGRectMake(horizontalMargeSpace, verticalMargeSpace, self.bounds.size.width - horizontalMargeSpace - titleImgSpace - arrowImg.bounds.size.width - horizontalMargeSpace, self.bounds.size.height - verticalMargeSpace * 2);
        [self addObserver:self forKeyPath:@"jy_selected" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    }
}

-(void)setMenuItem:(JYDropDownMenuItem *)menuItem{
    
    _menuItem = menuItem;
    [self setNeedsLayout];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"jy_selected"]) {
        if ([[change objectForKey:@"new"] boolValue]) {
            
            [UIView animateWithDuration:0.2 animations:^{
                
                [self.btImage setTransform:CGAffineTransformMakeRotation(M_PI)];
            } completion:^(BOOL finished) {
                
            }];
        }else{
            
            [UIView animateWithDuration:0.2 animations:^{
                
                [self.btImage setTransform:CGAffineTransformMakeRotation(0)];
            } completion:^(BOOL finished) {
                
            }];
        }
    }
}

-(void)dealloc{
    
    [self removeObserver:self forKeyPath:@"jy_selected"];
}

@end
