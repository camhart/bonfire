//
//  ViewController.h
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/1/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIUpdater.h"

@interface ViewController : UIViewController <UITextFieldDelegate, UIUpdater>
@property (weak, nonatomic) IBOutlet UILabel *theLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameOL;
@property (weak, nonatomic) IBOutlet UILabel *passwordOL;
- (IBAction)joinGame:(id)sender;
- (IBAction)loginUser:(id)sender;
- (IBAction)createUser:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property(retain) IBOutlet UIButton* loginButton;
@property(retain) IBOutlet UIButton* createButton;
@property(retain) IBOutlet UIButton* joinGame;
@property(retain) IBOutlet UIButton* createGame;
@property(retain) IBOutlet UIButton* submitQuestion;
-(void)viewDidAppear:(BOOL)animated;
@end