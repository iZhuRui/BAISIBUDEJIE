//
//  BSBDJRecommendTagsCell.m
//  BAISIBUDEJIE
//
//  Created by zhurui on 2016/11/9.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import "BSBDJRecommendTagsCell.h"
#import "BSBDJRecommendTag.h"
#import <UIImageView+WebCache.h>

@interface BSBDJRecommendTagsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image_listView;
@property (weak, nonatomic) IBOutlet UILabel *theme_nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sub_numberLabel;

@end

@implementation BSBDJRecommendTagsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setRecommendTag:(BSBDJRecommendTag *)recommendTag
{
    _recommendTag = recommendTag;
    
    [self.image_listView sd_setImageWithURL:[NSURL URLWithString:recommendTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.theme_nameLabel.text = recommendTag.theme_name;
    self.sub_numberLabel.text = [NSString stringWithFormat:@"%zd人订阅",recommendTag.sub_number];
    
}

@end
