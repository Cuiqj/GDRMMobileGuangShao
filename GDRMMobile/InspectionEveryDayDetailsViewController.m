//
//  InspectionEveryDayDetailsViewController.m
//  GDRMGUANGSHAOMobile
//
//  Created by admin on 2019/5/13.
//

#import "InspectionEveryDayDetailsViewController.h"
#import "Inspection_Main.h"


@interface InspectionEveryDayDetailsViewController ()

@property (nonatomic,retain) Inspection_Main * inspectionmain;

@property (nonatomic,strong) UIPopoverController *pickerPopover;
@property (nonatomic, assign) int textFieldTag;
@end

@implementation InspectionEveryDayDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mineScrollview.contentSize = CGSizeMake(1024, 642);
    
    self.reportertextfield.tag = 111;  //统计人
    self.reportertextfield.delegate = self;
    self.reporter_sign_datetextfield.tag = 112;  //统计人签名日期
    self.reporter_sign_datetextfield.delegate = self;
    
    self.inspection_principaltextfield.tag =113;        //巡查负责人
    self.inspection_principaltextfield.delegate = self;
    self.inspection_principal_sign_datetextfield.tag = 114;         //巡查负责人签名日期
    self.inspection_principal_sign_datetextfield.delegate = self;
    
    self.reporter_contenttextview.delegate =self;
    self.inspection_principal_contenttextview.delegate = self;
    self.notetextview.delegate = self;
    
    [self initDataAndView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(keyboardWillHide:)  name:UIKeyboardWillHideNotification object:nil];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)initDataAndView{
    NSDate * detailDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"detaildate"];
    NSDateFormatter * dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setLocale:[NSLocale currentLocale]];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    self.date_inspectiontextfield.text = [dateformatter stringFromDate:detailDate];
    self.date_inspectiontextfield.enabled = NO;
    
    self.inspectionmain = [Inspection_Main inspection_mainFordate:detailDate];
    self.inspection_miletextfield.text = self.inspectionmain.inspection_mile;
    self.inspection_man_numtextfield.text = self.inspectionmain.inspection_man_num;
    self.accident_numtextfield.text = self.inspectionmain.accident_num;
    self.deal_accident_numtextfield.text = self.inspectionmain.deal_accident_num;
    self.deal_bxlp_numtextfield.text = self.inspectionmain.deal_bxlp_num;
    self.fxqxtextfield.text = self.inspectionmain.fxqx;
    self.fxwfxwtextfield.text = self.inspectionmain.fxwfxw;
    self.jzwfxwtextfield.text = self.inspectionmain.jzwfxw;
    self.cllmzawtextfield.text = self.inspectionmain.cllmzaw;
    self.bzgzctextfield.text = self.inspectionmain.bzgzc;
    self.jcsgdtextfield.text = self.inspectionmain.jcsgd;
    self.gzzfjtextfield.text = self.inspectionmain.gzzfj;
    self.fcflwstextfield.text = self.inspectionmain.fcflws;
    self.qlxrtextfield.text = self.inspectionmain.qlxr;
    
    self.reporter_contenttextview.text = self.inspectionmain.reporter_content;
    self.inspection_principal_contenttextview.text = self.inspectionmain.inspection_principal_content;
    self.notetextview.text = self.inspectionmain.note;
    
    self.reportertextfield.text = self.inspectionmain.reporter;
    self.reporter_sign_datetextfield.text = [dateformatter stringFromDate:self.inspectionmain.reporter_sign_date];
    self.inspection_principaltextfield.text = self.inspectionmain.inspection_principal;
    self.inspection_principal_sign_datetextfield.text = [dateformatter stringFromDate:self.inspectionmain.inspection_principal_sign_date];
}
- (void)keyboardWillShow:(NSNotification *)aNotification{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
//    int width = keyboardRect.size.width;
//    self.mineScrollview.contentOffset = CGPointMake(0, height-20);
    self.mineScrollview.frame = CGRectMake(0, 0, 1024, self.view.frame.size.height-height);
}
- (void)keyboardWillHide:(NSNotification *)aNotification{
    self.mineScrollview.frame = CGRectMake(0, 0, 1024, 640);
}



- (void)btnSaveData{
    self.inspectionmain.inspection_mile = self.inspection_miletextfield.text;  //当日巡查里程
    self.inspectionmain.inspection_man_num = self.inspection_man_numtextfield.text;     //当日参加巡查人次
    self.inspectionmain.accident_num = self.accident_numtextfield.text;  //发生交通事故/其中涉及路产损害
    self.inspectionmain.deal_accident_num = self.deal_accident_numtextfield.text;   //处理路产损害赔偿
    self.inspectionmain.deal_bxlp_num = self.deal_bxlp_numtextfield.text;     //处理路产保险理赔案件
    self.inspectionmain.fxqx = self.fxqxtextfield.text;  //发现报送道路、交安设施缺陷
    self.inspectionmain.fxwfxw = self.fxwfxwtextfield.text;  //发现违法行为
    self.inspectionmain.jzwfxw = self.jzwfxwtextfield.text;    //纠正违法行为
    self.inspectionmain.cllmzaw = self.cllmzawtextfield.text;    //处理路面障碍物
    self.inspectionmain.bzgzc = self.bzgzctextfield.text;   //帮助故障车
    self.inspectionmain.jcsgd = self.jcsgdtextfield.text;   //施工检查点/纠正违反公路施工安全作业规程行为
    self.inspectionmain.gzzfj = self.gzzfjtextfield.text;  //告知交通综合行政执法局处理案件
    self.inspectionmain.fcflws = self.fcflwstextfield.text;   //发出法律文书
    self.inspectionmain.qlxr = self.qlxrtextfield.text;   //劝离行人
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    self.inspectionmain.reporter = self.reportertextfield.text;         //统计人
    self.inspectionmain.reporter_content = self.reporter_contenttextview.text;      //统计人意见
    self.inspectionmain.reporter_sign_date = [dateFormatter dateFromString:self.reporter_sign_datetextfield.text];      //签名日期
    self.inspectionmain.inspection_principal = self.inspection_principaltextfield.text;     //巡查人
    self.inspectionmain.inspection_principal_content = self.inspection_principal_contenttextview.text;     //巡查人意见
    self.inspectionmain.inspection_principal_sign_date = [dateFormatter dateFromString:self.inspection_principal_sign_datetextfield.text];      //签名日期
    
    self.inspectionmain.note = self.notetextview.text;     //备注栏
}
- (void)btnDeleteData{
    self.inspection_miletextfield.text = nil;  //当日巡查里程
    self.inspection_man_numtextfield.text = nil;  //当日参加巡查人次
    self.accident_numtextfield.text = nil;     //发生交通事故/其中涉及路产
    self.deal_accident_numtextfield.text = nil;    //处理路产损害赔偿
    self.deal_bxlp_numtextfield.text = nil;     //处理路产保险理赔案件
    self.fxqxtextfield.text = nil;    //发现报送道路、交安设施缺陷
    self.fxwfxwtextfield.text = nil;    //发现违法行为
    self.jzwfxwtextfield.text = nil;    //纠正违法行为
    self.cllmzawtextfield.text = nil;     //处理路面障碍物
    self.bzgzctextfield.text = nil;    //帮助故障车
    self.jcsgdtextfield.text = nil;   //施工检查点/纠正违反公路施工安全作业规程
    self.gzzfjtextfield.text = nil;  //告知交通综合行政执法局处理案件
    self.fcflwstextfield.text = nil;   //发出法律文书
    self.qlxrtextfield.text = nil;  //劝离行人
    self.reporter_contenttextview.text = nil;    //统计人意见
    self.inspection_principal_contenttextview.text = nil;    //路政负
    self.notetextview.text = nil;    //备注栏
    self.reportertextfield.text = nil;     //统计人
    self.reporter_sign_datetextfield.text = nil;    //统计人签字日期
    self.inspection_principaltextfield.text = nil;    //路政负责人
    self.inspection_principal_sign_datetextfield.text = nil;    //路政负责人签字日期
}


- (IBAction)btnSaveDataClick:(id)sender {
    NSDate * detailDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"detaildate"];
    if (detailDate) {
        self.inspectionmain = [Inspection_Main inspection_mainFordate:detailDate];
        if (!self.inspectionmain) {
            self.inspectionmain = [Inspection_Main newDataObjectWithEntityName:@"Inspection_Main"];
            self.inspectionmain.date_inspection = detailDate;
        }
        [self btnSaveData];
        [[AppDelegate App] saveContext];
    }
}
- (IBAction)btnDeleteDataClick:(id)sender {
    NSDate * detailDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"detaildate"];
    if (detailDate){
        self.inspectionmain = [Inspection_Main inspection_mainFordate:detailDate];
        if (self.inspectionmain){
            NSManagedObjectContext *context=[[AppDelegate App] managedObjectContext];
            [context deleteObject:self.inspectionmain];
            [[AppDelegate App] saveContext];
        }
    }
    [self btnDeleteData];
}

//选择统计人  或者 巡查负责人
- (IBAction)userSelectedClick:(id)sender {
    UITextField * textfielduser = (UITextField *)sender;
    self.textFieldTag = textfielduser.tag;
    if ([self.pickerPopover isPopoverVisible]) {
        [self.pickerPopover dismissPopoverAnimated:YES];
    } else {
        UserPickerViewController *acPicker=[[UserPickerViewController alloc] init];
        acPicker.delegate = self;
        self.pickerPopover=[[UIPopoverController alloc] initWithContentViewController:acPicker];
        [self.pickerPopover setPopoverContentSize:CGSizeMake(140, 200)];
        [self.pickerPopover presentPopoverFromRect:textfielduser.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        acPicker.pickerPopover=self.pickerPopover;
    }
}
//选择签名日期
- (IBAction)dateSelectedClick:(id)sender {
    UITextField * textfielduser = (UITextField *)sender;
    self.textFieldTag = textfielduser.tag;
    if ([self.pickerPopover isPopoverVisible]) {
        [self.pickerPopover dismissPopoverAnimated:YES];
    } else {
        DateSelectController *dsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"datePicker"];
        dsVC.delegate = self;
        dsVC.pickerType = 0;
        self.pickerPopover = [[UIPopoverController alloc] initWithContentViewController:dsVC];
        [self.pickerPopover presentPopoverFromRect:textfielduser.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        dsVC.dateselectPopover = self.pickerPopover;
    }
}
- (void)setUser:(NSString *)name andUserID:(NSString *)userID{
    if (self.textFieldTag == 113) {
        self.inspection_principaltextfield.text = name;
        self.inspectionmain.inspection_principal = name;
    }else if(self.textFieldTag == 111){
        self.reportertextfield.text = name;
        self.inspectionmain.reporter= name;
    }
}
-(void)setDate:(NSString *)date{
    NSDateFormatter * dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setLocale:[NSLocale currentLocale]];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    if (self.textFieldTag == 112) {
        self.inspectionmain.reporter_sign_date = [dateformatter dateFromString:date];
        self.reporter_sign_datetextfield.text = date;
    }else if(self.textFieldTag == 114){
        self.inspectionmain.inspection_principal_sign_date = [dateformatter dateFromString:date];
        self.inspection_principal_sign_datetextfield.text = date;
    }
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField.tag == 111 || textField.tag == 112 || textField.tag == 113 || textField.tag == 114) {
        return NO;
    }
    return YES;
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    if (textView == self.reporter_contenttextview) {
        self.mineScrollview.contentOffset = CGPointMake(0,230);
    }else if ( textView == self.inspection_principal_contenttextview){
        self.mineScrollview.contentOffset = CGPointMake(0,350);
    }else if (textView == self.notetextview){
        self.mineScrollview.contentOffset = CGPointMake(0,350);
    }
    return YES;
}


@end
