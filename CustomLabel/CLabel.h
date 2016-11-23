//
//  CLabel.h
//  CustomLabel
//
//  Created by Gaochao on 16/11/23.
//  Copyright © 2016年 tou360. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    VerticalLocationTop = 0,
    VerticalLocationMiddle,
    VerticalLocationBottom
} VerticalLocation;

@interface CLabel : UILabel
@property (nonatomic, assign) VerticalLocation verticalLocation;  //文字在垂直方向的位置
@property (nonatomic, assign) CGFloat lineSpace;     //行间距

- (NSMutableAttributedString *)setLabelText:(NSString *)text frontTextFontSize:(CGFloat)frontSize frontColor:(UIColor *)frontColor andFrontRange:(NSRange)frontRange behindTextFontSize:(CGFloat)behindSize behindColor:(UIColor *)behindColor andBehindRange:(NSRange)behindRange;

@end
