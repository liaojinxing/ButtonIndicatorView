//
//  ButtonIndicatorView.h
//  Hearts9
//
//  Created by liaojinxing on 14-5-8.
//  Copyright (c) 2014年 Douban Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LikeActionBlock)();

@interface ButtonIndicatorView : UIView

@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, copy) LikeActionBlock likeBlock;
@property (nonatomic, copy) LikeActionBlock unLikeBlock;

- (id)initWithFrame:(CGRect)frame
          likeBlock:(LikeActionBlock)likeBlock
        unLikeBlock:(LikeActionBlock)unLikeBlock;

- (void)updateButtonLiked:(BOOL)isLiked;

- (void)startLikeAnimating;
- (void)stopLikeAnimating;


@end
