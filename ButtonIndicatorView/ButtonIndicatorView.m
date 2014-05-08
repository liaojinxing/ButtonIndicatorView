//
//  ButtonIndicatorView.m
//  Hearts9
//
//  Created by liaojinxing on 14-5-8.
//  Copyright (c) 2014年 Douban Inc. All rights reserved.
//

#import "ButtonIndicatorView.h"

@interface ButtonIndicatorView ()
{
  UIActivityIndicatorView *_indicatorView;
}
@end


@implementation ButtonIndicatorView

- (id)initWithFrame:(CGRect)frame
          likeBlock:(LikeActionBlock)likeBlock
        unLikeBlock:(LikeActionBlock)unLikeBlock
{
  self = [super initWithFrame:frame];
  if (self ) {
    self.likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.likeButton.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    
    _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _indicatorView.center = _likeButton.center;
    _indicatorView.hidesWhenStopped = YES;
    
    [self addSubview:self.likeButton];
    [self addSubview:_indicatorView];
    
    self.likeBlock = likeBlock;
    self.unLikeBlock = unLikeBlock;
  }
  return self;
}


#pragma mark -

- (void)updateButtonLiked:(BOOL)isLiked
{
  [_likeButton removeTarget:self
                     action:@selector(unLike)
           forControlEvents:UIControlEventTouchUpInside];
  [_likeButton removeTarget:self
                     action:@selector(like)
           forControlEvents:UIControlEventTouchUpInside];
  
  if (isLiked) {
    [self.likeButton addTarget:self
                        action:@selector(unLike)
              forControlEvents:UIControlEventTouchUpInside];
  } else {
    [self.likeButton addTarget:self
                        action:@selector(like)
              forControlEvents:UIControlEventTouchUpInside];
  }
  
  [self updateButtonStyleLiked:isLiked];
}


// Implemented by subclass
- (void)updateButtonStyleLiked:(BOOL)isLiked
{
}

#pragma mark - actions

- (void)startLikeAnimating
{
  _indicatorView.hidden = NO;
  _likeButton.hidden = YES;
  [_indicatorView startAnimating];
}

- (void)stopLikeAnimating
{
  _indicatorView.hidden = YES;
  _likeButton.hidden = NO;
  [_indicatorView stopAnimating];
}

- (void)like
{
  if (self.likeBlock) {
    self.likeBlock();
  }
}

- (void)unLike
{
  if (self.unLikeBlock) {
    self.unLikeBlock();
  }
}


@end

