//
//  ViewController.m
//  Shulzhenko_CV
//
//  Created by Dmitriy Shulzhenko on 4/23/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "ViewController.h"
#import "DMScrollableViewController.h"

@interface ViewController ()
@property (nonatomic, strong) DMScrollableViewController *vc;
@property (nonatomic) NSInteger page;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNeedsStatusBarAppearanceUpdate];
    
    self.page = 0;
    CGRect imageFrame = CGRectMake(0, 0, 50, 50);
    CGRect labelFrame = CGRectMake(0, 0, 300, 30);
    CGRect contentFrame = CGRectMake(0, 0, self.view.frame.size.width - 80, self.view.frame.size.height - 100);
    
    //Info
    
    UIImageView *photo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"photo"]];
    photo.frame = imageFrame;
    
    UILabel *name = [[UILabel alloc]initWithFrame:labelFrame];
    name.text = @"Dmitriy Shulzhenko";
    name.font = [UIFont systemFontOfSize:28];
    
    UIView *infoContentView = [[UIView alloc]initWithFrame:contentFrame];
    
    UITextView *info = [[UITextView alloc]initWithFrame:CGRectMake(15, 0, 300, 30)];
    info.font = [UIFont systemFontOfSize:22];
    info.userInteractionEnabled = NO;
    info.text = @"Junior iOS developer";
    UITextView *city = [[UITextView alloc]initWithFrame:CGRectMake(15, 35, 300, 30)];
    city.font = [UIFont systemFontOfSize:22];
    city.userInteractionEnabled = NO;
    city.text = @"City: Kiev";
    UITextView *mail = [[UITextView alloc]initWithFrame:CGRectMake(15, 70, 450, 32)];
    mail.font = [UIFont systemFontOfSize:22];
    mail.userInteractionEnabled = NO;
    mail.text = @"E-mail: dmsl1805@gmail.com";
    UITextView *number = [[UITextView alloc]initWithFrame:CGRectMake(15, 105, 300, 30)];
    number.font = [UIFont systemFontOfSize:22];
    number.userInteractionEnabled = NO;
    number.text = @"+380969916257";
    [infoContentView addSubview:info];
    [infoContentView addSubview:city];
    [infoContentView addSubview:mail];
    [infoContentView addSubview:number];
    [self addCGRects:4 toView:infoContentView distance:35];
    
    //Education
    
    UIImageView *educationImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"student"]];
    educationImage.frame = imageFrame;
    
    UILabel *educationLabel = [[UILabel alloc]initWithFrame:labelFrame];
    educationLabel.text = @"Education";
    educationLabel.font = [UIFont systemFontOfSize:28];
    
    UIView *educationContent = [[UIView alloc]initWithFrame:contentFrame];
    UITextView *educationtext = [[UITextView alloc]initWithFrame:CGRectMake(15, 0, 300, 100)];
    educationtext.font = [UIFont systemFontOfSize:22];
    educationtext.userInteractionEnabled = NO;
    educationtext.text = @"2nd year student of National Aviation University \n(English course)";
    [educationContent addSubview:educationtext];
    [self addCGRects:1 toView:educationContent distance:35];
    //experience
    
    UIImage *prototype = [UIImage imageNamed:@"prototype"];
    UIImageView *experienceImage = [[UIImageView alloc]initWithImage:prototype];
    experienceImage.frame = imageFrame;
    
    UILabel *experiencelabel = [[UILabel alloc]initWithFrame:labelFrame];
    experiencelabel.text = @"Experience";
    
    UIView *experienceContent = [[UIView alloc]initWithFrame:contentFrame];
    UITextView *experienceIntern = [[UITextView alloc]initWithFrame:CGRectMake(15, 0, 300, 70)];
    experienceIntern.font = [UIFont systemFontOfSize:22];
    experienceIntern.userInteractionEnabled = NO;
    experienceIntern.text = @"January 2016 - March 2016 \niOS internship at Softheme";
    UITextView *experienceWork = [[UITextView alloc]initWithFrame:CGRectMake(15, 75, 300, 100)];
    experienceWork.font = [UIFont systemFontOfSize:22];
    experienceWork.userInteractionEnabled = NO;
    experienceWork.text = @"March 2016 - now \njunior iOS developer at Softheme";
    [experienceContent addSubview:experienceIntern];
    [experienceContent addSubview:experienceWork];
    [self addCGRects:2 toView:experienceContent distance:75];
    
    //skils
    
    UIImageView *skillImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"noun"]];
    skillImage.frame = imageFrame;
    
    UILabel *skillLabel = [[UILabel alloc]initWithFrame:labelFrame];
    skillLabel.text = @"Skills";
    
    UIView *skillContent = [[UIView alloc]initWithFrame:contentFrame];
    UITextView *skillObj = [[UITextView alloc]initWithFrame:CGRectMake(15, 0, 300, 30)];
    skillObj.font = [UIFont systemFontOfSize:22];
    skillObj.userInteractionEnabled = NO;
    skillObj.text = @"Objective-C 5";
    UITextView *skillSdk = [[UITextView alloc]initWithFrame:CGRectMake(15, 35, 300, 30)];
    skillSdk.font = [UIFont systemFontOfSize:22];
    skillSdk.userInteractionEnabled = NO;
    skillSdk.text = @"iOS SDK 5";
    UITextView *skillKit = [[UITextView alloc]initWithFrame:CGRectMake(15, 70, 300, 30)];
    skillKit.font = [UIFont systemFontOfSize:22];
    skillKit.userInteractionEnabled = NO;
    skillKit.text = @"UIKit 5";
    UITextView *skillCG = [[UITextView alloc]initWithFrame:CGRectMake(15, 105, 300, 30)];
    skillCG.font = [UIFont systemFontOfSize:22];
    skillCG.userInteractionEnabled = NO;
    skillCG.text = @"CoreGraphics 5";
    UITextView *skillNW = [[UITextView alloc]initWithFrame:CGRectMake(15, 140, 300, 30)];
    skillNW.font = [UIFont systemFontOfSize:22];
    skillNW.userInteractionEnabled = NO;
    skillNW.text = @"Networking 3";
    UITextView *skillMTRD = [[UITextView alloc]initWithFrame:CGRectMake(15, 175, 300, 30)];
    skillMTRD.font = [UIFont systemFontOfSize:22];
    skillMTRD.userInteractionEnabled = NO;
    skillMTRD.text = @"Multithreading 5";
    UITextView *skillData = [[UITextView alloc]initWithFrame:CGRectMake(15, 210, 300, 30)];
    skillData.font = [UIFont systemFontOfSize:22];
    skillData.userInteractionEnabled = NO;
    skillData.text = @"Core data 4";
    UITextView *skillFRC = [[UITextView alloc]initWithFrame:CGRectMake(15, 245, 300, 30)];
    skillFRC.font = [UIFont systemFontOfSize:22];
    skillFRC.userInteractionEnabled = NO;
    skillFRC.text = @"Fetch result controller 4";
    UITextView *skillXcode = [[UITextView alloc]initWithFrame:CGRectMake(15, 280, 300, 30)];
    skillXcode.font = [UIFont systemFontOfSize:22];
    skillXcode.userInteractionEnabled = NO;
    skillXcode.text = @"X code 4";
    UITextView *skillStory = [[UITextView alloc]initWithFrame:CGRectMake(15, 315, 300, 30)];
    skillStory.font = [UIFont systemFontOfSize:22];
    skillStory.userInteractionEnabled = NO;
    skillStory.text = @"Storyboards/xibs 5";
    UITextView *skillTesting = [[UITextView alloc]initWithFrame:CGRectMake(15, 350, 300, 30)];
    skillTesting.font = [UIFont systemFontOfSize:22];
    skillTesting.userInteractionEnabled = NO;
    skillTesting.text = @"Behaviour testing 3";
    UITextView *skillEts = [[UITextView alloc]initWithFrame:CGRectMake(15, 385, 300, 30)];
    skillEts.font = [UIFont systemFontOfSize:22];
    skillEts.userInteractionEnabled = NO;
    skillEts.text = @"Ets";
    [skillContent addSubview:skillObj];
    [skillContent addSubview:skillSdk];
    [skillContent addSubview:skillKit];
    [skillContent addSubview:skillCG];
    [skillContent addSubview:skillNW];
    [skillContent addSubview:skillMTRD];
    [skillContent addSubview:skillData];
    [skillContent addSubview:skillFRC];
    [skillContent addSubview:skillXcode];
    [skillContent addSubview:skillStory];
    [skillContent addSubview:skillTesting];
    [skillContent addSubview:skillEts];
    [self addCGRects:12 toView:skillContent distance:35];
    
    //tools
    
    UIImageView *toolsImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tool"]];
    toolsImage.frame = imageFrame;
    
    UILabel *toolsLabel = [[UILabel alloc]initWithFrame:labelFrame];
    toolsLabel.text = @"3rd party libs, pods used";
    
    UIView *toolsContent = [[UIView alloc]initWithFrame:contentFrame];
    UITextView *toolsAF = [[UITextView alloc]initWithFrame:CGRectMake(15, 0, 300, 30)];
    toolsAF.font = [UIFont systemFontOfSize:22];
    toolsAF.userInteractionEnabled = NO;
    toolsAF.text = @"AFNetwotking ";
    UITextView *toolsStub = [[UITextView alloc]initWithFrame:CGRectMake(15, 35, 300, 30)];
    toolsStub.font = [UIFont systemFontOfSize:22];
    toolsStub.userInteractionEnabled = NO;
    toolsStub.text = @"OHTTPStubs";
    UITextView *toolsMoc = [[UITextView alloc]initWithFrame:CGRectMake(15, 70, 300, 30)];
    toolsMoc.font = [UIFont systemFontOfSize:22];
    toolsMoc.userInteractionEnabled = NO;
    toolsMoc.text = @"OCMockito";
    UITextView *toolsSpec = [[UITextView alloc]initWithFrame:CGRectMake(15, 105, 300, 30)];
    toolsSpec.font = [UIFont systemFontOfSize:22];
    toolsSpec.userInteractionEnabled = NO;
    toolsSpec.text = @"Specta";
    UITextView *toolsExp = [[UITextView alloc]initWithFrame:CGRectMake(15, 140, 300, 30)];
    toolsExp.font = [UIFont systemFontOfSize:22];
    toolsExp.userInteractionEnabled = NO;
    toolsExp.text = @"Expecta";
    [toolsContent addSubview:toolsAF];
    [toolsContent addSubview:toolsStub];
    [toolsContent addSubview:toolsMoc];
    [toolsContent addSubview:toolsSpec];
    [toolsContent addSubview:toolsExp];
    [self addCGRects:5 toView:toolsContent distance:35];
    
    //skils
    
    UIImageView *otherImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"add"]];
    otherImage.frame = imageFrame;
    
    UILabel *otherLabel = [[UILabel alloc]initWithFrame:labelFrame];
    otherLabel.text = @"Other advantages";
    
    UIView *otherContext = [[UIView alloc]initWithFrame:contentFrame];

    UITextView *otherProject = [[UITextView alloc]initWithFrame:CGRectMake(15, 0, 300, 60)];
    otherProject.font = [UIFont systemFontOfSize:22];
    otherProject.userInteractionEnabled = NO;
    otherProject.text = @"Worked on a very big project";
    UITextView *otherCode = [[UITextView alloc]initWithFrame:CGRectMake(15, 60, 300, 60)];
    otherCode.font = [UIFont systemFontOfSize:22];
    otherCode.userInteractionEnabled = NO;
    otherCode.text = @"Understand and read code easily";
    UITextView *otherWant = [[UITextView alloc]initWithFrame:CGRectMake(15, 120, 300, 60)];
    otherWant.font = [UIFont systemFontOfSize:22];
    otherWant.userInteractionEnabled = NO;
    otherWant.text = @"Want to learn something new everyday";
    [otherContext addSubview:otherProject];
    [otherContext addSubview:otherCode];
    [otherContext addSubview:otherWant];
    [self addCGRects:3 toView:otherContext distance:60];
    
    name.textColor = educationLabel.textColor = experiencelabel.textColor = skillLabel.textColor = toolsLabel.textColor = otherLabel.textColor = [UIColor whiteColor];
    
    NSArray *labels = @[name, educationLabel, experiencelabel, skillLabel, toolsLabel, otherLabel];
    NSArray *images = @[photo, educationImage, experienceImage, skillImage, toolsImage, otherImage];
    
    info.textColor = city.textColor = number.textColor = educationtext.textColor = experienceIntern.textColor = experienceWork.textColor = skillObj.textColor = skillSdk.textColor = skillKit.textColor = skillCG.textColor = skillNW.textColor = skillMTRD.textColor = skillData.textColor = skillFRC.textColor = skillXcode.textColor = skillStory.textColor = skillTesting.textColor = skillEts.textColor = toolsAF.textColor = toolsStub.textColor = toolsMoc.textColor = toolsSpec.textColor = toolsExp.textColor = otherProject.textColor = otherCode.textColor = otherWant.textColor = mail.textColor = [UIColor whiteColor];
    
    infoContentView.backgroundColor = info.backgroundColor = educationtext.backgroundColor = experienceIntern.backgroundColor = experienceWork.backgroundColor = experienceContent.backgroundColor = city.backgroundColor = number.backgroundColor = educationContent.backgroundColor = experienceContent.backgroundColor = skillContent.backgroundColor = toolsContent.backgroundColor =  skillObj.backgroundColor = skillSdk.backgroundColor = skillKit.backgroundColor = skillCG.backgroundColor = skillNW.backgroundColor = skillMTRD.backgroundColor = skillData.backgroundColor = skillFRC.backgroundColor = skillXcode.backgroundColor = skillStory.backgroundColor = skillTesting.backgroundColor = skillEts.backgroundColor = toolsAF.backgroundColor = toolsStub.backgroundColor = toolsMoc.backgroundColor = toolsSpec.backgroundColor = toolsExp.backgroundColor = otherProject.backgroundColor = otherCode.backgroundColor = otherWant.backgroundColor = mail.backgroundColor = [UIColor clearColor];

    NSArray *contents = @[infoContentView, educationContent, experienceContent, skillContent, toolsContent, otherContext];
    

    UIImage *bgImage = [UIImage imageNamed:@"background_image"];
    UIImageView *backgroundView = [[UIImageView alloc]initWithImage:bgImage];
    
    self.vc = [[DMScrollableViewController alloc]initWithLabels:labels
                                                         images:images
                                                       contents:contents
                                              andBackgroundView:backgroundView ];

    [self addSubcontroller:self.vc toView:self.view];
    
    UIButton *next = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 60,
                                                               self.view.frame.size.height - 60,
                                                               50, 50)];
    UILabel *nextLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 100,
                                                                  self.view.frame.size.height - 60,
                                                                  150, 50)];
    nextLabel.text = @"Next";
    nextLabel.textColor = [UIColor whiteColor];
    nextLabel.backgroundColor = [UIColor clearColor];
    
    [next setImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
    [next addTarget:self action:@selector(nextSlide) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *prev = [[UIButton alloc]initWithFrame:CGRectMake(10,
                                                               self.view.frame.size.height - 60,
                                                               50, 50)];
    UILabel *prevLabel = [[UILabel alloc]initWithFrame:CGRectMake(60,
                                                                  self.view.frame.size.height - 60,
                                                                  150, 50)];
    prevLabel.text = @"Previous";
    prevLabel.textColor = [UIColor whiteColor];
    prevLabel.backgroundColor = [UIColor clearColor];
    
    [prev setImage:[UIImage imageNamed:@"prev"] forState:UIControlStateNormal];
    [prev addTarget:self action:@selector(prevSlide) forControlEvents:UIControlEventTouchUpInside];
    
//    [self.view addSubview:next];
//    [self.view addSubview:nextLabel];
//
//    [self.view addSubview:prev];
//    [self.view addSubview:prevLabel];

}

- (void)addSubcontroller:(UIViewController *)subcontroller toView:(UIView *)view
{
    [self addSubcontroller:subcontroller toView:view frame:view.bounds];
}

- (void)addSubcontroller:(UIViewController *)subcontroller toView:(UIView *)view frame:(CGRect)frame
{
    [self addChildViewController:subcontroller];
    [subcontroller didMoveToParentViewController:self];
    subcontroller.view.frame = frame;
    [view addSubview:subcontroller.view];
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)addCGRects:(NSInteger)numberOfRects toView:(UIView *)view distance:(NSInteger)distance{
    for(int i = 0; i < numberOfRects; i++){
        UIView *rect = [[UIView alloc]initWithFrame:CGRectMake(5, distance * i + 19, 8, 8)];
        rect.backgroundColor = [UIColor lightGrayColor];
        rect.layer.cornerRadius = 4;
        [view addSubview:rect];
    }
}

- (void)nextSlide{
    if(self.page < self.vc.numberOfPages - 1){
        [self.vc goToLabel:++self.page animate:YES];
        //self.page++;
    }
}

- (void)prevSlide{
    if(self.page >  0){
        [self.vc goToLabel:--self.page animate:YES];
        //self.page--;
    }
}


@end
