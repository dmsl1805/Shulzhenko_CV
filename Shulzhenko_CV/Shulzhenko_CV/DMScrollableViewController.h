//
//  DMScrollableViewController.h
//  Shulzhenko_CV
//
//  Created by Dmitriy Shulzhenko on 4/25/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMScrollableViewController : UIViewController

- (instancetype)initWithLabels:(NSArray<UIView *> *)labels
                        images:(NSArray<UIView *> *)images
                      contents:(NSArray<UIView *> *)contents
             andBackgroundView:(UIView *)backGroundView;

- (void)goToLabel:(NSInteger)index animate:(BOOL)animate;

@property (nonatomic, strong) UIScrollView *scrollableView;
@property (nonatomic) NSInteger numberOfPages;

@end
