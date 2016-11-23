//
//  CLabel.m
//  CustomLabel
//
//  Created by Gaochao on 16/11/23.
//  Copyright © 2016年 tou360. All rights reserved.
//

#import "CLabel.h"

@implementation CLabel

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.verticalLocation = VerticalLocationMiddle;
    }
    return self;
}

- (void)setVerticalLoaction:(VerticalLocation)verticalLoaction
{
    _verticalLocation = verticalLoaction;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalLocation) {
        case VerticalLocationTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalLocationBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalLocationMiddle:
            
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect
{
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}

- (NSMutableAttributedString *)setLabelText:(NSString *)text frontTextFontSize:(CGFloat)frontSize frontColor:(UIColor *)frontColor andFrontRange:(NSRange)frontRange behindTextFontSize:(CGFloat)behindSize behindColor:(UIColor *)behindColor andBehindRange:(NSRange)behindRange
{
    if (!text || [text isEqualToString:@""]) {
        return nil;
    }
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    
    if (self.lineSpace) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:self.lineSpace];
        [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    }
    if (frontRange.length) {
        [attributeString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:frontSize] range:frontRange];
        if (frontColor) {
            [attributeString addAttribute:NSForegroundColorAttributeName value:frontColor range:frontRange];
        }
    }
    if (behindRange.length) {
        [attributeString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:behindSize] range:behindRange];
        if (behindColor) {
            [attributeString addAttribute:NSForegroundColorAttributeName value:behindColor range:behindRange];
        }
    }
    return attributeString;
}


@end
