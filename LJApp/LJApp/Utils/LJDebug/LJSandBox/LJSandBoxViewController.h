//
//  LJSandBoxViewController.h
//  LJAppTest
//
//  Created by developer on 2019/9/3.
//  Copyright © 2019 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 沙盒浏览
 */
@interface LJSandBoxViewController : UIViewController

@end


#pragma mark - LJSandBoxModel
/**
 文件类型
 
 - LJSandBoxModelTypeRootDirectory: 根目录
 - LJSandBoxModelTypeSubDirectory: 子目录
 - LJSandBoxModelTypeFile: 文件
 */
typedef NS_ENUM(NSInteger, LJSandBoxModelType) {
    LJSandBoxModelTypeRootDirectory = 0,
    LJSandBoxModelTypeSubDirectory,
    LJSandBoxModelTypeFile,
};
@interface LJSandBoxModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, assign) LJSandBoxModelType type;
@end


#pragma mark - LJSandboxViewCell
@interface LJSandboxViewCell : UITableViewCell
/** 文件或文件夹名 */
@property (nonatomic, weak) UILabel *nameLabel;
/** 大小 */
@property (nonatomic, weak) UILabel *sizeLabel;
@property (nonatomic, strong) LJSandBoxModel *model;
@end

#pragma mark - LJLocalFilePreviewController
/**
 本地文件预览
 */
@interface LJLocalFilePreviewController : UIViewController
@property (nonatomic, copy) NSString *filePath;
@end

NS_ASSUME_NONNULL_END
