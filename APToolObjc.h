//
//  APToolObjc.h
//  AlphaNews
//
//  Created by shenkaiyang on 2017/6/28.
//  Copyright © 2017年 icourt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ICLabelTypeModel.h"
#import "APTianyanModel.h"
@interface APToolObjc : NSObject
typedef void (^CompressionSuccessBlock)(NSString *resultPath,float memorySize); // 定义成功的Block 函数
+(NSInteger)getCurrentDayWithDate:(NSDate *)date;
+(NSInteger)getCurrentYearWithDate:(NSDate *)date;
// 获取当前时间的月
+(NSInteger)getCurrentMonthWithDate:(NSDate *)date;
+(NSInteger)getCurrentHourWithDate:(NSDate *)date;
+(NSInteger)getCurrentMinuteWithDate:(NSDate *)date ;
+(NSInteger)getCurrentSecondWithDate:(NSDate *)date ;
+(NSInteger)getNumberOfDaysDifferenceWith:(NSString *)millisecond;
+(NSString *)getCurrentShortTimeWith:(NSString *)millisecond;
+(NSString *)calculateConstellationWithMonth:(NSInteger)month day:(NSInteger)day;
#pragma mark - 将某个时间转化成 时间戳 时间格式的字符串转时间戳
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;
//h获取年龄
+ (NSInteger)getAgeWith:(NSString *) millisecond;
//根据生日得到生肖
+ (NSString *)getZodiacWith:(NSString *) millisecond;
//得到生肖的算法
/**
 
 y 年
 */
+(NSString *)getZodiacWithYear:(NSInteger)y;
//得到星座的算法

+ (NSString *)getCalculateConstellatWith:(NSString *) millisecond;
//根据时间戳获取最近的生日日期
+ (NSString *)getNearbyBrithdatWith:(NSString *)millisecond;
+(NSString *)getCurrentTimeStrWith:(NSString *)timeNumber WithTypeFormatter:(NSString *)formatterStr;
//两者差多少天
+ (NSInteger)standardAlgorithmNumberOfDaysDifferenceWith:(NSString *)millisecond;
//刚刚 现在 立马
//获取当前时间的时间戳
+(NSString *)getCurrentTimeNumber;
//时间转换得到自定义时间类型
+(NSString *)creatCurrentTimeWith:(NSString *)millisecond;
//判断手机号
+ (BOOL)validateMobile:(NSString *)mobile;
//判断邮箱
+ (BOOL)validateEmail:(NSString *)email;
//判断邮编
+ (BOOL)validatePostNumber:(NSString *)postNumber;
//判断座机
+ (BOOL)checkTelNumber:(NSString *)number;
#pragma mark - 获取当天凌晨的时间戳
+ (NSInteger)getZerocurrentDayTime;
#pragma mark - 获取当前显示的视图控制器
+ (UINavigationController *)selectedNavigationController;
//根据文件名获取文件类型
+ (NSString *)fileImageWithFileContent:(NSString *)fileContentl;
//获取文件类型
//调用C底层API来获得文件的MIMEType ，只能获取本地文件，无法获取网络请求来的文件

+(NSString *)getMIMETypeWithCAPIAtFilePath:(NSString *)path;
//判断字符串是不是全数字
+ (BOOL)deptNumInputShouldNumber:(NSString *)str;
//根据时间戳判断是否过期《今天比较》
+ (NSString *)getcurrentTimeWIth:(NSString *)time;
//消息推送根据消息类型推送融云系统
+ (void)pushContractInfonActive:(BOOL)isActive WithTitleContent:(NSDictionary  *)pushRongDic withTitle:(NSString *)content;
+ (void)uploadContractInfoSuccessWith:(BOOL)isClient withFileId:(NSString *)fileId;
//获取未读消息数
+ (NSInteger)getUnReadCount;
//系统推送
+ (NSInteger)getUnReadSystemCount;
//角标显示
+ (NSInteger)getIconBadgeNumber;
//退出登录清除所有消息
+ (void)clearMessageUnReadSystemCount;
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
//视频压缩
+ (void)compressedVideoOtherMethodWithURL:(NSURL *)url compressionType:(NSString *)compressionType compressionResultPath:(CompressionSuccessBlock)resultPathBlock;
+ (void)uploadVoiceWithFileData:(NSData *)voiceData fileName:(NSString *)fileName success:(void(^)(id responseObject))success ProgressBlock:(void (^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))block failure:(void(^)(NSError *error))failure;
//保存标签
#pragma mark =========== 保存标签===============
+ (NSString *)getSaveICPerconLabelModelPath;
#pragma mark =========== 获取标签数据===============
+ (NSMutableArray *)getICPersonLabelInfoList;
#pragma mark =========== 获取标签数据===============
+ (void)savePersonLabelInfo;
#pragma mark =========== 删除标签组===============
+ (void)removePersonLabelTypGroupWith:(NSInteger)section;
#pragma mark =========== 添加标签组===============
+(void)addPersonLabeGroupInfoListWith:(ICLabelTypeModel *)labelModel;
#pragma mark ===========编辑标签组===============
+ (void)editPersonLabelGroupListWith:(ICLabelTypeModel *)labelModel With:(NSInteger)section;
#pragma mark =========== 标签内容===============
+ (NSString *)getICPersonLabelContentInfoWith:(ICLabelTypeModel *)model;
#pragma mark =========== 计算字符串长度===============
+(CGSize)calculationLabelWidthWithText:(NSString *)textStr labelFont:(UIFont *)font withLabelLeading:(CGFloat)leadingWidth;









@end
