//
//  BSBDJRecommendUserCell.m
//  BAISIBUDEJIE
//
//  Created by zhurui on 2016/10/27.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import "BSBDJRecommendUserCell.h"

#import "BSBDJRecommendUser.h"

#import <UIImageView+WebCache.h>

@interface BSBDJRecommendUserCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end

@implementation BSBDJRecommendUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setUser:(BSBDJRecommendUser *)user
{
    _user = user;
    self.screenNameLabel.text = user.screen_name;
    self.fansCountLabel.text = [NSString stringWithFormat:@"%ld",user.fans_count];
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
