#import <UIKit/UIKit.h>
#import <objc/runtime.h>

// Khai báo thông tin như bạn yêu cầu
#define AUTHOR @"TrNhan"
#define VERSION @"1.0.1"

// Hook vào một class phổ biến để hiển thị UI Liquid Glass (ví dụ: SpringBoard hoặc App chính)
%hook UIViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig;

    // Kiểm tra nếu view này đã có giao diện của TrNhan chưa để tránh tạo trùng
    if (![self.view viewWithTag:2024]) {
        
        // 1. Tạo hiệu ứng Liquid Glass bằng MaterialView (Cực mượt, không lag)
        UIView *glassView;
        if (NSClassFromString(@"MTMaterialView")) {
            // Sử dụng hàm nội bộ của Apple để lấy hiệu ứng kính chuẩn nhất
            id materialView = [objc_getClass("MTMaterialView") materialViewWithRecipe:1 configuration:1];
            glassView = (UIView *)materialView;
        } else {
            // Backup cho các bản iOS thấp hơn nếu không có MTMaterialView
            glassView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterial]];
        }

        // 2. Thiết lập kích thước và giao diện
        glassView.frame = CGRectMake(20, 50, 150, 60); // Vị trí mẫu của Widget
        glassView.layer.cornerRadius = 20;
        glassView.layer.masksToBounds = YES;
        glassView.layer.borderWidth = 0.5;
        glassView.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3].CGColor;
        glassView.tag = 2024;
        glassView.alpha = 0.9;

        // 3. Thêm Text Author & Version
        UILabel *label = [[UILabel alloc] initWithFrame:glassView.bounds];
        label.text = [NSString stringWithFormat:@"%@ v%@", AUTHOR, VERSION];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        label.textColor = [UIColor whiteColor];
        
        [glassView addSubview:label];
        [self.view addSubview:glassView];
        
        // Hiệu ứng xuất hiện mượt mà (Liquid feel)
        glassView.transform = CGAffineTransformMakeScale(0.8, 0.8);
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:0 animations:^{
            glassView.transform = CGAffineTransformIdentity;
        } completion:nil];
    }
}

%end
