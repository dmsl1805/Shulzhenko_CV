//
//  DMScrollableViewController.m
//  Shulzhenko_CV
//
//  Created by Dmitriy Shulzhenko on 4/25/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "DMScrollableViewController.h"
#import <CoreGraphics/CoreGraphics.h>
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface DMScrollableViewController() <UIScrollViewDelegate>

@property (nonatomic, strong) NSArray<UIView *> *labels;
@property (nonatomic, strong) NSArray<UIView *> *images;
@property (nonatomic, strong) NSArray<UIView *> *contents;
@property (nonatomic, strong) NSMutableArray<UIView *> *imageBackgrounds;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *contentOffsets;

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIView *scrollProgressView;
@property (nonatomic, strong) CAShapeLayer *circleLayerRight;
@property (nonatomic, strong) CAShapeLayer *circleLayer;

@property (nonatomic) NSInteger offset;
@property (nonatomic) NSInteger leftOffset;
@property (nonatomic) NSInteger contentOffset;
@property (nonatomic) NSInteger borderRadius;
@property (nonatomic) NSInteger maxHeight;
@property (nonatomic) NSInteger minHeight;
@property (nonatomic) CGFloat backgroundViewScrollingSpeed;
@property (nonatomic) CGFloat progress;
@end

@implementation DMScrollableViewController

- (instancetype)initWithLabels:(NSArray<UIView *> *)labels
                        images:(NSArray<UIView *> *)images
                      contents:(NSArray<UIView *> *)contents
             andBackgroundView:(UIView *)backGroundView {
    self = [super init];
    if (self) {
        self.labels = labels;
        self.images = images;
        self.contents = contents;
        self.backgroundView = backGroundView;
        self.offset = 20;
        self.leftOffset = 10;
        self.contentOffset = 0;
        self.borderRadius = 3;
        self.contentOffsets = [[NSMutableArray alloc]init];
        self.imageBackgrounds = [[NSMutableArray alloc]init];
        self.numberOfPages = labels.count;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.backgroundView];

    for(int i = 0; i < self.labels.count; i++) {
        
        UIView *label = [self.labels objectAtIndex:i];
        UIView *image = [self.images objectAtIndex:i];
        UIView *content = [self.contents objectAtIndex:i];
        
        self.maxHeight = label.frame.size.height > image.frame.size.height ? label.frame.size.height : image.frame.size.height;
        self.minHeight = label.frame.size.height < image.frame.size.height ? label.frame.size.height : image.frame.size.height;
        
        UIView *imageBG = [[UIView alloc]initWithFrame:CGRectMake(self.leftOffset,
                                                                 self.contentOffset + self.offset,
                                                                 image.frame.size.width,
                                                                 image.frame.size.height)];
        imageBG.layer.cornerRadius = imageBG.frame.size.height / 2;
        imageBG.backgroundColor = [UIColor grayColor];
        //imageBG.alpha = 0.7;
        [self.imageBackgrounds addObject:imageBG];
        
        image.frame = CGRectMake(self.leftOffset + self.borderRadius,
                                 self.contentOffset + self.offset + self.borderRadius,
                                 image.frame.size.width - self.borderRadius * 2,
                                 image.frame.size.height - self.borderRadius * 2);
        image.layer.cornerRadius = image.frame.size.height / 2;
        
        label.frame = CGRectMake(image.frame.size.width + self.leftOffset * 2,
                                 self.maxHeight / 2 + self.minHeight / 2 + self.contentOffset,
                                 label.frame.size.width,
                                 label.frame.size.height);
        content.frame = CGRectMake((self.view.frame.size.width - content.frame.size.width) / 2,
                                   self.contentOffset + self.maxHeight + self.offset * 2,
                                   content.frame.size.width,
                                   content.frame.size.height);
        
        self.contentOffset += content.frame.size.height + self.maxHeight + self.offset * 2;
        self.scrollableView.contentSize = CGSizeMake(self.view.frame.size.width,
                                                     self.contentOffset);
        [self.contentOffsets addObject:@(self.contentOffset)];
        [self.scrollableView addSubview:imageBG];
        [self.scrollableView addSubview:image];
        [self.scrollableView addSubview:label];
        [self.scrollableView addSubview:content];
    }

    self.scrollProgressView = [[UIView alloc]initWithFrame:CGRectMake(self.leftOffset + self.imageBackgrounds[0].frame.size.width / 2 - self.borderRadius / 2,
                                                                     self.offset,
                                                                     self.borderRadius,
                                                                     25)];
    self.scrollProgressView.backgroundColor = [UIColor cyanColor];
    self.scrollProgressView.layer.cornerRadius = 2;
    
    [self.view addSubview:self.scrollProgressView];
    [self.view addSubview:self.scrollableView];

    [self performScalingModeToBackgroundView];
    [self drawCircleOnRect];

}

- (void)goToLabel:(NSInteger)index animate:(BOOL)animate {
    if(animate){
        __weak __typeof(self) weakSelf = self;
        [UIView animateWithDuration:2
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             
            [weakSelf changeOffset:index];
        }
                         completion:nil];
    } else {
        [self changeOffset:index];
    }
}

- (void)changeOffset:(NSInteger)index{
    self.scrollableView.contentOffset = CGPointMake(0, self.contentOffsets[index].floatValue);
}

-(void)drawCircleOnRect{
    CGFloat point = self.scrollableView.contentOffset.y + self.progress + self.offset + self.scrollProgressView.frame.size.height + self.borderRadius;

    for (int i = 0; i < self.images.count; i++){
        CGFloat endPoint = self.images[i].frame.origin.y + self.imageBackgrounds[i].frame.size.height + self.scrollProgressView.frame.size.height;
        
        if(point > self.images[i].frame.origin.y && point < endPoint){
            
            if(!self.circleLayer || !self.circleLayerRight){
                self.circleLayer = [CAShapeLayer layer];
                self.circleLayer.strokeColor = [UIColor cyanColor].CGColor;
                self.circleLayer.fillColor = [UIColor clearColor].CGColor;
                self.circleLayer.lineCap = @"round";
                self.circleLayer.lineWidth = self.borderRadius + 1;
            }
            if(!self.circleLayerRight){
                self.circleLayerRight = [CAShapeLayer layer];
                self.circleLayerRight.strokeColor = [UIColor cyanColor].CGColor;
                self.circleLayerRight.fillColor = [UIColor clearColor].CGColor;
                self.circleLayerRight.lineCap  = @"round";
                self.circleLayerRight.lineWidth = self.borderRadius + 1;
            }
            if (! self.circleLayer.superlayer){
                [self.images[i].layer addSublayer:self.circleLayer];
            }
            if (! self.circleLayerRight.superlayer){
                [self.images[i].layer addSublayer:self.circleLayerRight];
            }
            CGRect rect = self.imageBackgrounds[i].frame;
            CGFloat viewProgress = point - self.images[i].frame.origin.y;
            CGFloat topPointForLeft = 1 - (viewProgress / 75 * 270);
            CGFloat bottomPointForLeft = 1 - (viewProgress / 75 * 270 + 90);
            CGFloat topPointForRight =  viewProgress / 75 * 270 - 180;
            CGFloat bottomPointForRight = viewProgress / 75 * 270 - 90;
            
            if(topPointForLeft > -90 || topPointForRight < -90){
                topPointForLeft = -90;
                topPointForRight = -90;
            }else if(topPointForLeft < -270 || topPointForRight > 90){
                topPointForLeft = -270;
                topPointForRight = 90;
            }
            
            if(bottomPointForLeft < -270 || bottomPointForRight > 90){
                bottomPointForRight = 90;
                bottomPointForLeft = -270;
            } else if (bottomPointForLeft > -90 || bottomPointForRight < -90){
                bottomPointForRight = -90;
                bottomPointForLeft = -90;
            }

            self.circleLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width  / 2 - self.borderRadius,
                                                                                      rect.size.height / 2 - self.borderRadius)
                                                                   radius:rect.size.width / 2 - self.borderRadius + 1                                                              startAngle:DEGREES_TO_RADIANS(topPointForLeft)
                                                                 endAngle:DEGREES_TO_RADIANS(bottomPointForLeft)
                                                                clockwise:NO].CGPath;
            
            self.circleLayerRight.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width  / 2 - self.borderRadius,
                                                                                      rect.size.height / 2 - self.borderRadius)
                                                                   radius:rect.size.width / 2 - self.borderRadius + 1                                                              startAngle:DEGREES_TO_RADIANS(topPointForRight)
                                                                 endAngle:DEGREES_TO_RADIANS(bottomPointForRight)
                                                                clockwise:YES].CGPath;

            return;
        }
        else {
            [self.circleLayer removeFromSuperlayer];
            [self.circleLayerRight removeFromSuperlayer];
            continue;
        }
    }
}

- (UIScrollView *)scrollableView{
    if (! _scrollableView) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        _scrollableView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
        _scrollableView.delegate = self;
    }
    
    return _scrollableView;
}


- (void)performScalingModeToBackgroundView {
    self.backgroundView.frame = CGRectMake(0, 0,
                            self.scrollableView.contentSize.width,
                                           self.scrollableView.contentSize.height * self.backgroundViewScrollingSpeed +
                                           self.view.frame.size.height * ( 1 - self.backgroundViewScrollingSpeed));
}

- (CGFloat)backgroundViewScrollingSpeed {
    if( !_backgroundViewScrollingSpeed || _backgroundViewScrollingSpeed <= 0) {
        _backgroundViewScrollingSpeed = 0.1;
    }
    return _backgroundViewScrollingSpeed;
}

- (void)changeBackgroundViewFrame{
    self.backgroundView.frame = CGRectMake(self.scrollableView.contentOffset.x,
                                           0 - self.scrollableView.contentOffset.y * self.backgroundViewScrollingSpeed,
                                           self.backgroundView.frame.size.width,
                                           self.backgroundView.frame.size.height);
}

- (void)changeScrollProgressFrame{
    self.progress = (self.scrollableView.contentOffset.y) / ([self.contentOffsets lastObject].doubleValue - self.view.frame.size.height) * (self.view.frame.size.height - self.offset*2 - 10);
    self.scrollProgressView.frame = CGRectMake(self.scrollProgressView.frame.origin.x,
                                           self.progress + self.offset,
                                           self.scrollProgressView.frame.size.width,
                                           self.scrollProgressView.frame.size.height);
}
- (void)fadeInFadeOut {
    
    CGFloat contentOffsetSum = 0;
    CGFloat scrollOffset = self.scrollableView.contentOffset.y;
    
    for(int i = 0; i < self.contentOffsets.count - 1; i++) {
        contentOffsetSum += self.contentOffsets[i].floatValue;
        CGFloat currentOffset = self.contentOffsets[i].floatValue - self.view.frame.size.height;
        CGFloat nextOffset = self.contentOffsets[i + 1].floatValue - self.view.frame.size.height;
        if(scrollOffset > currentOffset && scrollOffset < nextOffset) {
            CGFloat alfaForNext = (scrollOffset - currentOffset) / (self.contentOffsets[i].floatValue - currentOffset);
            CGFloat alfaForCurrent = 1 - (scrollOffset - currentOffset) / (self.contentOffsets[i].floatValue - currentOffset);

            self.contents[i].alpha = alfaForCurrent;
            self.contents[i + 1].alpha = alfaForNext;

            return;
        } else {
            continue;
        }
    }
}

- (void)hideScrollIndicator:(BOOL)hidden{
    self.scrollProgressView.hidden = hidden;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self changeBackgroundViewFrame];
    [self fadeInFadeOut];
    [self changeScrollProgressFrame];
    [self drawCircleOnRect];
    [self hideScrollIndicator:NO];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self changeBackgroundViewFrame];
    [self fadeInFadeOut];
    [self changeScrollProgressFrame];
    [self drawCircleOnRect];
    [self hideScrollIndicator:NO];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    [self changeBackgroundViewFrame];
    [self fadeInFadeOut];
    [self changeScrollProgressFrame];
    [self drawCircleOnRect];
    [self hideScrollIndicator:NO];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self changeBackgroundViewFrame];
    [self fadeInFadeOut];
    [self changeScrollProgressFrame];
    [self drawCircleOnRect];
    [self hideScrollIndicator:!decelerate];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [self changeBackgroundViewFrame];
    [self fadeInFadeOut];
    [self changeScrollProgressFrame];
    [self drawCircleOnRect];
    [self hideScrollIndicator:NO];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self changeBackgroundViewFrame];
    [self fadeInFadeOut];
    [self changeScrollProgressFrame];
    [self drawCircleOnRect];
    [self hideScrollIndicator:YES];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self changeBackgroundViewFrame];
    [self fadeInFadeOut];
    [self changeScrollProgressFrame];
    [self drawCircleOnRect];
    [self hideScrollIndicator:YES];
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    [self changeBackgroundViewFrame];
    [self fadeInFadeOut];
    [self changeScrollProgressFrame];
    [self drawCircleOnRect];
    [self hideScrollIndicator:NO];
}

                               
@end
