//
//  ViewController.m
//  RestoApp
//
//  Created by Ludovic Ollagnier on 09/03/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

#import "ViewController.h"
#import "Restaurant.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *styleTextField;
@property (weak, nonatomic) IBOutlet UISwitch *visitedSwitch;
@property (weak, nonatomic) IBOutlet UISlider *gradeSlider;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)visitedSwitchChanged:(UISwitch *)sender {

    self.gradeSlider.enabled = sender.on;
}

- (IBAction)saveRestaurant:(id)sender {

    if (self.nameTextField.text.length < 2) {
        return;
    }
    
    Restaurant *resto = [[Restaurant alloc] init];
    resto.name = self.nameTextField.text;
    resto.address = self.addressTextField.text;
    resto.style = self.styleTextField.text;
    resto.visited = self.visitedSwitch.on;
    resto.visited ? (resto.grade = self.gradeSlider.value) : (resto.grade = -1);
}
@end
