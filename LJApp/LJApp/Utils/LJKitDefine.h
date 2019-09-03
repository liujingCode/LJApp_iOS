//
//  LJKitDefine.h
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#ifndef LJKitDefine_h
#define LJKitDefine_h

// 尺寸相关
#define LJKit_kHeight_statusBar [UIApplication sharedApplication].statusBarFrame.size.height

#define LJKit_kIsIphoneX ((LJKit_kHeight_statusBar>20.0)?YES:NO)

#define LJKit_kHeight_safeArea_bottom (LJKit_kIsIphoneX?34.0:0)

#define LJKit_kWidth_screen [UIScreen mainScreen].bounds.size.width

#define LJKit_kHeight_screen [UIScreen mainScreen].bounds.size.height
#endif /* LJKitDefine_h */
