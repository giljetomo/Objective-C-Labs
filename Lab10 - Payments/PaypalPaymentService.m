//
//  PaypalPaymentService.m
//  Lab10 - Payments
//
//  Created by Gil Jetomo on 2021-03-03.
//

#import "PaypalPaymentService.h"

@implementation PaypalPaymentService

- (void)processPaymentAmount:(float)amount {
  NSLog(@"Paypal processed an amount of $%.2f", amount);
}

- (BOOL)canProcessPayment {
  return arc4random_uniform(2);
}

- (NSString *)description
{
  return @"PayPal";
}
@end
