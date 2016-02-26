//
//  FDFeedsDetailCommentCell.m
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDFeedsDetailCommentCell.h"

@implementation FDFeedsDetailCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _avatarIcon   = [[UIImageView alloc] init];
        _avatarIcon.layer.cornerRadius = 14;
        _avatarIcon.layer.masksToBounds = YES;
        
        _nameLabel    = [UILabel labelWithText:@"" Color:ColorCommentName FontSize:12 Alignment:NSTextAlignmentLeft Light:YES];
        
        _contentLabel = [UILabel labelWithText:@"" Color:ColorCommentContent FontSize:12 Alignment:NSTextAlignmentLeft Light:YES];
        _contentLabel.numberOfLines = 0;
        
        _createDateLabel = [UILabel labelWithText:@"" Color:ColorCommentDate FontSize:10 Alignment:NSTextAlignmentRight Light:YES];
        
        [self.contentView addSubview:_avatarIcon];
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_contentLabel];
        [self.contentView addSubview:_createDateLabel];
        
        [_avatarIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@10);
            make.size.mas_equalTo(CGSizeMake(28, 28));
        }];
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_avatarIcon);
            make.left.equalTo(_avatarIcon.mas_right).offset(10);
        }];
        
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_nameLabel);
            make.top.equalTo(_nameLabel.mas_bottom).offset(10);
            make.right.equalTo(@(-5));
        }];
        
        [_createDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_contentLabel.mas_bottom).offset(10);
            make.right.equalTo(@(-5));
        }];
        
        [self.line mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_createDateLabel.mas_bottom).offset(5);
            make.left.right.equalTo(@0);
            make.height.equalTo(@0.5);
            make.bottom.equalTo(@0);
        }];
    }
    return self;
}

- (void)bindWithModel:(FDBaseModel *)model {
    if (![model isKindOfClass:[FDComment class]]) {
        return;
    }
    
    FDComment *comment = (FDComment *)model;
    
    [_avatarIcon sd_setImageWithURL:[NSURL URLWithString:comment.user.avatarURL] placeholderImage:[UIImage new]];
    
    [_nameLabel setText:comment.user.nickname];
    
    [_contentLabel setText:comment.content];
    
    NSDate *createDate = [FDDateFormatter dateFromString:comment.createDate];
    
    NSDateComponents *components = [FDDateFormatter dateComponentsFromDate:createDate];
    
    NSString *timeString = [NSString stringWithFormat:@"%ld月%ld日 · %ld时%ld分",
                            [components month],
                            [components day],
                            [components hour],
                            [components minute]];
    
    [_createDateLabel setText:timeString];
}

@end
