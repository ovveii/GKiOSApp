//
//  GKNewItemTraCell.h
//  GKiOSApp
//
//  Created by wangws1990 on 2019/5/23.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKNewItemBaseCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface GKNewItemTraCell : GKNewItemBaseCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIImageView *imageFirst;
@property (weak, nonatomic) IBOutlet UIImageView *imageCenter;
@property (weak, nonatomic) IBOutlet UIImageView *imageLast;

@end

NS_ASSUME_NONNULL_END
