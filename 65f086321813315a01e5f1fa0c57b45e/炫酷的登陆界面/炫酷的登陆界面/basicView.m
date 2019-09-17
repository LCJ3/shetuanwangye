//
//  basicView.m
//  炫酷的登陆界面
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "basicView.h"
#import "Masonry/Masonry.h"
#define kColor [UIColor colorWithRed:29/255.0 green:51/255.0 blue:142/255.0 alpha:1]
#define kColor1 [UIColor colorWithRed:141/255.0 green:234/255.0 blue:255/255.0 alpha:1]

#define kWidth [[UIScreen mainScreen]bounds].size.width
#define kHeight [[UIScreen mainScreen]bounds].size.height
#define kAngle(r) (r) * M_PI / 180

typedef enum {
    viewNameStypeLogin,
    viewNameStypeRegister,
}viewNameStype;

typedef enum {
    loginStypeLogin,
    loginStypeEmail,
}loginStype;

@interface basicView()

@property (weak, nonatomic) UIView *backgroundView;
@property (weak, nonatomic) UIView *logo;
@property (weak, nonatomic) UIImageView *iconView;
@property (weak, nonatomic) UILabel *titleLabel;
@property (nonatomic,assign) viewNameStype stype;
@property (nonatomic,assign) loginStype stype1;

@property (weak, nonatomic) UIButton *loginBtn;
@property (weak, nonatomic) UITextField *userTextFiled;
@property (weak, nonatomic) UITextField *passTextFiled;
@property (weak, nonatomic) UIView *userTextFiled_Line;
@property (weak, nonatomic) UIView *passTextFiled_Line;
@property (weak, nonatomic) UIButton *regisBtn;
@property (weak, nonatomic) CAShapeLayer *circleShapeLayer;
@end
@implementation basicView
-(instancetype)init{
    if(self = [super init]){
        _stype = viewNameStypeLogin;
        _stype1= loginStypeLogin;
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)show{
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    //
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0.7f;
    bgView.frame = keyWindow.frame;
    [keyWindow addSubview:bgView];
    
    [keyWindow addSubview:self];
    self.frame = keyWindow.frame;
    
    //
    UIView *backgroundView = [UIView new];
    _backgroundView = backgroundView;
    backgroundView.layer.cornerRadius = 10.f;
    backgroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:backgroundView];
    backgroundView.frame = CGRectMake(20, 120, kWidth - 40, kHeight - 120 - 40);
    
    UIView *logo = [UIView new];
    _logo = logo;
    logo.backgroundColor = [UIColor whiteColor];
    logo.layer.cornerRadius = 50.f;
    [self addSubview:logo];
    logo.center = CGPointMake(self.center.x, 120-25+50);
    logo.bounds = CGRectMake(0, 0, 100, 100);
    
    UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
    _iconView = iconView;
    iconView.contentMode = UIViewContentModeScaleAspectFit;
    [logo addSubview:iconView];
    iconView.frame = logo.bounds;

    UILabel *titleLabel = [[UILabel alloc]init];
    _titleLabel = titleLabel;
    [backgroundView addSubview:titleLabel];
    titleLabel.text = @"Enter Now!";
    titleLabel.font = [UIFont systemFontOfSize:23.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = kColor;
    titleLabel.frame = CGRectMake(0,100, backgroundView.bounds.size.width, 30);
    
    
    UITextField *userName = [[UITextField alloc]init];
    _userTextFiled = userName;
    userName.placeholder = @"Account Name";
    [backgroundView addSubview:userName];
    userName.frame = CGRectMake(45, titleLabel.frame.origin.y+titleLabel.frame.size.height+50, backgroundView.bounds.size.width - 90, 30);
    
    UIView *userName_Line = [UIView new];
    _userTextFiled_Line = userName_Line;
    userName_Line.backgroundColor = kColor;
    [backgroundView addSubview:userName_Line];
    userName_Line.frame = (CGRect){CGPointMake(userName.frame.origin.x, userName.frame.origin.y+userName.frame.size.height+5),CGSizeMake(userName.bounds.size.width, 1)};

    UITextField *password = [[UITextField alloc]init];
    _passTextFiled = password;
    password.placeholder = @"Password";
    [backgroundView addSubview:password];
    password.frame = CGRectMake(userName_Line.frame.origin.x, userName_Line.frame.origin.y+userName_Line.frame.size.height+30, userName_Line.frame.size.width, 30);
    
    UIView *password_Line = [UIView new];
    _passTextFiled_Line = password_Line;
    password_Line.backgroundColor = kColor;
    [backgroundView addSubview:password_Line];
    password_Line.frame = CGRectMake(userName_Line.frame.origin.x, password.frame.origin.y+password.frame.size.height+5, userName_Line.frame.size.width, 1);
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginBtn = loginBtn;
    loginBtn.layer.cornerRadius = 20.f;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.bounds = CGRectMake(0, 0, backgroundView.frame.size.width - 60, 40);
    loginBtn.center = CGPointMake(backgroundView.frame.size.width * 0.5, password_Line.frame.origin.y+password_Line.frame.size.height+70);
     [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
     loginBtn.titleLabel.font = [UIFont systemFontOfSize:23.f];
     [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     [loginBtn setBackgroundImage:[self createImageFromColor:kColor imgSize:CGSizeMake(loginBtn.bounds.size.width, loginBtn.bounds.size.height)] forState:UIControlStateNormal];
     [backgroundView addSubview:loginBtn];
     [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    _regisBtn = button;
    [button setTitle:@"Sign Up" forState:UIControlStateNormal];
    [button setTitleColor:kColor forState:UIControlStateNormal];
    [backgroundView addSubview:button];
    button.frame = CGRectMake(backgroundView.frame.size.width-100, loginBtn.frame.size.height+loginBtn.frame.origin.y+20, 80, 40);
    [button addTarget:self action:@selector(signUp:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)signUp:(UIButton *)btn{
    
    if(_stype == viewNameStypeLogin){
        

        [UIView animateWithDuration:0.45 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            btn.frame = CGRectMake(20, _loginBtn.frame.size.height+_loginBtn.frame.origin.y+20, 80, 40);

            _backgroundView.layer.transform = CATransform3DMakeRotation(kAngle(-180), 0, 1, 0);
            _logo.layer.transform = CATransform3DMakeRotation(kAngle(-180), 0, 1, 0);
            [_backgroundView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.layer.transform = _backgroundView.layer.transform;
            }];
            [_logo.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.layer.transform = _logo.layer.transform;
            }];
            
            _iconView.image = [UIImage imageNamed:@"2"];
            _titleLabel.text = @"Create Account";
            [btn setTitle:@"Login" forState:UIControlStateNormal];
            [_loginBtn setTitle:@"Next Step" forState:UIControlStateNormal];
            
        } completion:^(BOOL finished) {
            _stype = viewNameStypeRegister;
            _stype1 = loginStypeEmail;
        }];
    }else if(_stype == viewNameStypeRegister){

        [UIView animateWithDuration:0.45 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            btn.frame = CGRectMake(_backgroundView.frame.size.width-100, _loginBtn.frame.size.height+_loginBtn.frame.origin.y+20, 80, 40);
            _backgroundView.layer.transform = CATransform3DMakeRotation(kAngle(0), 0, 1, 0);
            _logo.layer.transform = CATransform3DMakeRotation(kAngle(0), 0, 1, 0);
            [_backgroundView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.layer.transform = _backgroundView.layer.transform;
            }];
            [_logo.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.layer.transform = _logo.layer.transform;
            }];
            
            _iconView.image = [UIImage imageNamed:@"1"];
            _titleLabel.text = @"Enter Now!";
            [btn setTitle:@"Sign Up" forState:UIControlStateNormal];
            [_loginBtn setTitle:@"Login" forState:UIControlStateNormal];
        } completion:^(BOOL finished) {
            _stype = viewNameStypeLogin;
            _stype1 = loginStypeLogin;
        }];

    }
    
    
   }


-(void)login:(UIButton *)btn{

    if(_stype1 == loginStypeLogin){
        
    }else{
        [UIView animateWithDuration:1.f animations:^{
            [btn setTitle:@"" forState:UIControlStateNormal];
            CGPoint center = btn.center;
            btn.frame = CGRectMake(0, 0, 40, 40);
            btn.center = center;
            
        }completion:^(BOOL finished) {
            //
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:(CGRect){CGPointMake(btn.frame.origin.x, btn.frame.origin.y),CGSizeMake(btn.frame.size.width, btn.frame.size.width)} cornerRadius:btn.frame.size.width * 0.5];
            CAShapeLayer *shapeLayerCircle = [CAShapeLayer layer];
            _circleShapeLayer = shapeLayerCircle;
            shapeLayerCircle.frame = CGRectZero;
            shapeLayerCircle.lineWidth = 3.f;
            shapeLayerCircle.strokeColor = kColor1.CGColor;
            shapeLayerCircle.fillColor = [UIColor clearColor].CGColor;
            shapeLayerCircle.path = path.CGPath;
            [_backgroundView.layer addSublayer:shapeLayerCircle];
            CABasicAnimation *bas=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            bas.duration=1;
            bas.delegate=self;
            bas.fromValue=[NSNumber numberWithInteger:0];
            bas.toValue=[NSNumber numberWithInteger:1];
            [shapeLayerCircle addAnimation:bas forKey:@"key"];
            [self performSelector:@selector(centerAddress) withObject:nil afterDelay:1];
        }];
    }
    
}

-(void)centerAddress{
    _loginBtn.hidden = YES;
    
    CGFloat radius =hypotf(_backgroundView.bounds.size.width, _backgroundView.bounds.size.height);
    UIBezierPath *startCycle =  [UIBezierPath bezierPathWithOvalInRect:_loginBtn.frame];
    UIBezierPath *endCycle = [UIBezierPath bezierPathWithArcCenter:_loginBtn.center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = endCycle.CGPath;
    _backgroundView.layer.mask = maskLayer;
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.delegate = self;
    //动画是加到layer上的，所以必须为CGPath，再将CGPath桥接为OC对象
    maskLayerAnimation.fromValue = (__bridge id)(startCycle.CGPath);
    maskLayerAnimation.toValue = (__bridge id)((endCycle.CGPath));
    maskLayerAnimation.duration = 1;
    maskLayerAnimation.delegate = self;
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
    
    [self change];

}

-(void)change{
    _loginBtn.hidden = NO;
    _loginBtn.bounds = CGRectMake(0, 0, _backgroundView.frame.size.width - 60, 40);
    _loginBtn.center = CGPointMake(_backgroundView.frame.size.width * 0.5, _passTextFiled_Line.frame.origin.y+_passTextFiled_Line.frame.size.height+100);
    [_loginBtn setBackgroundImage:[self createImageFromColor:[UIColor whiteColor] imgSize:CGSizeMake(_loginBtn.bounds.size.width, _loginBtn.bounds.size.height)] forState:UIControlStateNormal];
    [_loginBtn setTitle:@"Enter Now!" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    _backgroundView.backgroundColor = [UIColor orangeColor];
    _logo.backgroundColor = [UIColor orangeColor];
    _userTextFiled_Line.backgroundColor = [UIColor whiteColor];
    _passTextFiled_Line.backgroundColor = [UIColor whiteColor];
    _regisBtn.hidden = YES;
    _titleLabel.text = @"Add information";
    _titleLabel.textColor = [UIColor whiteColor];
    [_circleShapeLayer removeFromSuperlayer];
    _stype1=loginStypeLogin;
}
#pragma mark - private method
-(UIImage *)createImageFromColor:(UIColor *)color imgSize:(CGSize)size
{
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, frame);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
