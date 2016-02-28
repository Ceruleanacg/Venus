//
//  FDFeedDetailHeaderView.m
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDFeedsDetailCell.h"
#import "FDImageViewerController.h"

@implementation FDFeedsDetailCell {
    NSMutableArray *_images;
}

- (instancetype)initWithFeed:(FDFeed *)feed {
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil]) {
        
        self.line.hidden = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        FDFeedType type = feed.type;
        
        _titleLabel = [UILabel labelWithText:feed.title
                                       Color:ColorFeedTitle
                                    FontSize:18
                                   Alignment:NSTextAlignmentLeft
                                       Light:NO];
        
        _titleLabel.numberOfLines = 0;
        
        _firstLine = [UIView new];
        _firstLine.backgroundColor = ColorFeedLine;
        
        if (type == FDFeedTypeNews) {
            _articleLabel = [UILabel labelWithText:feed.article.length ? feed.article : @"没有正文"
                                             Color:ColorFeedContent
                                          FontSize:16
                                         Alignment:NSTextAlignmentLeft Light:YES];
            _articleLabel.numberOfLines = 0;
        }
        
        _secondLine = [UIView new];
        _secondLine.backgroundColor = ColorTableSection;
        
        _imageViews = [NSMutableArray new];
        _images = [NSMutableArray new];
        
        for (NSString *imageURL in feed.imageURLs) {
            
            UIImageView *imageView = [[UIImageView alloc] initWithImage:FDImageWithName(@"Feeds_Placeholder")];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds = YES;
            imageView.layer.cornerRadius = 5.0;
            imageView.userInteractionEnabled = YES;
            imageView.tapAction = ^(UIView *view) {
                [FDImageViewerController previewImage:[(UIImageView *)view image]];
            };
            
            [_imageViews addObject:imageView];
            
            WeakSelf;
            
            [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:imageURL]
                                                            options:0
                                                           progress:nil
                                                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                                              
                                                              StrongSelf;
                                                              
                                                              [s_self->_images addObject:image];
                                                              
                                                              if (s_self->_images.count == feed.imageURLs.count) {
                                                                  for (NSInteger index = 0; index < feed.imageURLs.count; ++index) {
                                                                      [s_self.imageViews[index] setImage:s_self->_images[index]];
                                                                  }
                                                                  
                                                                  [s_self.tableView reloadData];
                                                              }
            }];
        }
        
        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:_firstLine];
        [self.contentView addSubview:_articleLabel];
        [self.contentView addSubview:_secondLine];
        
        for (UIImageView *imageView in _imageViews) {
            [self.contentView addSubview:imageView];
        }
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@10);
                make.right.equalTo(@(-10));
                make.top.equalTo(@15);
        }];
            
        [_firstLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(@0);
                make.top.equalTo(_titleLabel.mas_bottom).offset(15);
                make.height.equalTo(@0.5);
        }];
        
        if (type == FDFeedTypeNews) {
            [_articleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@10);
                make.right.equalTo(@(-10));
                make.top.equalTo(_firstLine.mas_bottom).offset(5);
            }];
        }
        
        UIView *spacingView = type == FDFeedTypeNews ? _articleLabel : _firstLine;
        
        UIImageView *previousImageView = nil;
        
        for (UIImageView *imageView in _imageViews) {
            
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@10);
                make.right.equalTo(@(-10));
                make.top.equalTo(imageView == [_imageViews firstObject] ? spacingView.mas_bottom : previousImageView.mas_bottom).offset(10);
                make.height.lessThanOrEqualTo(@450);
            }];
            
            previousImageView = imageView;
        }
        
        UIImageView *lastImageView = [_imageViews lastObject];
        
        [_secondLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastImageView ? lastImageView.mas_bottom : spacingView.mas_bottom).offset(10);
            make.left.right.bottom.equalTo(@0);
            make.height.equalTo(@10);
        }];
    }
    return self;
}

@end
