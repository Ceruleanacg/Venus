//
//  FDFeedsCell.m
//  maruko
//
//  Created by 王澍宇 on 16/2/24.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDFeedsCell.h"

@implementation FDFeedsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.line.hidden = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _bottomSpaceView = [UIView new];
        _bottomSpaceView.backgroundColor = ColorTableSection;
        
        _avatarIcon  = [[UIImageView alloc] init];
        _avatarIcon.layer.masksToBounds = YES;
        _avatarIcon.layer.cornerRadius = 15;
        
        _nameLabel   = [UILabel labelWithText:@"" Color:ColorFeedName FontSize:12 Alignment:NSTextAlignmentLeft Light:YES];
        
        _sourceLabel = [UILabel labelWithText:@"  ·  ·  " Color:ColorFeedSource FontSize:10 Alignment:NSTextAlignmentRight Light:YES];
        
        _firstLine   = [[UIView alloc] init];
        _firstLine.backgroundColor = ColorFeedLine;
        
        _titleLabel  = [UILabel labelWithText:@"" Color:ColorFeedTitle FontSize:14 Alignment:NSTextAlignmentLeft Light:YES];
        _titleLabel.numberOfLines = 0;
        
        _feedImageView = [[UIImageView alloc] init];
        _feedImageView.contentMode = UIViewContentModeScaleAspectFill;
        _feedImageView.clipsToBounds = YES;
        _feedImageView.layer.cornerRadius = 5.0;
        
        _infoLabel = [UILabel labelWithText:@"" Color:ColorFeedInfo FontSize:12 Alignment:NSTextAlignmentLeft Light:YES];
        
        _favoIcon = [[UIImageView alloc] initWithImage:FDImageWithName(@"Feeds_Collect")];
        
        [self.contentView addSubview:_avatarIcon];
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_sourceLabel];
        [self.contentView addSubview:_firstLine];
        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:_feedImageView];
        [self.contentView addSubview:_infoLabel];
        [self.contentView addSubview:_favoIcon];
        [self.contentView addSubview:_bottomSpaceView];
        
        [_avatarIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@5);
            make.left.equalTo(@10);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_avatarIcon.mas_right).offset(10);
            make.centerY.equalTo(_avatarIcon);
        }];
        
        [_sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.equalTo(@(-10));
            make.centerY.equalTo(_avatarIcon);
        }];
        
        [_firstLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_avatarIcon.mas_bottom).offset(5);
            make.left.right.equalTo(@0);
            make.height.equalTo(@0.5);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_firstLine.mas_bottom).offset(10);
            make.left.equalTo(@10);
            make.right.equalTo(@(-10));
        }];
        
        [_feedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_titleLabel);
            make.right.equalTo(_titleLabel);
            make.top.equalTo(_titleLabel.mas_bottom).offset(10);
            make.height.equalTo(@190);
        }];
        
        [_favoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_infoLabel);
            make.right.equalTo(@(-10));
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
        
        [_infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_titleLabel);
            make.top.equalTo(_feedImageView.mas_bottom).offset(10);
        }];
        
        [_bottomSpaceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_infoLabel.mas_bottom).offset(5);
            make.left.right.bottom.equalTo(@0);
            make.height.equalTo(@10);
        }];
    }
    
    return self;
}

- (void)bindWithModel:(FDBaseModel *)model {
    
    if (![model isKindOfClass:[FDFeed class]]) {
        return;
    }
    
    FDFeed *feed = (FDFeed *)model;
    
    [_avatarIcon sd_setImageWithURL:[NSURL URLWithString:feed.star.avatarURL] placeholderImage:FDImageWithName(@"Feeds_Avatar_Placeholder")];
    
    _nameLabel.text = feed.star.name;
    
    NSString *feedType = feed.type == FDFeedTypeFeed ? @"动态" : @"新闻";
    
    NSDate *createDate = [FDDateFormatter dateFromString:feed.createDate];
    
    NSDateComponents *components = [FDDateFormatter dateComponentsFromDate:createDate];
    
    NSString *timeString = [NSString stringWithFormat:@"%ld月%ld日 · %ld时%ld分",
                            [components month],
                            [components day],
                            [components hour],
                            [components minute]];
    
    _sourceLabel.text = [NSString stringWithFormat:@"%@ · %@ · %@", feedType, feed.source, timeString];
    
    _titleLabel.text = feed.title;
    
    if (feed.imageURLs.count) {
        
        NSString *targetURL = [feed.imageURLs firstObject];
        
        [_feedImageView sd_setImageWithURL:[NSURL URLWithString:targetURL] placeholderImage:[UIImage new]];
    }
    
    _infoLabel.text = [NSString stringWithFormat:@"%ld阅读 · %ld评论", feed.readCount, feed.commentCount];
    
}


@end
