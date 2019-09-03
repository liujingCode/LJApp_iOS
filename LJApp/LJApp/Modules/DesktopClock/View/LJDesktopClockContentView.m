//
//  LJDesktopClockContentView.m
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJDesktopClockContentView.h"
#import "LJDesktopClockContentEditView.h"

@interface LJDesktopClockContentView ()
/** 时间 */
@property (nonatomic, weak) UILabel *timeLabel;
/** 日期 */
@property (nonatomic, weak) UILabel *dateLabel;
/** 星期 */
@property (nonatomic, weak) UILabel *weekLabel;
/** 名言警句 */
@property (nonatomic, weak) UILabel *tipLabel;
/** 名言警句 */
@property (nonatomic, copy) NSArray <NSString *>*tipList;

/** 编辑页面 */
@property (nonatomic, weak) LJDesktopClockContentEditView *editView;
@end

@implementation LJDesktopClockContentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        // 开始刷新
        [self displayLink];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapContentView:)];
        [self addGestureRecognizer:tapGesture];
        
        
        self.editView.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

#pragma mark - layoutSubviews
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.editView.lj_y = self.editView.showing?(self.lj_height - self.editView.lj_height):self.lj_height;
    self.editView.lj_width = self.lj_width;
    
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    if ((orientation == UIDeviceOrientationPortrait) || (orientation == UIDeviceOrientationPortraitUpsideDown)) {// 竖屏
        [self setupSubviewLayoutsWithPortrait];
    } else if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) { // 横屏
        [self setupSubviewLayoutsWithLandscape];
    } else { // 默认
        [self setupSubviewLayoutsWithLandscape];
    }
}

#pragma mark - 横竖屏适配
// 竖屏布局
- (void)setupSubviewLayoutsWithPortrait {
    [self.dateLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).offset(-self.lj_width * 0.1);
        make.centerY.equalTo(self).offset(-self.lj_height * 0.2);
    }];
    
    [self.timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.dateLabel.mas_bottom).offset(20);
    }];
    
    [self.weekLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.dateLabel);
        make.left.equalTo(self.dateLabel.mas_right).offset(10.0);
    }];
    
    [self.tipLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.bottom.equalTo(self).offset(-44);
    }];
}
// 横屏布局
- (void)setupSubviewLayoutsWithLandscape {
    [self.timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-LJKit_kHeight_screen * 0.06);
    }];
    
    [self.dateLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(-44.0);
    }];
    
    [self.weekLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.dateLabel);
        make.left.equalTo(self.dateLabel.mas_right).offset(10.0);
    }];
    
    [self.tipLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.bottom.equalTo(self.timeLabel.mas_top).offset(-10);
    }];
}

#pragma mark - 手势
// 长按
- (void)longLabel:(UILongPressGestureRecognizer *)gesture {
    UIView *targetView = gesture.view;
    if (![targetView isKindOfClass:[UILabel class]]) {
        return;
    }
    if (gesture.state != UIGestureRecognizerStateBegan) {
        return;
    }
    UILabel *label = (UILabel *)targetView;
    if (label == self.tipLabel) { // 可以编辑
        
    }
    [self showEditViewWithView:targetView];
    
}

// 平移手势
- (void)panLabel:(UIPanGestureRecognizer *)gesture {
    UIView *targetView = gesture.view;
    CGPoint point = [gesture translationInView:self];
    targetView.transform = CGAffineTransformTranslate(targetView.transform, point.x, point.y);
    [gesture setTranslation:CGPointZero inView:targetView];
}

// 点击手势
- (void)tapContentView:(UITapGestureRecognizer *)gerture {
    if (self.viewAction) {
        self.viewAction(LJDesktopClockContentViewActionTap);
    }
}

#pragma mark - 编辑页面
// 展示编辑页面
- (void)showEditViewWithView:(UIView *)view {
    if (self.editView.showing) {
        return;
    }
    self.editView.showing = YES;
    [self bringSubviewToFront:self.editView];
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        weakSelf.editView.hidden = NO;
        weakSelf.editView.lj_y = weakSelf.lj_height - weakSelf.editView.lj_height;
    }];
    
}
// 取消编辑页面
- (void)dismissEditView{
    self.editView.showing = NO;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        weakSelf.editView.lj_y = weakSelf.lj_height;
        weakSelf.editView.hidden = YES;
    }];
}



#pragma mark - 刷新时间
- (void)updateDate {
    NSDate *nowDate = [NSDate date];
    self.timeLabel.text = [NSDate lj_stringWithDate:nowDate andFormatStr:@"HH:mm:ss"];
    self.dateLabel.text = [NSDate lj_stringWithDate:nowDate andFormatStr:@"yyyy-MM-dd"];
    self.weekLabel.text = [NSDate lj_weekdayStrWithDate:nowDate];
}

#pragma mark - 懒加载UI
- (UILabel *)timeLabel {
    if (!_timeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
//        label.font = [UIFont boldSystemFontOfSize:100.0];
        // 防止字符宽度不等导致的跳动
//        label.font = [UIFont monospacedDigitSystemFontOfSize:100.0 weight:10.0];
        label.font = [UIFont fontWithName:@"Helvetica" size:100.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSDate lj_stringWithDate:[NSDate date] andFormatStr:@"HH:mm:ss"];
        
        
        label.userInteractionEnabled = YES;
        // 双击手势
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longLabel:)];
        longGesture.minimumPressDuration = 1.0;
        [label addGestureRecognizer:longGesture];
        // 拖拽手势
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panLabel:)];
        [label addGestureRecognizer:panGesture];
        
        [self addSubview:label];
        _timeLabel = label;
    }
    return _timeLabel;
}

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:40.0];
        label.text = [NSDate lj_stringWithDate:[NSDate date] andFormatStr:@"yyyy-MM-dd"];
        label.userInteractionEnabled = YES;
        // 双击手势
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longLabel:)];
        longGesture.minimumPressDuration = 1.0;
        [label addGestureRecognizer:longGesture];
        // 拖拽手势
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panLabel:)];
        [label addGestureRecognizer:panGesture];
        [self addSubview:label];
        _dateLabel = label;
    }
    return _dateLabel;
}

- (UILabel *)weekLabel {
    if (!_weekLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:20.0];
        label.text = [NSDate lj_weekdayStrWithDate:[NSDate date]];
        label.userInteractionEnabled = YES;
        // 双击手势
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longLabel:)];
        longGesture.minimumPressDuration = 1.0;
        [label addGestureRecognizer:longGesture];
        // 拖拽手势
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panLabel:)];
        [label addGestureRecognizer:panGesture];
        [self addSubview:label];
        _weekLabel = label;
    }
    return _weekLabel;
}

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:18.0];
        int randomTipIndex = arc4random_uniform((int)self.tipList.count);
        label.text = self.tipList[randomTipIndex];
        label.userInteractionEnabled = YES;
        // 双击手势
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longLabel:)];
        longGesture.minimumPressDuration = 1.0;
        [label addGestureRecognizer:longGesture];
        // 拖拽手势
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panLabel:)];
        [label addGestureRecognizer:panGesture];
        [self addSubview:label];
        _tipLabel = label;
    }
    return _tipLabel;
}

- (CADisplayLink *)displayLink {
    if (!_displayLink) {
        CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDate)];
        [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        _displayLink = displayLink;
    }
    return _displayLink;
}

- (NSArray<NSString *> *)tipList {
    if (!_tipList) {
        NSString *tip01 = @"只有淡忘,曾经话说要如何";
        NSString *tip02 = @"血染江山的画,怎敌你眉间一点朱砂";
        NSString *tip03 = @"画一个菇凉陪着我,再画个花边的被窝";
        NSString *tip04 = @"相遇然后分别就在一天";
        NSString *tip05 = @"谁能凭爱意要富士山私有";
        NSString *tip06 = @"是敌与是友各自也没有自由,位置变了各有队友";
        NSString *tip07 = @"啦啦啦啦啦啦啦啦~";
        _tipList = @[tip01,tip02,tip03,tip04,tip05,tip06,tip07];
    }
    return _tipList;
}

- (LJDesktopClockContentEditView *)editView {
    if (!_editView) {
        LJDesktopClockContentEditView *editView = [LJDesktopClockContentEditView new];
        editView.lj_height = 200.0;
        editView.hidden = YES;
        [self addSubview:editView];
        _editView = editView;
    }
    return _editView;
}

@end
