//
//  Header.h
//  
//
//  Created by k13052kk on 2015/12/03.
//
//


#ifndef OCR3_OCR3_Bridging_Header_h
#define OCR3_OCR3_Bridging_Header_h

//Tesseのヘッダーファイルをインポート
#import "G8Tesseract.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//TestOpenCV内のメインで使う関数を宣言
@interface TestOpenCV : NSObject
+(UIImage *)BinarizationWithImage:(UIImage *)image;


@end

#endif