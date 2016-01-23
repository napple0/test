//
//  Tesseract.swift
//  OCR3
//
//  Created by k13052kk on 2016/01/07.
//  Copyright (c) 2016年 k13052kk. All rights reserved.
//

import Foundation
/*
文字認識をするクラス
*/
class Tesseract: NSObject, G8TesseractDelegate{
    
    func analyze(myImage:UIImage)->String { //画像内の文字を文字列で返す
        
        var TesseText:String = "k13052"
        
        var tesseract = G8Tesseract(language: "eng") //eng　英語のみで認識する。
        tesseract.delegate = self
        
        tesseract.image = myImage //OCRを実行する画像を設定
        
        tesseract.recognize()
        
        TesseText = tesseract.recognizedText
        
        //println(TesseText)
        
        return TesseText
    }
    
    func shouldCancelImageRecognitionForTesseract(tesseract: G8Tesseract!) -> Bool {
        return false; // return true if you need to interrupt tesseract before it finishes
    }

}