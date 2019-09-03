//
//  LJSandBoxViewController.m
//  LJAppTest
//
//  Created by developer on 2019/9/3.
//  Copyright © 2019 developer. All rights reserved.
//

#import "LJSandBoxViewController.h"
#import <QuickLook/QuickLook.h>
#import <sqlite3.h>

@interface LJSandBoxViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LJSandBoxModel *currentDirModel;
@property (nonatomic, copy) NSArray <LJSandBoxModel *>*dataArray;
@property (nonatomic, copy) NSString *rootPath;
@end

@implementation LJSandBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.rootPath = NSHomeDirectory();
    self.dataArray= @[];
    
    [self loadFileWithPath:self.currentDirModel.path];
    
    [self setupSubviewLayouts];
}

#pragma mark - viewWillAppear
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadFileWithPath:self.currentDirModel.path];
}

#pragma mark - 子控件布局
- (void)setupSubviewLayouts {
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat navHeight = 44.0;
    
    self.tableView.frame = CGRectMake(0, statusBarHeight + navHeight, self.view.frame.size.width, self.view.frame.size.height - statusBarHeight - navHeight);
    
    if (self.navigationController) { // push
        self.title = @"沙盒浏览";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"上级目录" style:UIBarButtonItemStylePlain target:self action:@selector(clickBackDirectory)];
    } else { // present
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
        [closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(clickCloseBtn) forControlEvents:UIControlEventTouchUpInside];
        [closeBtn sizeToFit];
        [self.view addSubview:closeBtn];
        
        UIButton *backDirectoryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backDirectoryBtn setTitle:@"上级目录" forState:UIControlStateNormal];
        [backDirectoryBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backDirectoryBtn addTarget:self action:@selector(clickBackDirectory) forControlEvents:UIControlEventTouchUpInside];
        [backDirectoryBtn sizeToFit];
        [self.view addSubview:backDirectoryBtn];
        
        closeBtn.frame = CGRectMake(10, statusBarHeight, 60, 44.0);
        backDirectoryBtn.frame = CGRectMake(self.view.frame.size.width - 80 - 10, statusBarHeight, 80, 44.0);
    }
}

#pragma mark - 点击关闭
- (void)clickCloseBtn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 加载上级目录
- (void)clickBackDirectory {
    [self loadFileWithPath:[self.currentDirModel.path stringByDeletingLastPathComponent]];
}


#pragma mark - 加载目录
- (void)loadFileWithPath:(NSString *)path {
    NSString *targetPath = path;
    LJSandBoxModel *model = [LJSandBoxModel new];
    if ((!targetPath) || ([targetPath isEqualToString:self.rootPath])) {
        targetPath = _rootPath;
        model.name = @"根目录";
        model.type = LJSandBoxModelTypeRootDirectory;
    }else{
        model.name = @"返回上一级";
        model.type = LJSandBoxModelTypeSubDirectory;
    }
    model.path = targetPath;
    self.currentDirModel = model;
    
    // 该目录下面的内容信息
    NSFileManager *manager = [NSFileManager defaultManager];
    NSMutableArray *tempArr = [NSMutableArray array];
    NSError *error = nil;
    NSArray *paths = [manager contentsOfDirectoryAtPath:targetPath error:&error];
    for (NSString *path in paths) {
        BOOL isDir = false;
        NSString *fullPath = [targetPath stringByAppendingPathComponent:path];
        [manager fileExistsAtPath:fullPath isDirectory:&isDir];
        
        LJSandBoxModel *model = [[LJSandBoxModel alloc] init];
        model.path = fullPath;
        if (isDir) {
            model.type = LJSandBoxModelTypeSubDirectory;
        }else{
            model.type = LJSandBoxModelTypeFile;
        }
        model.name = path;
        
        [tempArr addObject:model];
    }
    
    self.dataArray = [NSArray arrayWithArray:tempArr];
    [self.tableView reloadData];
}

#pragma mark - tableView delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"LJSandboxViewCell";
    LJSandboxViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[LJSandboxViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    LJSandBoxModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LJSandBoxModel *model = self.dataArray[indexPath.row];
    NSString *filePath = model.path;
    if (model.type == LJSandBoxModelTypeFile) {
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"请选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        __weak typeof(self) weakSelf = self;
        UIAlertAction *previewAction = [UIAlertAction actionWithTitle:@"本地预览" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [weakSelf previewFileWithPath:filePath];
        }];
        UIAlertAction *shareAction = [UIAlertAction actionWithTitle:@"分享" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf shareFileWithPath:filePath];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertVc addAction:previewAction];
        [alertVc addAction:shareAction];
        [alertVc addAction:cancelAction];
        
        [self presentViewController:alertVc animated:YES completion:nil];
    }else if((model.type == LJSandBoxModelTypeSubDirectory) || (model.type == LJSandBoxModelTypeRootDirectory)){
        [self loadFileWithPath:model.path];
    }
}


#pragma mark - 文件分享
- (void)shareFileWithPath:(NSString *)path {
    NSURL *url = [NSURL fileURLWithPath:path];
    NSArray *objectsToShare = @[url];
    
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    NSArray *excludedActivities = @[UIActivityTypePostToTwitter, UIActivityTypePostToFacebook,
                                    UIActivityTypePostToWeibo,
                                    UIActivityTypeMessage, UIActivityTypeMail,
                                    UIActivityTypePrint, UIActivityTypeCopyToPasteboard,
                                    UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll,
                                    UIActivityTypeAddToReadingList, UIActivityTypePostToFlickr,
                                    UIActivityTypePostToVimeo, UIActivityTypePostToTencentWeibo];
    controller.excludedActivityTypes = excludedActivities;
    
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark - 文件预览
- (void)previewFileWithPath:(NSString *)path {
    LJLocalFilePreviewController *localPreviewVC = [LJLocalFilePreviewController new];
    localPreviewVC.filePath = path;
    [self presentViewController:localPreviewVC animated:YES completion:nil];
    
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}



@end


#pragma mark - LJSandBoxModel
@implementation LJSandBoxModel

@end

#pragma mark - LJSandboxViewCell
@implementation LJSandboxViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.sizeLabel.frame = CGRectMake(self.contentView.frame.size.width - 80, 0, 80, self.contentView.frame.size.height);
    self.nameLabel.frame = CGRectMake(10, 0, self.contentView.frame.size.width - 10 - 80, self.contentView.frame.size.height);
    
}

- (void)setModel:(LJSandBoxModel *)model {
    _model = model;
    self.nameLabel.text = model.name;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:15.0];
        label.numberOfLines = 2;
        [self.contentView addSubview:label];
        _nameLabel = label;
    }
    return _nameLabel;
}
- (UILabel *)sizeLabel {
    if (!_sizeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:15.0];
        [self.contentView addSubview:label];
        _sizeLabel = label;
    }
    return _sizeLabel;
}
@end


#pragma mark - LJLocalFilePreviewController
@interface LJLocalFilePreviewController ()<QLPreviewControllerDelegate,QLPreviewControllerDataSource>
//@property (nonatomic, weak) UITextView *textView;
@end

@implementation LJLocalFilePreviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.filePath.length == 0) {
        NSLog(@"文件不存在");
        return;
    }
    NSString *path = self.filePath;
    
    if ([path hasSuffix:@".strings"] || [path hasSuffix:@".plist"]) {
        [self previewText];
    } else if([path hasSuffix:@".DB"] || [path hasSuffix:@".db"] || [path hasSuffix:@".sqlite"] || [path hasSuffix:@".SQLITE"]){ // 数据库文件
        
    } else { // 其他文件
        
        QLPreviewController *previewController = [[QLPreviewController alloc]init];
        previewController.delegate = self;
        previewController.dataSource = self;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self presentViewController:previewController animated:YES completion:nil];
        });
        
    }
}

- (void)clickCloseBtn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 预览文本文件
- (void)previewText {
    NSString *text = [[NSDictionary dictionaryWithContentsOfFile:self.filePath] description];
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat y = statusBarHeight + 44.0;
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, y, self.view.frame.size.width, self.view.frame.size.height - y)];
    textView.font = [UIFont systemFontOfSize:12.0f];
    textView.textColor = [UIColor blackColor];
    textView.textAlignment = NSTextAlignmentLeft;
    textView.editable = NO;
    textView.dataDetectorTypes = UIDataDetectorTypeLink;
    textView.scrollEnabled = YES;
    textView.backgroundColor = [UIColor whiteColor];
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.borderWidth = 2.0f;
    textView.text = text;
    [self.view addSubview:textView];
    
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setTitle:@"关闭预览" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(clickCloseBtn) forControlEvents:UIControlEventTouchUpInside];
    [closeBtn sizeToFit];
    [self.view addSubview:closeBtn];
    
    closeBtn.frame = CGRectMake(10, statusBarHeight, 80, 44.0);
}

#pragma mark - 预览数据库文件
- (void)previewDbWithPath:(NSString *)path {
    sqlite3 *db = nil;
    sqlite3_open([path UTF8String], &db);
    if (db == nil) {
        return;
    }
    // 查询sqlite_master表
    NSMutableArray *tableNameArray = [NSMutableArray array];
    
    NSString *sql = @"select type, tbl_name from sqlite_master";
    sqlite3_stmt *stmt = NULL;
    if (sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, NULL) == SQLITE_OK) {
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            const unsigned char *type_c = sqlite3_column_text(stmt, 0);
            const unsigned char *tbl_name_c = sqlite3_column_text(stmt, 1);
            NSString *type = [NSString stringWithUTF8String:(const char *)type_c];
            NSString *tbl_name = [NSString stringWithUTF8String:(const char *)tbl_name_c];
            if (type && [type isEqualToString:@"table"]) {
                [tableNameArray addObject:tbl_name];
            }
        }
    }
    
}


#pragma mark - QLPreviewControllerDataSource, QLPreviewControllerDelegate
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
    return 1;
}
- (id)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
    return [NSURL fileURLWithPath:self.filePath];
}
- (void)previewControllerDidDismiss:(QLPreviewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

