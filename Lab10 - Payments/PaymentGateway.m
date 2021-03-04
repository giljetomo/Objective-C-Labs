//
//  PaymentGateway.m
//  Lab10 - Payments
//
//  Created by Gil Jetomo on 2021-03-03.
//

#import "PaymentGateway.h"

@implementation PaymentGateway

- (void)processPaymentAmount:(float) amount {
  if([self.delegate canProcessPayment]) {
    [self.delegate processPaymentAmount:amount];
  } else {
    NSLog(@"Sorry, %@ is currently unable to process your payment.", self.delegate.description);
  }
}
@end
