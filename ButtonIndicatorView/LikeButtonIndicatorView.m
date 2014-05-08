//
//  UIButton+Like.m
//  Hearts9
//
//  Created by liaojinxing on 14-5-8.
//  Copyright (c) 2014年 Douban Inc. All rights reserved.
//

#import "LikeButtonIndicatorView.h"

@implementation LikeButtonIndicatorView

- (id)initWithFrame:(CGRect)frame
          likeBlock:(LikeActionBlock)likeBlock
        unLikeBlock:(LikeActionBlock)unLikeBlock
{
  self = [super initWithFrame:frame likeBlock:likeBlock unLikeBlock:unLikeBlock];
  if (self ) {
    // Configure like button
    self.likeButton.layer.borderWidth = 1.f;
    self.likeButton.layer.cornerRadius = 3.f;
    self.likeButton.layer.masksToBounds = YES;
    [self updateButtonLiked:NO];
  }
  return self;
}


#pragma mark - button style

- (void)updateButtonStyleLiked:(BOOL)isLiked
{
  if (isLiked) {
    [self.likeButton setTitle:@"Liked" forState:UIControlStateNormal];
    [self.likeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.likeButton.layer.borderColor = [UIColor grayColor].CGColor;
  } else {
    [self.likeButton setTitle:@"Like" forState:UIControlStateNormal];
    [self.likeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.likeButton.layer.borderColor = [UIColor redColor].CGColor;
  }
}

@end
