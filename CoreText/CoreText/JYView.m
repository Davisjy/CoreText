//
//  JYView.m
//  CoreText
//
//  Created by qingyun on 15/12/20.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "JYView.h"
#import <CoreText/CTFramesetter.h>

@implementation JYView

- (void)drawRect:(CGRect)rect {
    // CTFrameRef 整一大块文字
    // 需要用到CTFramesetterRef来创建CTFrameRef
    
    // CTLineRef 一行文字
    
    // CTRunRef  一段文字(一行中的某个段)
    
    // 创建frame的范围(路径)
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, rect);
    
    // 创建CTFramesetterRef
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"哈哈哈哈哈哈哈6546456哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈6546456哈哈哈\n哈哈哈哈654645645645哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"];
    // 设置段落样式
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 10;
    style.headIndent = 10;
    style.firstLineHeadIndent = 20;
    [string addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, string.length)];
    
//    [string drawInRect:rect];
    
    CTFramesetterRef setter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)string);
    
    // 创建Frame
    CTFrameRef frame =  CTFramesetterCreateFrame(setter, CFRangeMake(0, 0), path, NULL);
    
    CFArrayRef lines = CTFrameGetLines(frame);
    CFIndex linesCount = CFArrayGetCount(lines);
    NSLog(@"%ld", linesCount);
    
    // 转换坐标系
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // 画frame
    CTFrameDraw(frame, context);
    CFRelease(setter);
    CFRelease(frame);
    CFRelease(path);
}


@end
