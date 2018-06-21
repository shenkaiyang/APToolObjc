//
//  APToolObjc.m
//  AlphaNews
//
//  Created by shenkaiyang on 2017/6/28.
//  Copyright © 2017年 icourt. All rights reserved.
//

#import "APToolObjc.h"
#import "ICAddContractController.h"

@implementation APToolObjc
+(NSInteger)getCurrentDayWithDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    
    NSInteger day = [dateComponent day];
    //    NSInteger minute = [dateComponent minute];
    return day;
}
+(NSInteger)getCurrentYearWithDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    
    NSInteger year = [dateComponent year];
    //    NSInteger minute = [dateComponent minute];
    return year;
}
// 获取当前时间的月
+(NSInteger)getCurrentMonthWithDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    
    NSInteger month = [dateComponent month];
    //    NSInteger minute = [dateComponent minute];
    return month;
}
+ (NSInteger)getCurrentHourWithDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    
    NSInteger hour = [dateComponent hour];
    //    NSInteger minute = [dateComponent minute];
    return hour;
}
+ (NSInteger)getCurrentMinuteWithDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    
    NSInteger minute = [dateComponent minute];
    //    NSInteger minute = [dateComponent minute];
    return minute;
}
+(NSInteger)getCurrentSecondWithDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    
    NSInteger second = [dateComponent second];
    //    NSInteger minute = [dateComponent minute];
    return second;
}
//差多少毫秒
+ (NSInteger)getNumberOfDaysDifferenceWith:(NSString *)millisecond{
    
    NSTimeInterval shorttime = 0;
    NSDate *currentDate  = [NSDate date];
//    当前时间的时间戳
    NSTimeInterval interval = [currentDate timeIntervalSince1970] * 1000;
   
    NSDate *getDateffff = [[NSDate alloc]initWithTimeIntervalSince1970:[millisecond integerValue]/1000.0];
    //解决时间上差8小时
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval2 = [zone secondsFromGMTForDate: getDateffff];
    NSDate *getDate = [getDateffff  dateByAddingTimeInterval: interval2];
    
    NSInteger currentYear = [APToolObjc getCurrentYearWithDate:currentDate];
    NSInteger currentMonth = [APToolObjc getCurrentMonthWithDate:currentDate];
    NSInteger currentDay = [APToolObjc getCurrentDayWithDate:currentDate];
    NSInteger getYear = [APToolObjc getCurrentYearWithDate:getDate];
    NSInteger getMonth = [APToolObjc getCurrentMonthWithDate:getDate];
    NSInteger getDay = [APToolObjc getCurrentDayWithDate:getDate];
   //    如果比当前年大
    if ([millisecond integerValue] > interval) {
        shorttime = [millisecond integerValue] - interval;
    }else {
     //比当前年小
        NSInteger numberYear = currentYear - getYear;
        if (getMonth > currentMonth) {
            shorttime = [millisecond integerValue] + numberYear * 365 * 24 * 3600* 1000 - interval;
        
        }else if (getMonth == currentMonth){
            if (getDay > currentDay) {
                shorttime = ([millisecond integerValue] + numberYear * 365 * 24 * 3600 * 1000) - interval;
            }else if (getDay == currentDay){
                shorttime = 0;

            }else{
                shorttime = ([millisecond integerValue] + (numberYear + 1) * 365 * 24 * 3600 * 1000) - interval;
            }
        }else{
            shorttime = ([millisecond integerValue] + (numberYear + 1) * 365 * 24 * 3600 * 1000) - interval;
        }
    }
    return shorttime / 1000;
}

+ (NSString *)getNearbyBrithdatWith:(NSString *)millisecond{
    
    NSString *nearbyBirthday = @"";
    NSTimeZone *zone = [NSTimeZone systemTimeZone];

    NSDate *date  = [NSDate date];
    NSInteger interval1 = [zone secondsFromGMTForDate: date];
    NSDate *currentDate = [date  dateByAddingTimeInterval: interval1];
    //    当前时间的时间戳
//    NSTimeInterval interval = [currentDate timeIntervalSince1970] * 1000;
    //生日的时间格式转本地的格式
    NSDate *getDateffff = [[NSDate alloc]initWithTimeIntervalSince1970:[millisecond integerValue]/1000.0];
    //解决时间上差8小时
    NSInteger interval2 = [zone secondsFromGMTForDate: getDateffff];
    //转本地后的date时间格式
    NSDate *getDate = [getDateffff  dateByAddingTimeInterval: interval2];
    
    NSInteger currentYear = [APToolObjc getCurrentYearWithDate:currentDate];
    NSInteger currentMonth = [APToolObjc getCurrentMonthWithDate:currentDate];
    NSInteger currentDay = [APToolObjc getCurrentDayWithDate:currentDate];
//    NSInteger getYear = [APToolObjc getCurrentYearWithDate:getDate];
    NSInteger getMonth = [APToolObjc getCurrentMonthWithDate:getDate];
    NSInteger getDay = [APToolObjc getCurrentDayWithDate:getDate];
    //    如果比当前年大
    if (currentMonth > getMonth) {
        nearbyBirthday = [NSString stringWithFormat:@"%ld-%ld-%ld",currentYear + 1,getMonth,getDay];
    }else if (currentMonth == getMonth){
        if (currentDay > getDay) {
            nearbyBirthday = [NSString stringWithFormat:@"%ld-%ld-%ld",currentYear + 1,getMonth,getDay];
        }else {
            nearbyBirthday = [NSString stringWithFormat:@"%ld-%ld-%ld",currentYear,getMonth,getDay];
        }
    }else{
        nearbyBirthday = [NSString stringWithFormat:@"%ld-%ld-%ld",currentYear,getMonth,getDay];
    }
    return nearbyBirthday;
}
//hu获取最标准的差了多少天
+ (NSInteger)standardAlgorithmNumberOfDaysDifferenceWith:(NSString *)millisecond{
    NSString *nearbyBirthday = [APToolObjc getNearbyBrithdatWith:millisecond];
    NSDate *currentDate  = [APToolObjc zeroOfDate];
    NSTimeInterval interval = [currentDate timeIntervalSince1970];
    NSInteger  nearbyTime = [APToolObjc  timeSwitchTimestamp:nearbyBirthday andFormatter:@"YYYY-MM-dd"];
    //    当前时间的时间戳
    NSInteger numberTime = nearbyTime - interval;
  
    return numberTime / (24 * 3600);
}

+ (NSDate *)zeroOfDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    NSDate *startDate = [calendar dateFromComponents:components];
    //时间转时间戳的方法:
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval2 = [zone secondsFromGMTForDate: startDate];
    //转本地后的date时间格式
    NSDate *getDate = [startDate  dateByAddingTimeInterval: interval2];
    return getDate;
}

#pragma mark - 将某个时间转化成 时间戳 时间格式的字符串转时间戳

+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval2 = [zone secondsFromGMTForDate: date];
    //转本地后的date时间格式
    NSDate *getDate = [date  dateByAddingTimeInterval: interval2];

    NSInteger timeSp = [[NSNumber numberWithDouble:[getDate timeIntervalSince1970]] integerValue];
    return timeSp;
    
}

+(NSString *)getCurrentTimeStrWith:(NSString *)timeNumber WithTypeFormatter:(NSString *)formatterStr{
    
    NSString *nearbyStr  = [APToolObjc getNearbyBrithdatWith:timeNumber];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd"]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:nearbyStr]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval2 = [zone secondsFromGMTForDate: date];
    //转本地后的date时间格式
    NSDate *getDate = [date  dateByAddingTimeInterval: interval2];
    NSDateFormatter *datefFormatter = [[NSDateFormatter alloc] init];
    [datefFormatter setDateFormat:formatterStr];
    NSString *shangdateString = [datefFormatter stringFromDate:getDate];
    return shangdateString;
}




+(NSString *)getCurrentShortTimeWith:(NSString *)millisecond{
    NSInteger number = [APToolObjc getNumberOfDaysDifferenceWith:millisecond];
    NSString *daystr = @"";
    NSInteger timeMonth =   31* 24 * 3600;

    NSInteger conetnetNumber =  number / timeMonth;
    NSInteger day = number % timeMonth;
    
    if (number == 0) {
        daystr = @"今天";
    }else{
       
        if (conetnetNumber  >= 1  ) {
            if (day== 0) {
                daystr = [NSString stringWithFormat:@"%ld月后",number / ( 31 * 24 * 3600)];
  
            }else{
                daystr = [NSString stringWithFormat:@"%ld月后",number / ( 31 * 24 * 3600) + 1];

            }
            
        }else{
            NSInteger hous =  number % (24 *360);
            if (hous > 0.5) {
                daystr = [NSString stringWithFormat:@"%ld天后",number / (24 * 3600) + 1];
            }else{
                daystr = [NSString stringWithFormat:@"%ld天后",number / (24 * 3600)];

            }
            
        }
  
    }
   
    return daystr;

}

//h获取年级
+ (NSInteger)getAgeWith:(NSString *) millisecond{
    NSDate *currentDate  = [NSDate date];
    NSDate *getDateffff = [[NSDate alloc]initWithTimeIntervalSince1970:[millisecond integerValue]/1000.0];
    //解决时间上差8小时
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval2 = [zone secondsFromGMTForDate: getDateffff];
    NSDate *getDate = [getDateffff  dateByAddingTimeInterval: interval2];
    NSInteger currentYear = [APToolObjc getCurrentYearWithDate:currentDate];
    NSInteger getYear = [APToolObjc getCurrentYearWithDate:getDate];
    NSInteger currentMonth = [APToolObjc getCurrentMonthWithDate:currentDate];
    NSInteger getMonth = [APToolObjc getCurrentMonthWithDate:getDate];
    NSInteger currentDay = [APToolObjc getCurrentDayWithDate:currentDate];
    NSInteger getDay = [APToolObjc getCurrentDayWithDate:getDate];

    if (currentMonth > getMonth) {
        return currentYear - getYear;
 
    }else if (currentMonth == getMonth){
        if (currentDay >= getDay) {
            return currentYear - getYear;
  
        }else{
            return currentYear - getYear -1;

        }

    }else{
        return currentYear - getYear -1;
    }
    
//    NSDate *getDateffff = [[NSDate alloc]initWithTimeIntervalSince1970:[millisecond integerValue]/1000.0];
//    //解决时间上差8小时
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSInteger interval2 = [zone secondsFromGMTForDate: getDateffff];
//    //转本地后的date时间格式
//    NSDate *birthday = [getDateffff  dateByAddingTimeInterval: interval2];
//    //日历
//    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//    
//    NSUInteger unitFlags = NSCalendarUnitYear;
//    
//    NSDateComponents *components = [gregorian components:unitFlags fromDate:birthday toDate:[NSDate  date] options:0];
    
}
//根据生日得到生肖
+ (NSString *)getZodiacWith:(NSString *) millisecond{
    
    NSDate *getDateffff = [[NSDate alloc]initWithTimeIntervalSince1970:[millisecond integerValue]/1000.0];
    //解决时间上差8小时
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval2 = [zone secondsFromGMTForDate: getDateffff];
    //转本地后的date时间格式
    NSDate *getDate = [getDateffff  dateByAddingTimeInterval: interval2];
    
    NSInteger currentYear = [APToolObjc getCurrentYearWithDate:getDate];
    
    return [APToolObjc  getZodiacWithYear:currentYear];
}

//得到生肖的算法
+(NSString *)getZodiacWithYear:(NSInteger)y{
    if (y <0) {
        return @"错误日期格式!!!";
    }
    
    NSString *zodiacString = @"鼠牛虎兔龙蛇马羊猴鸡狗猪";
    
    NSRange range = NSMakeRange ((y+9)%12-1, 1);
    
    NSString*  result = [zodiacString  substringWithRange:range];
    
    return result;
    
}


+ (NSString *)getCalculateConstellatWith:(NSString *) millisecond{
    //解决时间上差8小时
    NSDate *getDateffff = [[NSDate alloc]initWithTimeIntervalSince1970:[millisecond integerValue]/1000.0];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval2 = [zone secondsFromGMTForDate: getDateffff];
    //转本地后的date时间格式
    NSDate *getDate = [getDateffff  dateByAddingTimeInterval: interval2];
    NSInteger getMonth = [APToolObjc getCurrentMonthWithDate:getDate];
    NSInteger getDay = [APToolObjc getCurrentDayWithDate:getDate];
    return [APToolObjc calculateConstellationWithMonth:getMonth day:getDay];
}
//获取当前时间的时间戳
+(NSString *)getCurrentTimeNumber{
    NSDate *currentDate  = [NSDate date];
    //    当前时间的时间戳
    NSTimeInterval interval = [currentDate timeIntervalSince1970] * 1000;
    return [NSString stringWithFormat:@"%.0f",interval];
}
+(NSString *)calculateConstellationWithMonth:(NSInteger)month day:(NSInteger)day
{
    NSString *astroString = @"摩羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手摩羯";
    NSString *astroFormat = @"102123444543";
    NSString *result;
    
    if (month<1 || month>12 || day<1 || day>31){
        return @"错误日期格式!";
    }
    
    if(month==2 && day>29)
    {
        return @"错误日期格式!!";
    }else if(month==4 || month==6 || month==9 || month==11) {
        if (day>30) {
            return @"错误日期格式!!!";
        }
    }
    
    result=[NSString stringWithFormat:@"%@",[astroString substringWithRange:NSMakeRange(month*2-(day < [[astroFormat substringWithRange:NSMakeRange((month-1), 1)] intValue] - (-19))*2,2)]];
    
    return [NSString stringWithFormat:@"%@座",result];
}
+(NSString *)creatCurrentTimeWith:(NSString *)millisecond{
    NSDate *currentDate  = [NSDate date];
    //    当前时间的时间戳
    NSTimeInterval now = [currentDate timeIntervalSince1970];
    
  
    NSInteger late = [millisecond integerValue] / 1000;

    
    NSString * timeString = nil;
    NSTimeInterval cha = now - late;
    if (cha/3600 < 1) {
        
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        
        timeString = [timeString substringToIndex:timeString.length-7];
        
        int num= [timeString intValue];
        
        if (num <= 1) {
            
            timeString = [NSString stringWithFormat:@"刚刚"];
            
        }else{
            
            timeString = [NSString stringWithFormat:@"%@分钟前", timeString];
        }
    }
    if (cha/3600 > 1 && cha/86400 < 1) {
        
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        
        timeString = [timeString substringToIndex:timeString.length-7];
        
        timeString = [NSString stringWithFormat:@"%@小时前", timeString];
        
    }
    if (cha/86400 > 1)
        
    {
        timeString = [APHttpManager getCurrentTimeStrWith:millisecond WithTypeFormatter:@"yyyy.MM.dd HH:mm EEE"];
       
    }
    return timeString;
}
//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile
{
   
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(17[0,0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
//邮箱
+ (BOOL) validateEmail:(NSString *)email
{
    if (email.length == 0) {
        return YES;
    }
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//邮编验证
+ (BOOL) validatePostNumber:(NSString *)postNumber
{
    if (postNumber.length == 0) {
        return YES;
    }
    //[1-9]\d{5}(?!\d)
    NSString *postNumberRegex = @"[0-9]\\d{4}(?!\\d)";
    NSPredicate *postNumberPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",postNumberRegex];
    return [postNumberPredicate evaluateWithObject:postNumber];
    
}
+ (BOOL)checkTelNumber:(NSString *)number{
    if (number.length == 0) {
        return YES;
    }
     NSString * strNum = @"";
    if ([number containsString:@"-"]) {
        strNum = @"^(0[0-9]{2,3}-)?([2-9][0-9]{6,7})+(-[0-9]{1,4})?$|(^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\\d{8}$)";
    }else{
        strNum = @"^(0[0-9]{2,3})?([2-9][0-9]{6,7})+(-[0-9]{1,4})?$|(^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\\d{8}$)";

    }
    NSPredicate *checktest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strNum];
    
    return [checktest evaluateWithObject:number];
    
}
#pragma mark - 获取当天凌晨的时间戳
+ (NSInteger)getZerocurrentDayTime
{
    NSDate *originalDate = [NSDate dateWithTimeIntervalSince1970:(int)time(NULL)];
    NSDateFormatter *dateFomater = [[NSDateFormatter alloc]init];
    dateFomater.dateFormat = @"yyyy年MM月dd日";
    NSString *original = [dateFomater stringFromDate:originalDate];
    NSDate *ZeroDate = [dateFomater dateFromString:original];
    double b = [ZeroDate timeIntervalSince1970] ;
    return b*1000;
}
#pragma mark ---- 保存当前时间以毫秒数的形式保存到本地--
+ (void)savecurrentData:(NSString *)typeNameSter{
    NSDate *currentDate = [NSDate date];
    UInt64 recordTime = [currentDate timeIntervalSince1970]*1000;
    NSString *currentStr = [NSString stringWithFormat:@"%llu",recordTime];
    [[NSUserDefaults standardUserDefaults] setObject:currentStr forKey:typeNameSter];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
#pragma mark ---- 根据时间戳转时间格式字符串
+(NSString *)getTimeStrWith:(NSString *)timeNumber{
    NSDate *fffd = [[NSDate alloc]initWithTimeIntervalSince1970:[timeNumber integerValue]/1000.0];
    NSDateFormatter *datefFormatter = [[NSDateFormatter alloc] init];
    [datefFormatter setDateFormat:@"yy-MM-dd HH:mm:ss"];
    NSString *shangdateString = [datefFormatter stringFromDate:fffd];
    return shangdateString;
}

+ (NSString *)getcurrentData:(NSString *)typeNameSter{
    NSDate *currentDate = [NSDate date];
    UInt64 recordTime = [currentDate timeIntervalSince1970]*1000;
    NSString *currentStr = [NSString stringWithFormat:@"%llu",recordTime];
    return [[NSUserDefaults standardUserDefaults] objectForKey:typeNameSter] == nil ? currentStr:[[NSUserDefaults standardUserDefaults] objectForKey:typeNameSter];
}

// 获取当前屏幕显示的UINavigationController
+ (UINavigationController *)selectedNavigationController
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    APTabController *currentVc = (APTabController *)(window.rootViewController);
    UINavigationController * nv = currentVc.selectedViewController;
    return nv;
}
+ (NSString *)fileImageWithFileContent:(NSString *)fileContent
{
    NSString *pathExtension = [fileContent pathExtension];
    NSString *imagePath = @"filetypeDefault";
    if ([@[@"xls", @"xlsx"] containsObject:pathExtension]) {
        imagePath = @"filetypeExcel";
    } else if ([@[@"png", @"jpg", @"jpeg"] containsObject:pathExtension]) {
        imagePath = @"filetypeImage";
    } else if ([@[@"ppt", @"pptx", @"key", @"pages"] containsObject:pathExtension]) {
        imagePath = @"filetypePpt";
    } else if ([@[@"doc", @"docx"] containsObject:pathExtension]) {
        imagePath = @"filetypeDoc";
    } else if ([@[@"zip"] containsObject:pathExtension]) {
        imagePath = @"filetypeZip";
    } else if ([@[@"mp3"] containsObject:pathExtension]) {
        imagePath = @"filetypeMusic";
    } else if ([@[@"mp4", @"av"] containsObject:pathExtension]) {
        imagePath = @"filetypeVideo";
    } else if ([@[@"pdf"] containsObject:pathExtension]){
        imagePath = @"filetypePdf";
    } else if ([@[@"txt"] containsObject:pathExtension]){
        imagePath = @"filetypeDefault";
    } else if ([@[@"html", @"htm", @"shtml", @"shtm", @"webarchive"] containsObject:pathExtension]) {
        imagePath = @"filetypeDefault";
    }
    
    return [imagePath stringByAppendingString:@"40"];
}
- (void)someViewController:(NSArray *)photosArr sendToAnotherVCWithToken:(NSString *)Token andIDNum:(NSString *)idNum {
//    NSLog(@"名字:%@ 和身份证号:%@", name, idNum);
    // －－－－－－－－－－－－－－－－－－－－－－－－－－－－上传图片－－－－
    /*
     此段代码如果需要修改，可以调整的位置
     1. 把upload.php改成网站开发人员告知的地址
     2. 把name改成网站开发人员告知的字段名
     */
    // 查询条件
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:name, @"name", idNum, @"idNumber", nil];
    
    // 基于AFN3.0+ 封装的HTPPSession句柄
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 20;
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
    // 在parameters里存放照片以外的对象
    [manager POST:@"http://www.example.com/Project/upload.php" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // formData: 专门用于拼接需要上传的数据,在此位置生成一个要上传的数据体
        // 这里的_photoArr是你存放图片的数组
        for (int i = 0; i < photosArr.count; i++) {
            
            UIImage *image = photosArr[i];
            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
            
            // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
            // 要解决此问题，
            // 可以在上传时使用当前的系统事件作为文件名
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            // 设置时间格式
            [formatter setDateFormat:@"yyyyMMddHHmmss"];
            NSString *dateString = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString  stringWithFormat:@"%@.jpg", dateString];
            /*
             *该方法的参数
             1. appendPartWithFileData：要上传的照片[二进制流]
             2. name：对应网站上[upload.php中]处理文件的字段（比如upload）
             3. fileName：要保存在服务器上的文件名
             4. mimeType：上传的文件的类型
             */
            [formData appendPartWithFileData:imageData name:@"upload" fileName:fileName mimeType:@"image/jpeg"]; //
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"---上传进度--- %@",uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"```上传成功``` %@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"xxx上传失败xxx %@", error);
        
    }];
}

+(NSString *)getMIMETypeWithCAPIAtFilePath:(NSString *)path
{
    if (![[[NSFileManager alloc] init] fileExistsAtPath:path]) {
        return nil;
    }
    
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)[path pathExtension], NULL);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass (UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    if (!MIMEType) {
        return @"application/octet-stream";
    }
    return  (__bridge_transfer NSString*)(MIMEType);
}
- (void)upLoadImageGroupInfoWith:(NSArray *)imageUrlArr{
     // 创建队列组
    dispatch_group_t group = dispatch_group_create();
    // 创建信号量，并且设置值为10
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i < imageUrlArr.count; i++)
    {   // 由于是异步执行的，所以每次循环Block里面的dispatch_semaphore_signal根本还没有执行就会执行dispatch_semaphore_wait，从而semaphore-1.当循环10此后，semaphore等于0，则会阻塞线程，直到执行了Block的dispatch_semaphore_signal 才会继续执行
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        dispatch_group_async(group, queue, ^{
            NSLog(@"%i",i);
            sleep(2);
            // 每次发送信号则semaphore会+1，
            dispatch_semaphore_signal(semaphore);
        });
    }
    
   
}
- (void)uploadWith:(NSURL *)imageUrl withSemaphore:(dispatch_semaphore_t)semaphore{
    //    2、使用AFN提供的POST方法最便捷
//    _isUpload = YES;
    
    NSString *fileName = [imageUrl lastPathComponent];
    //    NSString *fileType = [fileName pathExtension];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    [manager.requestSerializer setValue:NSUserDefaultsGet_(@"token") forHTTPHeaderField:@"token"];
    
    __block NSData *fileData = [NSData dataWithContentsOfURL:imageUrl];
    __block NSString *mimeTye = [APToolObjc getMIMETypeWithCAPIAtFilePath:[imageUrl path]];
    [manager POST:POST_File parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //        NSError *err;
        //        [formData appendPartWithFileURL:self.url name:name error:&err];
        [formData appendPartWithFileData:fileData name:@"file" fileName:fileName mimeType:mimeTye];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"-------%f",uploadProgress.fractionCompleted);
        //        NSString *uploadProgressStr = [NSString stringWithFormat:@"%f",uploadProgress.fractionCompleted];
        //        [[NSNotificationCenter defaultCenter] postNotificationName:@"uploadFile" object:uploadProgressStr];
        [SVProgressHUD  showProgress:uploadProgress.fractionCompleted];
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
//        _isUpload = NO;
        
        NSLog(@"-----%@",responseObject);
        NSString *succeed = [NSString stringWithFormat:@"%@",responseObject[@"succeed"]];
        NSString *message = [NSString stringWithFormat:@"%@",responseObject[@"message"]];
        
        if ([succeed isEqualToString:@"1"]) {
            
            dispatch_semaphore_signal(semaphore);

            
        }else{
            [SVProgressHUD showErrorWithStatus:message];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
//        _isUpload = NO;
        
    }];
    
}
+ (BOOL)deptNumInputShouldNumber:(NSString *)str
{
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}

+ (NSString *)getcurrentTimeWIth:(NSString *)time{
    if (time.length == 0) {
        return @"暂无";
    }
    NSDate *currentDate = [NSDate date];
    NSInteger currentTime = [currentDate timeIntervalSince1970]*1000;
//    NSString *currentStr = [NSString stringWithFormat:@"%llu",recordTime];
    NSInteger recordTime = [time integerValue];
  
    NSString *dayStr = @"";
    if (recordTime > currentTime) {
        NSInteger differTime = 0;
        NSInteger day = 0;
        differTime = recordTime - currentTime;
        day = differTime / (24 *3600 * 1000);
        dayStr = [NSString stringWithFormat:@"%ld天",day];
    }else if (recordTime == currentTime){
//        differTime = 0;
       dayStr = @"0天";
    }else{
//        differTime = currentTime - differTime;
//        day = differTime / (24 *3600 * 1000);
        dayStr = @"已过期";
    }
    return dayStr;
}
+ (void)pushContractInfonActive:(BOOL)isActive WithTitleContent:(NSDictionary  *)pushRongDic withTitle:(NSString *)content{
    
    if (isActive) {
        NSString *fileId  = pushRongDic[@"id"];
        ICAddContractController *icaddContractVC = [[ICAddContractController alloc]init];
        icaddContractVC.referenceId =fileId;
        icaddContractVC.state = @"";
        icaddContractVC.contractType = kClientType;
        icaddContractVC.EditType = ADD_contractTypeInfo;
        [[APToolObjc selectedNavigationController] pushViewController:icaddContractVC animated:YES];
    }else{
        if (content.length == 0) {
            return;
        }
        FFToast *toast = [[FFToast alloc]initToastWithTitle:nil message:content iconImage:nil];
        toast.toastType = FFToastTypeInfo;
        toast.toastBackgroundColor = [UIColor colorWithHexColor:@"#ed6c00"];
        toast.messageFont = [UIFont systemFontOfSize:14.0f];
        toast.toastAlpha = 0.8;
        toast.toastPosition = FFToastPositionBelowStatusBarWithFillet;
        [[NSNotificationCenter defaultCenter] postNotificationName:PUSH_CONTRACT_ACTION object:nil];
        [toast show:^{
            NSString *fileId  = pushRongDic[@"id"];
            ICAddContractController *icaddContractVC = [[ICAddContractController alloc]init];
            icaddContractVC.referenceId =fileId;
            icaddContractVC.state = @"";
            icaddContractVC.contractType = kClientType;
            icaddContractVC.EditType = ADD_contractTypeInfo;
            [[APToolObjc selectedNavigationController] pushViewController:icaddContractVC animated:YES];
        }];
    }
}
+ (void)uploadContractInfoSuccessWith:(BOOL)isClient withFileId:(NSString *)fileId{
    ICAddContractController *icaddContractVC = [[ICAddContractController alloc]init];
    icaddContractVC.referenceId =fileId;
    icaddContractVC.state = @"";
    icaddContractVC.EditType = ADD_contractTypeInfo;
    if (isClient) {
        icaddContractVC.contractType = kClientType;
    }else{
        icaddContractVC.contractType = kLawyerType;
    }
    [[APToolObjc selectedNavigationController] pushViewController:icaddContractVC animated:YES];
}
//所有未读消息
+ (NSInteger)getUnReadCount{
    NSInteger numb = [[RCIMClient sharedRCIMClient] getUnreadCount:@[@(ConversationType_PRIVATE),@(ConversationType_SYSTEM)]];
    return numb;
}
//系统消息
+ (NSInteger)getUnReadSystemCount{
    NSInteger numb = [[RCIMClient sharedRCIMClient] getUnreadCount:@[@(ConversationType_SYSTEM)]];
    return numb;
}

//获取未读消息显示角标
+ (NSInteger)getIconBadgeNumber{
    NSInteger numb = [APToolObjc getUnReadCount];
    NSInteger systymCount = [APToolObjc getUnReadSystemCount];
    return numb - systymCount;
}
//清除当前登录用户消息
+ (void)clearMessageUnReadSystemCount{
    [[RCIMClient sharedRCIMClient] clearMessagesUnreadStatus:ConversationType_PRIVATE targetId:[APHttpManager manager].userInfo.userId];;
    [APHttpManager clearRongYunAllCount];
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}
+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        
        return nil;
        
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return dic;
    
}

#pragma mark == 视频压缩
+ (void)compressedVideoOtherMethodWithURL:(NSURL *)url compressionType:(NSString *)compressionType compressionResultPath:(CompressionSuccessBlock)resultPathBlock {
    
    NSString *resultPath;
    
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:url options:nil];
    
    NSArray *compatiblePresets = [AVAssetExportSession exportPresetsCompatibleWithAsset:avAsset];
    
    // 所支持的压缩格式中是否有 所选的压缩格式
    if ([compatiblePresets containsObject:compressionType]) {
        
        AVAssetExportSession *exportSession = [[AVAssetExportSession alloc] initWithAsset:avAsset presetName:compressionType];
        
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];//用时间给文件全名，以免重复，在测试的时候其实可以判断文件是否存在若存在，则删除，重新生成文件即可
        
        [formater setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
        
        NSFileManager *manager = [NSFileManager defaultManager];
        
        BOOL isExists = [manager fileExistsAtPath:CompressionVideoPaht];
        
        if (!isExists) {
            
            [manager createDirectoryAtPath:CompressionVideoPaht withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
        resultPath = [CompressionVideoPaht stringByAppendingPathComponent:[NSString stringWithFormat:@"outputJFVideo-%@.mov", [formater stringFromDate:[NSDate date]]]];
        
        NSLog(@"压缩文件路径 resultPath = %@",resultPath);
        
        exportSession.outputURL = [NSURL fileURLWithPath:resultPath];
        
        exportSession.outputFileType = AVFileTypeMPEG4;
        
        exportSession.shouldOptimizeForNetworkUse = YES;
        
        [exportSession exportAsynchronouslyWithCompletionHandler:^(void)
         
         {
             if (exportSession.status == AVAssetExportSessionStatusCompleted) {
                 
                 NSData *data = [NSData dataWithContentsOfFile:resultPath];
                 
                 float memorySize = (float)data.length / 1024 / 1024;
                 NSLog(@"视频压缩后大小 %f", memorySize);
                 
                 resultPathBlock (resultPath, memorySize);
                 
             } else {
                 
                 NSLog(@"压缩失败");
             }
             
         }];
        
    } else {
        
        //        NSLog(@"不支持 %@ 格式的压缩", compressionType);
    }
}
//视频上传
+ (void)uploadVoiceWithFileData:(NSData *)voiceData fileName:(NSString *)fileName success:(void(^)(id responseObject))success ProgressBlock:(void (^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))block failure:(void(^)(NSError *error))failure

{
    
    OSSPutObjectRequest * put = [OSSPutObjectRequest new];
    put.bucketName = ALI_BucketName;
    put.objectKey = fileName;
    put.uploadingData = voiceData;
    dispatch_semaphore_t semaphore = [APHttpManager getUploadVideoSemaphore];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    put.uploadProgress = ^(int64_t bytesSent, int64_t totalByteSent, int64_t totalBytesExpectedToSend) {
        NSLog(@"%lld, %lld, %lld", bytesSent, totalByteSent, totalBytesExpectedToSend);
        CGFloat current = totalByteSent / totalBytesExpectedToSend;
        if (current == 1) {
            dispatch_semaphore_signal(semaphore);
        }
        block(bytesSent,totalByteSent,totalBytesExpectedToSend);
    };
    OSSTask * putTask = [[APHttpManager manager].client putObject:put];
    [putTask waitUntilFinished]; // 阻塞直到上传完成
    if (!putTask.error) {
        NSString *endPoint = [ALI_EndPoint_PREFIX stringByAppendingFormat:@"%@.%@", ALI_BucketName, ALI_EndPoint];
        NSString *url = [endPoint stringByAppendingFormat:@"/%@", fileName];
        success(url);
    } else {
        failure(putTask.error);
    }
    
}
+(CGSize)calculationLabelWidthWithText:(NSString *)textStr labelFont:(UIFont *)font withLabelLeading:(CGFloat)leadingWidth{
    @try {
        if (textStr.length == 0) {
            return CGSizeMake(leadingWidth, 5);
        }
        NSMutableAttributedString *attibutesString = [[NSMutableAttributedString alloc]initWithString:textStr]; //model.content是文本
        NSMutableParagraphStyle *paraghStyle =[[NSMutableParagraphStyle alloc] init];
        [paraghStyle setLineSpacing:4];
        [attibutesString addAttribute:NSParagraphStyleAttributeName value:paraghStyle range:NSMakeRange(0, textStr.length)];
        //在这传进去字体和行距
        NSDictionary *attribute =@{NSFontAttributeName:font,NSParagraphStyleAttributeName:paraghStyle};
        CGSize vipTextSize = [textStr boundingRectWithSize:CGSizeMake(leadingWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
        return vipTextSize;
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}

//保存标签
+ (NSString *)getSaveICPerconLabelModelPath{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *vodieModelPath = [path stringByAppendingString:@"/ICPerconLabel.plist"];
    return vodieModelPath;
}
#pragma mark =========== 获取标签数据===============
+ (NSMutableArray *)getICPersonLabelInfoList{
    if ([APHttpManager manager].personLabelArray.count > 0) {
        return [APHttpManager manager].personLabelArray;
    }else{
        [[APHttpManager manager].personLabelArray removeAllObjects];
       NSMutableArray *labeLarray = [NSKeyedUnarchiver unarchiveObjectWithFile:[APToolObjc getSaveICPerconLabelModelPath]];
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"ICPersonLabel"]) {
            [[APHttpManager manager].personLabelArray addObjectsFromArray:labeLarray];
        }else{
            [APToolObjc savePersonLabelInfo];
        }
        return [APHttpManager manager].personLabelArray;
    }
 
}
#pragma mark =========== 获取标签数据===============
+ (void)savePersonLabelInfo{
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"ICPersonLabel.plist" withExtension:nil];
    NSArray *array = [NSArray arrayWithContentsOfURL:url];
    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[ICLabelTypeModel class] json:array];
    if ([APHttpManager manager].personLabelArray.count > 0) {
        [[APHttpManager manager].personLabelArray removeAllObjects];
    }
    [[APHttpManager manager].personLabelArray addObjectsFromArray:modelArray];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"ICPersonLabel"];
    [NSKeyedArchiver archiveRootObject:modelArray toFile:[APToolObjc getSaveICPerconLabelModelPath]];
}
#pragma mark =========== 删除标签组===============
+ (void)removePersonLabelTypGroupWith:(NSInteger)section{
    if ([APHttpManager manager].personLabelArray.count > 0) {
        [[APHttpManager manager].personLabelArray removeObjectAtIndex:section];
    }
    [NSKeyedArchiver archiveRootObject:[APHttpManager manager].personLabelArray toFile:[APToolObjc getSaveICPerconLabelModelPath]];
    
}
#pragma mark =========== 添加标签组===============
+(void)addPersonLabeGroupInfoListWith:(ICLabelTypeModel *)labelModel{
    [[APHttpManager manager].personLabelArray addObject:labelModel];
    [NSKeyedArchiver archiveRootObject:[APHttpManager manager].personLabelArray toFile:[APToolObjc getSaveICPerconLabelModelPath]];
}
#pragma mark ===========编辑标签组===============

+ (void)editPersonLabelGroupListWith:(ICLabelTypeModel *)labelModel With:(NSInteger)section{
    [[APHttpManager manager].personLabelArray replaceObjectAtIndex:section  withObject:labelModel];
    [NSKeyedArchiver archiveRootObject:[APHttpManager manager].personLabelArray toFile:[APToolObjc getSaveICPerconLabelModelPath]];
}
+ (NSString *)getICPersonLabelContentInfoWith:(ICLabelTypeModel *)model{
    
    NSString *content = @"";
    for (NSInteger i = 0; i < model.labelContentInfo.count ; i ++) {
        ICLabelContenInfoModel *iclabelModel = model.labelContentInfo[i];
        if (i == 0) {
            content = [NSString stringWithFormat:@"%@",iclabelModel.title];
        }else{
            content = [content stringByAppendingString:[NSString stringWithFormat:@" %@",iclabelModel.title]];
        }
    }
    return content;
}


@end
