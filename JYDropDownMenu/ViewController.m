//
//  ViewController.m
//  JYDropDownMenu
//
//  Created by YunQue on 2017/10/13.
//  Copyright © 2017年 YunQue. All rights reserved.
//

#import "ViewController.h"
#import "JYDropDownMenu.h"
#import <Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor lightGrayColor];
    
    JYDropDownMenu *dropDownMenu = [JYDropDownMenu new];
    [self.view addSubview:dropDownMenu];
    [dropDownMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(20, 0, 0, 0));
        make.height.equalTo(@45);
    }];
    dropDownMenu.selectedItem = ^(NSInteger sectionIdx, NSInteger rowIdx, NSArray<JYDropDownMenuItem *> *selectedItems) {
        
        NSLog(@"sectionIdx:%ld---rowIdx:%ld----selectedItems:%@",(long)sectionIdx,(long)rowIdx,selectedItems);
    };
    //section0
    NSMutableArray *section0DataArr = [NSMutableArray array];
    for (int index = 0; index < 5; index ++) {
        JYDropDownMenuItem *item = [JYDropDownMenuItem new];
        item.value = [@[@"苹果",@"橘子",@"香蕉",@"葡萄",@"iOS开发者"] objectAtIndex:index];
        [section0DataArr addObject:item];
        if (index == 0) {
            
            item.isCurrentSelectedItem = YES;
        }
    }
    //section1
    NSMutableArray *section1DataArr = [NSMutableArray array];
    for (int index = 0; index < 5; index ++) {
        JYDropDownMenuItem *item = [JYDropDownMenuItem new];
        item.value = [@[@"不努力",@"上班扯淡",@"虚度光阴",@"被社会淘汰",@"阿弥陀佛"] objectAtIndex:index];
        [section1DataArr addObject:item];
        if (index == 0) {
            
            item.isCurrentSelectedItem = YES;
        }
    }
    //section2
    NSMutableArray *section2DataArr = [NSMutableArray array];
    for (int index = 0; index < 4; index ++) {
        JYDropDownMenuItem *item = [JYDropDownMenuItem new];
        item.value = [@[@"吹牛逼",@"拍马屁",@"上位",@"屌丝"] objectAtIndex:index];
        [section2DataArr addObject:item];
        if (index == 0) {
            
            item.isCurrentSelectedItem = YES;
        }
    }
    //指定展示的元素
    dropDownMenu.currentShowItems = @[section0DataArr[0],section1DataArr[0],section2DataArr[0]];
    //数据源
    dropDownMenu.eachSectionListDataSource = @[section0DataArr,section1DataArr,section2DataArr];
    
    
    UIView *subVew = [UIView new];
    subVew.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:subVew];
    [subVew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dropDownMenu.mas_bottom).offset(60);
        make.left.bottom.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 30, 30, 30));
    }];
    
    //展示列表会根据JYDropDownMenu添加的父试图自动适应
    JYDropDownMenu *secondDropDownMenu = [JYDropDownMenu new];
    [subVew addSubview:secondDropDownMenu];
    [secondDropDownMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(subVew).insets(UIEdgeInsetsMake(20, 0, 0, 0));
        make.height.equalTo(@45);
    }];
    dropDownMenu.selectedItem = ^(NSInteger sectionIdx, NSInteger rowIdx, NSArray<JYDropDownMenuItem *> *selectedItems) {
        
        NSLog(@"sectionIdx:%ld---rowIdx:%ld----selectedItems:%@",(long)sectionIdx,(long)rowIdx,selectedItems);
    };
    //指定展示的元素
    secondDropDownMenu.currentShowItems = @[section0DataArr[0],section1DataArr[0],section2DataArr[0]];
    //数据源
    secondDropDownMenu.eachSectionListDataSource = @[section0DataArr,section1DataArr,section2DataArr];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
