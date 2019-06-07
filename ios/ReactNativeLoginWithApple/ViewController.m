//
//  ViewController.m
//  LoginWithApple
//
//  Created by PRAMOD_PUNCHH on 05/06/19.
//  Copyright © 2019 PRAMOD. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <AuthenticationServices/AuthenticationServices.h>

@interface ViewController ()<ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
//    ASAuthorizationAppleIDButton *button = [ASAuthorizationAppleIDButton new];
//    [button addTarget:self action:@selector(loginWithApplePressedManual) forControlEvents:UIControlEventTouchUpInside];
//    button.frame = CGRectMake(50, 200, 200, 100);
//
//    [self.view addSubview:button];

//    ASAuthorizationAppleIDProvider *appleIDProvider = [[ASAuthorizationAppleIDProvider alloc]init];
//    ASAuthorizationAppleIDRequest *appleIdRequest = [appleIDProvider createRequest];
//
//    ASAuthorizationPasswordProvider *applePasswordProvider = [[ASAuthorizationPasswordProvider alloc]init];
//    ASAuthorizationPasswordRequest *passwordRequest = [applePasswordProvider createRequest];
//
//
//    // Create an authorization controller with the given requests.
//    ASAuthorizationController *authorizationController = [[ASAuthorizationController alloc]initWithAuthorizationRequests:@[appleIdRequest,passwordRequest]];
//    authorizationController.delegate = self;
//    authorizationController.presentationContextProvider = self;
//    [authorizationController performRequests];
}

- (IBAction)loginWithApplePressed:(id)sender {
    [self initiateLoginProcess];
}

- (void)loginWithApplePressedManual{
    [self initiateLoginProcess];
}

- (void)initiateLoginProcess {
    ASAuthorizationAppleIDProvider *appleIDProvider = [[ASAuthorizationAppleIDProvider alloc]init];
    ASAuthorizationAppleIDRequest *request = [appleIDProvider createRequest];
    request.requestedScopes = @[ASAuthorizationScopeFullName, ASAuthorizationScopeEmail];
    
    ASAuthorizationController *authorizationController = [[ASAuthorizationController alloc]initWithAuthorizationRequests:@[request]];
    
    authorizationController.delegate = self;
    authorizationController.presentationContextProvider = self;
    [authorizationController performRequests];
}

#pragma Authorization Delegates

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization {
    NSLog(@"%@",authorization);
}

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error {
    NSLog(@"%@",error);
}

#pragma PresentationAnchorForAuthorizationController Delegate

-(ASPresentationAnchor)presentationAnchorForAuthorizationController:(ASAuthorizationController *)controller {
    return  [[UIApplication sharedApplication]delegate].window;
}


@end
