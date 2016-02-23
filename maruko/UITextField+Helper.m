//
//  UITextField+Helper.m
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "UITextField+Helper.h"

static NSString *_editingActionKey  = @"editingActionKey";
static NSString *_doneActionKey     = @"doneActionKey";
static NSString *_beginActionKey    = @"beginActionKey";

@implementation UITextField (Helper)

- (instancetype)init {
    if (self = [super init]) {
        [self addTarget:self action:@selector(editingAction:)  forControlEvents:UIControlEventEditingChanged];
        [self addTarget:self action:@selector(doneAction:)  forControlEvents:UIControlEventEditingDidEndOnExit];
        [self addTarget:self action:@selector(beginAction:) forControlEvents:UIControlEventEditingDidBegin];
    }
    return self;
}

- (void)setEditingAction:(FDTextFieldAction)editingAction {
    objc_setAssociatedObject(self, &_editingActionKey, editingAction, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FDTextFieldAction)editingAction {
    return objc_getAssociatedObject(self, &_editingActionKey);
}

- (void)setDoneAction:(FDTextFieldAction)doneAction {
    objc_setAssociatedObject(self, &_doneActionKey, doneAction, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FDTextFieldAction)doneAction {
    return objc_getAssociatedObject(self, &_doneActionKey);
}

- (void)setBeginAction:(FDTextFieldAction)beginAction {
    objc_setAssociatedObject(self, &_beginActionKey, beginAction, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FDTextFieldAction)beginAction {
    return objc_getAssociatedObject(self, &_beginActionKey);
}

- (void)editingAction:(id)sender {
    if (self.editingAction) {
        
        __weak UITextField *textField = self;
        
        NSString *text = self.text;
        
        self.editingAction(text, textField);
    }
}

- (void)doneAction:(id)sender {
    if (self.doneAction) {
        
        __weak UITextField *textField = self;
        
        NSString *text = self.text;
        
        self.doneAction(text, textField);
    }
}

- (void)beginAction:(id)sender {
    if (self.beginAction) {
        
        __weak UITextField *textField = self;
        
        NSString *text = self.text;
        
        self.beginAction(text, textField);
    }
}


@end
