//
//  TTKeyboardAvoidingScrollView.m
//  Pods
//
//  Created by Dhiraj Gupta on 7/16/16.
//
//

#import "TTKeyboardAvoidingScrollView.h"

@implementation TTKeyboardAvoidingScrollView

#pragma mark - Init & dealloc
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (void)awakeFromNib
{
    [self commonInit];
}

- (void)dealloc
{
    //    DLog(@"");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)commonInit
{
    //    DLog(@"Added keyboard notifications");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - Keyboard Handling
- (void)keyboardWillShow:(NSNotification *)notification
{
    //    DLog(@"%@",notification);
    NSDictionary *userInfo = [notification userInfo];
    if (userInfo)
    {
        CGSize keyboardSize = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        UIEdgeInsets edgeInset = UIEdgeInsetsMake(0, 0, keyboardSize.height + 100.0f, 0);
        self.contentInset = edgeInset;
        self.scrollIndicatorInsets = edgeInset;
    }
}
- (void)keyboardWillHide:(NSNotification *)notification
{
    //    DLog(@"%@",notification);
    NSDictionary *userInfo = [notification userInfo];
    if (userInfo)
    {
        UIEdgeInsets edgeInset = UIEdgeInsetsZero;
        self.contentInset = edgeInset;
        self.scrollIndicatorInsets = edgeInset;
    }
}

@end
