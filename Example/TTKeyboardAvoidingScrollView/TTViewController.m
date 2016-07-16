//
//  TTViewController.m
//  TTKeyboardAvoidingScrollView
//
//  Created by Dhiraj Gupta on 07/16/2016.
//  Copyright (c) 2016 Dhiraj Gupta. All rights reserved.
//

#import "TTViewController.h"
#import "TTKeyboardAvoidingScrollView.h"

@interface TTViewController ()
@property (nonatomic,strong) TTKeyboardAvoidingScrollView * scrollView;
@property (nonatomic,strong) UILabel * lblDescription;
@property (nonatomic,strong) UITextField * txtfDescription;
@end

@implementation TTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView = [[TTKeyboardAvoidingScrollView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.scrollView];
    
    self.lblDescription = [[UILabel alloc] initWithFrame:CGRectZero];
    self.lblDescription.text = @"When you tap into the scrollview observe how the scrollview adjusts to make the textfield visible along with the keyboard.";
    self.lblDescription.numberOfLines = 5;
    [self.scrollView addSubview:self.lblDescription];
    self.txtfDescription = [[UITextField alloc] initWithFrame:CGRectZero];
    self.txtfDescription.placeholder = @"Text Field";
    self.txtfDescription.borderStyle = UITextBorderStyleRoundedRect;
    self.txtfDescription.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.txtfDescription];
}
- (void) viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    CGRect mybounds = self.view.bounds;
    self.scrollView.frame = mybounds;
    CGRect remainder = CGRectInset(mybounds, 8, 8);
    remainder.size.height = 9999;
    CGFloat topHeight = [self.topLayoutGuide length];
    CGRect line;
    CGRectDivide(remainder, &line, &remainder, topHeight, CGRectMinYEdge);
    remainder = CGRectInset(self.view.bounds, 8.0f, 8.0f);
    CGRectDivide(remainder, &line, &remainder, 64.0f, CGRectMinYEdge);
    CGRectDivide(remainder, &line, &remainder, 84.0f, CGRectMinYEdge);
    self.lblDescription.frame = line;
    CGRectDivide(remainder, &line, &remainder, 270, CGRectMinYEdge);
    CGRectDivide(remainder, &line, &remainder, 44.0f, CGRectMinYEdge);
    self.txtfDescription.frame = line;
    CGFloat endY = CGRectGetMaxY(line);
    self.scrollView.contentSize = CGSizeMake(remainder.size.width, endY);
}

@end
