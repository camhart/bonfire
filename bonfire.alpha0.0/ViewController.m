//
//  ViewController.m
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/1/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import "ViewController.h"
#import "GCDAsyncSocket.h"
#import "SocketDelegate.h"
#import "Game.h"
#import <netinet/in.h>
#import "GameState.h"
#import "Utilities.h"
#import <Accounts/ACAccountType.h>
#import <Accounts/ACAccountStore.h>
#import <FacebookSDK/FacebookSDK.h>

@interface ViewController ()
@property (strong, nonatomic)Game* game;
@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
//    ACAccountStore* accountStore = [[ACAccountStore alloc] init];
//    ACAccount* facebookAccount = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
//    
//    [accountStore requestAccessToAccountsWithType:facebookAccount options:<#(NSDictionary *)#> completion:<#^(BOOL granted, NSError *error)completion#>]
//
//    [accountStore requestAccessToAccountsWithType:facebookAccount options:<#(NSDictionary *)#> completion:<#^(BOOL granted, NSError *error)completion#>]
    
    //[self setupFacebook];
    
    //get socket connecting...
    [self setupTextBoxDelegate];
    [self loadUserData];
    if(![[GameState sharedInstance] createConnection]) {
        NSLog(@"Issue connecting to host...");
    }
}

-(void)setupFacebook {
    NSArray* permission = [NSArray arrayWithObjects:@"email", nil];
    [FBSession openActiveSessionWithAllowLoginUI:YES];
    [FBSession openActiveSessionWithReadPermissions:permission allowLoginUI:YES completionHandler:
     ^(FBSession *session, FBSessionState status, NSError *error) {
         NSLog(@"cool...");
     }];
    
}

-(void)setupTextBoxDelegate {
    //self.theTextBox.delegate = self;
    self.usernameTF.delegate = self;
    self.passwordTF.delegate = self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

//-(BOOL) createListener {
//    NSError *err = nil;
//    uint16_t thePort = 1234;
//    
//    self.game = [[Game alloc] init];
//    
////    [self.game addObserver:self forKeyPath:@"curLabel" options:NSKeyValueObservingOptionNew context:NULL];
//    
//    self.sDelegate = [[SocketDelegate alloc] initWithGame:self.game];
//    self.cSocket = [[GCDAsyncSocket alloc] initWithDelegate:self.sDelegate delegateQueue:dispatch_get_main_queue()];
//    if(![self.cSocket connectToHost:@"192.168.2.14" onPort:thePort error:&err]) {
//        NSLog(@"Failed to connect %@", err);
//        return NO;
//    }
//    [self.cSocket readDataWithTimeout:-1 tag:0];
//    return YES;
//}

//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(instancetype)init {
//    self = [super init];
//    if(self) {
//        NSLog(@"socket and delegate created...");
//    } else {
//        NSLog(@"huh?");
//    }
//    return self;
//}

-(void)updateUI {
    if(self.isViewLoaded && self.view.window) {
        [self updateLabelText];
        [self updateLogin];
    }
}

-(void)updateLabelText {
    //dispatch_async(dispatch_get_main_queue(), ^{
        //self.theLabel.text = [self.game getCurrentLabel];
        [self.theLabel setText:[[[GameState sharedInstance] game] getCurrentLabel]];
        //[self.theLabel.text stringByString:[self.game getCurrentLabel]];
   // });
}

//- (IBAction)Button:(id)sender {
//    
//    NSData* data = [self.theTextBox.text dataUsingEncoding:NSUTF8StringEncoding];
//    [[[GameState sharedInstance] socket] writeData:data withTimeout:-1 tag:0];
//    
//    self.theTextBox.text = @"";
//    //NSLog(self.theTextBox.text);
//}

- (IBAction)joinGame:(id)sender {
    //[Sender send]
}

- (IBAction)loginUser:(id)sender {
    if((int)[self.usernameTF.text length] == 0 || (int)[self.passwordTF.text length] == 0) {
        [Utilities showAlert:@"Enter a username and password" andTitle:@"Invalid"];
        [self saveUserData];
    } else {
        [[[GameState sharedInstance] game] setUsername:self.usernameTF.text];
        [[[GameState sharedInstance] game] setPassword:self.usernameTF.text];
        [self updateLogin];
        [Sender sendLoginUser:self.usernameTF.text andPassword:self.passwordTF.text];
    }
}

-(void)updateLogin{
    //dispatch_async(dispatch_get_main_queue(), ^{
        if([GameState sharedInstance].loggedIn && self.usernameTF.enabled == YES) {
            [self.usernameTF setEnabled:NO];
            [self.usernameTF setBackgroundColor:[UIColor lightGrayColor]];
            [self.usernameTF setHidden:YES];
            [self.usernameTF setNeedsDisplay];
        
            [self.passwordTF setEnabled:NO];
            [self.passwordTF setBackgroundColor:[UIColor lightGrayColor]];
            [self.passwordTF setHidden:YES];
            [self.passwordTF setNeedsDisplay];
            
            [self.createButton setEnabled:NO];
            [self.createButton setHidden:YES];
            [self.createButton setNeedsDisplay];
        
            [self.loginButton setEnabled:NO];
            [self.loginButton setHidden:YES];
            [self.loginButton setNeedsDisplay];
        
            [self.usernameOL setHidden:YES];
            [self.usernameOL setNeedsDisplay];
        
            [self.passwordOL setHidden:YES];
            [self.passwordOL setNeedsDisplay];
        
            [self.joinGame setEnabled:YES];
            [self.joinGame setHidden:NO];
            [self.joinGame setNeedsDisplay];
        
            [self.createGame setEnabled:YES];
            [self.createGame setHidden:NO];
            [self.createButton setNeedsDisplay];
        
            [self.submitQuestion setEnabled:YES];
            [self.submitQuestion setHidden:NO];
            [self.submitQuestion setNeedsDisplay];
        }
    //});
        //[self.]
}

- (IBAction)createUser:(id)sender {
    if((int)[self.usernameTF.text length] == 0 || (int)[self.passwordTF.text length] == 0) {
        [Utilities showAlert:@"Enter a username and password" andTitle:@"Invalid"];
    } else {
        [Sender sendCreateUser:self.usernameTF.text andPassword:self.passwordTF.text];
        [[[GameState sharedInstance] game] setUsername:self.usernameTF.text];
        [[[GameState sharedInstance] game] setPassword:self.usernameTF.text];
        [self updateLogin];
        [self saveUserData];
    }
}

-(void)loadUserData{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    //dispatch_async(dispatch_get_main_queue(), ^{
        NSString* un = [defaults objectForKey:@"username"];
        if(un != nil) {
            NSString* pw = [defaults objectForKey:@"password"];
            [self.usernameTF setText:un];
            [self.passwordTF setText:pw];//still set these values so GameState can lock them in...
            [Sender sendLoginUser:un andPassword:pw];
        }
    //});
}

-(void)saveUserData{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.usernameTF.text forKey:@"username"];
    [defaults setObject:self.passwordTF.text forKey:@"password"];
    [defaults synchronize];
}

//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    //[[[GameState sharedInstance] game] setCurView:self];
//}
@end