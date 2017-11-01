//
//  JYDropDownMenu.m
//  PicaDo
//
//  Created by YunQue on 2017/9/29.
//  Copyright © 2017年 owen. All rights reserved.
//

#import "JYDropDownMenu.h"
#import "JYMenuButton.h"
#import "JYDropDownItemCell.h"

static NSString *const cellId = @"JYDropDownItemCell";

@interface JYDropDownMenu()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *sectionBts;
@property(nonatomic,assign)NSUInteger currentSelectedSectionIndex;
@property(nonatomic,strong)UIView *sectionBgView;
@property(nonatomic,strong)UITableView *sectionDatasTable;
@property(nonatomic,strong)UIControl *tableBgView;

@end

@implementation JYDropDownMenu

-(instancetype)init{

    if (self = [super init]) {

        self.backgroundColor = [UIColor whiteColor];
        [self defaultSetting];
    }
    return self;
}

-(void)defaultSetting{
    
    _currentSelectedSectionIndex = -1;
    _splitLineColor = [UIColor colorWithRed:231.0/255.0f green:231.0/255.0f blue:231.0/255.0f alpha:1];
    _menuBtBgColor = [UIColor whiteColor];
    _selectedTitleColor = [UIColor darkTextColor];
    _normalTitleColor = [UIColor grayColor];
    _listTableRowHeight = 45;
    _listTableHeight = 220;
    _splitLineWidth = 0.5;
    _cellTitleAttributesDic = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    _currentShowTitleAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor colorWithRed:51.0/255.0f green:51.0/255.0f blue:51.0/255.0f alpha:1],NSBackgroundColorAttributeName:[UIColor whiteColor]};
}

-(void)layoutSubviews{
    
    if (self.sectionDatasTable) {
      
        if ([self.sectionBts count] == 0) {
            
            CGFloat menuBtWidth = (self.bounds.size.width - ([_currentShowItems count] - 1) * self.splitLineWidth) / [_currentShowItems count];
            [_currentShowItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                JYMenuButton *menuBt = [[JYMenuButton alloc] initWithFrame:CGRectMake((menuBtWidth + self.splitLineWidth) * idx, 0,menuBtWidth, _sectionBgView.bounds.size.height)];
                UITapGestureRecognizer *tapClick = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btClick:)];
                [menuBt addGestureRecognizer:tapClick];
                [menuBt setMenuItem:[_currentShowItems objectAtIndex:idx]];
                menuBt.tag = 1000 + idx;
                menuBt.backgroundColor = self.menuBtBgColor;
                menuBt.currentShowTitleAttributes = self.currentShowTitleAttributes;
                [self.sectionBgView addSubview:menuBt];
                [self.sectionBts addObject:menuBt];
            }];
        }else{
            
            [_sectionBts enumerateObjectsUsingBlock:^(JYMenuButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                [obj setMenuItem:[self.currentShowItems objectAtIndex:idx]];
            }];
        }
        [self.sectionDatasTable reloadData];
    }else{
        
        UIView *sectionBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 8, self.bounds.size.width, self.bounds.size.height - 2 * 8)];
        self.sectionBgView = sectionBgView;
        sectionBgView.backgroundColor = self.splitLineColor;
        [self addSubview:sectionBgView];
        self.sectionBts = [NSMutableArray array];
        self.sectionDatasTable = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.bounds.size.width, self.listTableHeight) style:UITableViewStylePlain];
        [self.sectionDatasTable registerNib:[UINib nibWithNibName:@"JYDropDownItemCell" bundle:nil] forCellReuseIdentifier:cellId];
        self.sectionDatasTable.delegate = self;
        self.sectionDatasTable.dataSource = self;
        self.sectionDatasTable.tableFooterView = [UIView new];
        self.sectionDatasTable.alpha = 0;
        UIControl *tableBgView = [[UIControl alloc] initWithFrame:CGRectMake(0, self.frame.origin.y + self.bounds.size.height, self.bounds.size.width, self.superview.bounds.size.height - (self.frame.origin.y + self.bounds.size.height))];
        self.tableBgView = tableBgView;
        [self.tableBgView addTarget:self action:@selector(tableBgViewClick) forControlEvents:UIControlEventTouchUpInside];
        tableBgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
        tableBgView.alpha = 0;
        [self.superview addSubview:tableBgView];
        [tableBgView addSubview:self.sectionDatasTable];
        
        CGFloat menuBtWidth = (self.bounds.size.width - ([_currentShowItems count] - 1) * self.splitLineWidth) / [_currentShowItems count];
        [_currentShowItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            JYMenuButton *menuBt = [[JYMenuButton alloc] initWithFrame:CGRectMake((menuBtWidth + self.splitLineWidth) * idx, 0,menuBtWidth, sectionBgView.bounds.size.height)];
            UITapGestureRecognizer *tapClick = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btClick:)];
            [menuBt addGestureRecognizer:tapClick];
            [menuBt setMenuItem:[_currentShowItems objectAtIndex:idx]];
            menuBt.tag = 1000 + idx;
            menuBt.currentShowTitleAttributes = self.currentShowTitleAttributes;
            menuBt.backgroundColor = self.menuBtBgColor;
            [sectionBgView addSubview:menuBt];
            [self.sectionBts addObject:menuBt];
        }];
    }
}

-(void)setCurrentShowTitleAttributes:(NSDictionary *)currentShowTitleAttributes{
    
    _currentShowTitleAttributes = currentShowTitleAttributes;
    [self setNeedsLayout];
}
-(void)setCellTitleAttributesDic:(NSDictionary *)cellTitleAttributesDic{
    
    _cellTitleAttributesDic = cellTitleAttributesDic;
    [self setNeedsLayout];
}
-(void)setSelectedTitleColor:(UIColor *)selectedTitleColor{
    
    _selectedTitleColor = selectedTitleColor;
    [self setNeedsLayout];
}
-(void)setNormalTitleColor:(UIColor *)normalTitleColor{
    
    _normalTitleColor = normalTitleColor;
    [self setNeedsLayout];
}
-(void)setListTableHeight:(CGFloat)listTableHeight{
    
    _listTableHeight = listTableHeight;
    [self setNeedsLayout];
}

-(void)setListTableRowHeight:(CGFloat)listTableRowHeight{
    
    _listTableRowHeight = listTableRowHeight;
    [self setNeedsLayout];
}

-(void)setMenuBtBgColor:(UIColor *)menuBtBgColor{
    
    _menuBtBgColor = menuBtBgColor;
    [self setNeedsLayout];
}


-(void)setCurrentShowItems:(NSArray *)currentShowItems{
    
    _currentShowItems = currentShowItems;
    [self setNeedsLayout];
}

-(void)setSplitLineColor:(UIColor *)splitLineColor{

    _splitLineColor = splitLineColor;
    self.sectionBgView.backgroundColor = _splitLineColor;
}

-(void)setEachSectionListDataSource:(NSArray<NSArray<JYDropDownMenuItem *> *> *)eachSectionListDataSource{
    
    _eachSectionListDataSource = eachSectionListDataSource;
    [self setNeedsLayout];
}

-(void)btClick:(UITapGestureRecognizer *)tapGesture{
    
    JYMenuButton *clickBt = (JYMenuButton *)tapGesture.view;
    [_sectionBts enumerateObjectsUsingBlock:^(JYMenuButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj != clickBt) {
            obj.jy_selected = NO;
        }
    }];
    clickBt.jy_selected = !clickBt.jy_selected;
    if (clickBt.jy_selected) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            self.sectionDatasTable.alpha = 1;
            self.tableBgView.alpha = 1;
            
        } completion:^(BOOL finished) {
            
            self.currentSelectedSectionIndex = clickBt.tag - 1000;
            [self.sectionDatasTable reloadData];
        }];
        
    }else{
        
        [UIView animateWithDuration:0.2 animations:^{
            
            self.sectionDatasTable.alpha = 0;
            self.tableBgView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            self.currentSelectedSectionIndex = -1;
            [self.sectionDatasTable reloadData];
        }];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.listTableRowHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    if (_currentSelectedSectionIndex == -1) {
        
        return 0;
    }
    return [[_eachSectionListDataSource objectAtIndex:_currentSelectedSectionIndex] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    JYDropDownItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.selectedTitleColor = self.selectedTitleColor;
    cell.normalTitleColor = self.normalTitleColor;
    cell.cellTitleAttributesDic = [NSMutableDictionary dictionaryWithDictionary:self.cellTitleAttributesDic];
    [cell setupUI:[[_eachSectionListDataSource objectAtIndex:_currentSelectedSectionIndex] objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        
        weakSelf.sectionDatasTable.alpha = 0;
        weakSelf.tableBgView.alpha = 0;
    } completion:^(BOOL finished) {
        
        JYMenuButton *selectedBt = [self.sectionBts objectAtIndex:self.currentSelectedSectionIndex];
        selectedBt.jy_selected = NO;
        [selectedBt setMenuItem:[[self.eachSectionListDataSource objectAtIndex:self.currentSelectedSectionIndex] objectAtIndex:indexPath.row]];
        NSMutableArray *tempArr = [NSMutableArray arrayWithArray:self.currentShowItems];
        [tempArr replaceObjectAtIndex:self.currentSelectedSectionIndex withObject:[[self.eachSectionListDataSource objectAtIndex:self.currentSelectedSectionIndex] objectAtIndex:indexPath.row]];
        for (NSInteger index = 0; index < [[self.eachSectionListDataSource objectAtIndex:self.currentSelectedSectionIndex] count]; index ++) {
            
            JYDropDownMenuItem *menuItem = [[self.eachSectionListDataSource objectAtIndex:self.currentSelectedSectionIndex] objectAtIndex:index];
            if (index == indexPath.row) {
                
                menuItem.isCurrentSelectedItem = YES;
            }else{
                
                menuItem.isCurrentSelectedItem = NO;
            }
        }
        self.currentShowItems = [tempArr copy];
        if (self.selectedItem) {
            self.selectedItem(self.currentSelectedSectionIndex, indexPath.row, self.currentShowItems);
        }
        self.currentSelectedSectionIndex = -1;
        [self.sectionDatasTable reloadData];
    }];
}

-(void)tableBgViewClick{
    
    self.sectionDatasTable.alpha = 0;
    self.tableBgView.alpha = 0;
    JYMenuButton *selectedBt = [self.sectionBts objectAtIndex:self.currentSelectedSectionIndex];
    selectedBt.jy_selected = NO;
}

@end
