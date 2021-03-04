//
//  StripePaymentService.m
//  Lab10 - Payments
//
//  Created by Gil Jetomo on 2021-03-03.
//

#import "StripePaymentService.h"

@implementation StripePaymentService

- (void)processPaymentAmount:(float)amount {
  NSLog(@"Stripe processed an amount of $%.2f", amount);
}

- (BOOL)canProcessPayment {
  return arc4random_uniform(2);
}

- (NSString *)description
{
  return @"Stripe";
}

@end
