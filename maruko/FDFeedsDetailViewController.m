//
//  FDFeedDetailViewController.m
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDFeedsDetailViewController.h"
#import "FDTextViewController.h"
#import "FDStarService.h"

@implementation FDFeedsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FDBarButtonItem *rightItem = [FDBarButtonItem itemWithTitle:@"评论" Color:ColorNormalNaviTitle Target:self Action:@selector(comment:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    WeakSelf;
    
    [self.viewModel fetchModelWithType:FDFetchModeNew Callback:^(NSArray *objects, NSError *error) {
        StrongSelf;
        [s_self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationLeft];
    }];
    
}

- (void)comment:(FDBarButtonItem *)item {
    
    FDFeed *feed = [(FDFeedsDetailViewModel *)self.viewModel feed];
    
    FDTextViewControllerCallback callback = ^(NSString *text, FDBaseViewController *viewController) {
        NSString *content = text;
        
        if (!content.length) {
            return [FDAlert alertWithTitle:@"错误" Message:@"评论不能为空"];
        }
        
        [FDStarService postCommentWithParms:@{@"news_id" : feed.objectID,
                                              @"content" : content}
                                   Callback:^(BOOL success) {
                                       if (success) {
                                           [viewController dismissViewControllerAnimated:YES completion:nil];
                                       }
                                   }];
    };
    
    FDTextViewController *textViewController = [FDTextViewController new];
    textViewController.title = @"评论";
    textViewController.callback = callback;
    
    [UIWindow presentViewController:textViewController Animated:YES Completion:nil];
}

@end
