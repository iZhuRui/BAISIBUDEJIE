//
//  BSBDJRecommendCategoryCell.m
//  BAISIBUDEJIE
//
//  Created by zhurui on 2016/10/27.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import "BSBDJRecommendCategoryCell.h"

#import "BSBDJRecommendCategory.h"

@interface BSBDJRecommendCategoryCell ()
/** 选中时显示的指示器控件 */
@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;

@end

@implementation BSBDJRecommendCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.backgroundColor = edaifuRGBColor(244, 244, 244);
    
    //  当cell的selection为none时，即使cell选中了，内部的子控件也不会进入高亮状态
//    self.textLabel.textColor = edaifuRGBColor(78, 78, 78);
//    self.textLabel.highlightedTextColor = edaifuRGBColor(219, 21, 26);
//    UIView * bg = [[UIView alloc] init];
//    bg.backgroundColor = [UIColor clearColor];
//    self.selectedBackgroundView = bg;
}

-(void)setCategory:(BSBDJRecommendCategory *)category
{
    _category = category;
    
    self.textLabel.text = category.name;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //  重新调整内部textlabel的frame
    self.textLabel.Y = 2;
    self.textLabel.height = self.contentView.height - 2 * self.textLabel.Y;
}
/**
 *  可以在这个方法中监听cell的选中和取消选中
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.selectedIndicator.hidden = !selected;
    
    self.textLabel.textColor = selected ? edaifuRGBColor(219, 21, 26) : edaifuRGBColor(78, 78, 78);
    
    // Configure the view for the selected state
}

@end
