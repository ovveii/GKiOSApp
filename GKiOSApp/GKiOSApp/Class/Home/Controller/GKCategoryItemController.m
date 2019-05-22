//
//  GKCategoryItemController.m
//  GKiOSApp
//
//  Created by wangws1990 on 2019/5/16.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKCategoryItemController.h"
#import "GKHomeHotCollectionViewCell.h"
#import "GKHomeCategoryModel.h"
@interface GKCategoryItemController ()
@property (nonatomic, strong) NSString *categoryID;
@end

@implementation GKCategoryItemController
+ (instancetype)vcWithCategoryId:(NSString *)categoryId{
    GKCategoryItemController *vc = [[GKCategoryItemController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.categoryID = categoryId;
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupEmpty:self.collectionView];
    [self setupRefresh:self.collectionView option:ATRefreshDefault];
    // Do any additional setup after loading the view.
}
- (void)refreshData:(NSInteger)page{
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    params[@"cateId"]   = self.categoryID ?:@"";
    params[@"isDown"]    = @"1";
    params[@"start"]    = @(1+(page-1)*30);
    params[@"end"]      = @(30);
    CGRect rect     = [UIScreen mainScreen].bounds;
    NSInteger width = (int) (rect.size.width * 2);
    NSInteger height   = (int) (rect.size.height * 2);
    params[@"imgSize"] = [NSString stringWithFormat:@"%lix%li",(long)width,(long)height];
    [GKHomeNetManager homeCategory:self.categoryID params:params success:^(id  _Nonnull object) {
        if (page == 1) {
            [self.listData removeAllObjects];
        }
        NSArray *listData= [NSArray modelArrayWithClass:GKHomeCategoryItemModel.class json:object[@"groupList"]];
        [self.listData addObjectsFromArray:listData];
        [self.collectionView reloadData];
        [self endRefresh:listData.count >=30];
    } failure:^(NSString * _Nonnull error) {
        [self endRefreshFailure];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
