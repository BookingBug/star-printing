//
//  PrintTextFormatter.m
//  StarPrinting
//
//  Created by Matthew Newberry on 4/11/13.
//  OpenTable
//

#import "PrintTextFormatter.h"

@interface PrintTextFormatter ()

@property (nonatomic, strong) NSMutableData *commands;

@end

@implementation PrintTextFormatter

#pragma mark - Initialization

+ (PrintTextFormatter *)formatter
{
    PrintTextFormatter *formatter = [[PrintTextFormatter alloc] init];
    return formatter;
}

- (id)init
{
    self = [super init];
    if(self) {
        self.commands = [NSMutableData data];
        [self add:kPrinterCMD_HorizTab];
    }
    return self;
}

#pragma mark - Commands

- (void)tab
{
    [self add:kPrinterCMD_Tab];
}

- (void)newline
{
    [self add:kPrinterCMD_Newline];
}

- (void)dashedNewLine
{
    [self add:@"\r\n------------------------------------------------\r\n"];
}

#pragma mark - Text Formatting

- (void)bold:(NSString *)text next:(PrintTextFormatterBlock)block
{
    [self add:kPrinterCMD_StartBold];
    [self add:text];
    [self add:kPrinterCMD_EndBold];
    
    if(block) {
        block(text);
    }
}

- (void)underline:(NSString *)text next:(PrintTextFormatterBlock)block
{
    [self add:kPrinterCMD_StartUnderline];
    [self add:text];
    [self add:kPrinterCMD_EndUnderline];
    
    if(block) {
        block(text);
    }
}

- (void)upperline:(NSString *)text next:(PrintTextFormatterBlock)block
{
    [self add:kPrinterCMD_StartUpperline];
    [self add:text];
    [self add:kPrinterCMD_EndUpperline];
    
    if(block) {
        block(text);
    }
}

- (void)large:(NSString *)text next:(PrintTextFormatterBlock)block
{
    [self add:kPrinterCMD_StartDoubleHW];
    [self add:text];
    [self add:kPrinterCMD_EndDoubleHW];
    
    if(block) {
        block(text);
    }
}

- (void)invertColor:(NSString *)text next:(PrintTextFormatterBlock)block
{
    [self add:kPrinterCMD_StartInvertColor];
    [self add:text];
    [self add:kPrinterCMD_EndInvertColor];
    
    if(block) {
        block(text);
    }
}


#pragma mark - Text Alignment

- (void)alignLeft:(PrintTextFormatterBlock)block
{
    [self add:kPrinterCMD_AlignLeft];
}

- (void)alignRight:(PrintTextFormatterBlock)block
{
    [self add:kPrinterCMD_AlignRight];
}

- (void)alignCenter:(PrintTextFormatterBlock)block
{
    [self add:kPrinterCMD_AlignCenter];
}


#pragma mark - Barcodes

- (void)barcode:(NSString *)text type:(PrinterBarcodeType)type
{
    unsigned char typeByte[] = {type};
    NSString *typeString = [[NSString alloc] initWithBytes:typeByte length:1 encoding:NSASCIIStringEncoding];
    
    [self add:[NSString stringWithFormat:kPrinterCMD_StartBarcode, typeString]];
    [self add:text];
    [self add:kPrinterCMD_EndBarcode];
}

- (void)pdf417:(NSString *)text
{
    unsigned char length[] = {0x00, 0x00};
    length[0] = text.length % 256;
    length[1] = text.length / 256;
    
    [self add:kPrinterCMD_StartPDF417];
    [self add:[[NSString alloc] initWithBytes:length length:2 encoding:NSASCIIStringEncoding]];
    [self add:text];
    [self add:kPrinterCMD_EndPDF417];
}

- (void)qr:(NSString *)text
{
    unsigned char length[] = {0x00, 0x00};
    length[0] = text.length % 256;
    length[1] = text.length / 256;
    
    [self add:kPrinterCMD_StartQR];
    [self add:[[NSString alloc] initWithBytes:length length:2 encoding:NSASCIIStringEncoding]];
    [self add:text];
    [self add:kPrinterCMD_EndQR];
}


#pragma mark - Helpers

- (NSData *)formattedData
{
    return _commands;
}

- (void)add:(NSString *)text
{
    [_commands appendData:[text dataUsingEncoding:NSASCIIStringEncoding]];
}

- (void)addRawData:(NSData *)data
{
    [_commands appendData:data];
}

@end
