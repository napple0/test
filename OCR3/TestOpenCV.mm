//
//  TestOpenCV.m
//
//
//  Created by k13052kk on 2015/12/03.
//
//

/*
画像をモノクロ２値化するクラス(C++)
*/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "OCR3-Bridging-Header.h"

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

@implementation TestOpenCV : NSObject

+(UIImage *)BinarizationWithImage:(UIImage *)image{ //画像を２値化する関数
    
    //UIImageをcv::Matに変換
    cv::Mat mat;
    UIImageToMat(image, mat);
    
    //白黒画像に変換
    cv::Mat matGray;
    cv::cvtColor(mat, matGray, CV_BGR2GRAY);
        
    //２値化処理
    cv::Mat Threhold;
    cv::Mat Threhold2;
    cv::Mat laplacian;
    cv::Mat resize;
    
    cv::threshold(matGray, Threhold, 0, 255,cv::THRESH_TRUNC|cv::THRESH_OTSU);
    cv::threshold(Threhold, Threhold2, 0, 255, cv::THRESH_BINARY|cv::THRESH_OTSU);
    cv::Laplacian(Threhold2, laplacian, CV_32F,3);
    convertScaleAbs(Threhold2,laplacian,1,0);
    
    
    //cv::MatをUIImageに変換
    UIImage *BinariImg = MatToUIImage(laplacian);
    return BinariImg;
}
//
//+(UIImage *)trimmingImage:(UIImage *)image2{
//    cv::Mat mat2;
//    UIImageToMat(image2, mat2);
//
//    
//    IplImage* cropimg = cvCreateImage(cvSize(width,height),image2->depth,image2->nChannels);
//    cvSetImageROI(cropimg, cvRect(0, 0, 100, 100));
//    cvResetImageROI(cropimg);
//    cvReleaseImage(&cropimg);
//    
//    
//    
//    
//    
//    
//}

@end