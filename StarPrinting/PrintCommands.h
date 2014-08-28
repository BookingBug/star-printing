//
//  PrinterCommands.h
//  StarPrinting
//
//  Created by Matthew Newberry on 4/11/13.
//  OpenTable
//

typedef enum PrinterBarcodeType
{
    PrinterBarcodeTypeUPCE,
    PrinterBarcodeTypeUPCA,
    PrinterBarcodeTypeEAN8,
    PrinterBarcodeTypeEAN13,
    PrinterBarcodeTypeCode39,
    PrinterBarcodeTypeITF,
    PrinterBarcodeTypeCode128,
    PrinterBarcodeTypeCode93,
    PrinterBarcodeTypeNW7
} PrinterBarcodeType;

#define kPrinterCMD_Tab                 @"\x09"
#define kPrinterCMD_Newline             @"\x0A"

// Alignment
#define kPrinterCMD_AlignCenter         @"\x1b\x1d\x61\x01"
#define kPrinterCMD_AlignLeft           @"\x1b\x1d\x61\x00"
#define kPrinterCMD_AlignRight          @"\x1b\x1d\x61\x02"
#define kPrinterCMD_HorizTab            @"\x1b\x44\x02\x10\x22\x00"


// Text Formatting
#define kPrinterCMD_StartBold           @"\x1b\x45"
#define kPrinterCMD_EndBold             @"\x1b\x46"
#define kPrinterCMD_StartUnderline      @"\x1b\x2d\x01"
#define kPrinterCMD_EndUnderline        @"\x1b\x2d\x00"
#define kPrinterCMD_StartUpperline      @"\x1b\x5f\x01"
#define kPrinterCMD_EndUpperline        @"\x1b\x5f\x00"

#define kPrinterCMD_StartDoubleHW       @"\x1b\x69\x01\x01"
#define kPrinterCMD_EndDoubleHW         @"\x1b\x69\x00\x00"

#define kPrinterCMD_StartInvertColor    @"\x1b\x34"
#define kPrinterCMD_EndInvertColor      @"\x1b\x35"


// Cutting
#define kPrinterCMD_CutFull             @"\x1b\x64\x02"
#define kPrinterCMD_CutPartial          @"\x1b\x64\x03"


// Drawer
#define kPrinterCMD_OpenDrawer          @"\x07"


// Barcode - decimal placeholder takes barcode type
#define kPrinterCMD_StartBarcode        @"\x1b\x62" "%d\x32\x31\x7f"
#define kPrinterCMD_EndBarcode          @"\x1e\r\n"


// PDF417
/* Start PDF-417 Command Ordering
   ------------------------------
 
 1. Barcode Size (set to 1x1 using limits)
 2. Security Level (set to 0)
 3. Module X Direction Size (set to 4)
 4. Module Aspect Ratio (set to 2)
 5. Data prefix
 */

#define kPrinterCMD_StartPDF417         @"\x1b\x1d\x78\x53\x30\x01\x01\x02" \
                                        "\x1b\x1d\x78\x53\x31\x00" \
                                        "\x1b\x1d\x78\x53\x32\x04" \
                                        "\x1b\x1d\x78\x53\x33\x02" \
                                        "\x1b\x1d\x78\x44"
#define kPrinterCMD_EndPDF417           @"\x1b\x1d\x78\x50\r\n"


// QR
/* Start QR Command Ordering
   -------------------------
 
 1. Model # (set to 1)
 2. Correction Level (set to 0)
 3. Cell Size (set to 4)
 4. Data prefix
 */

#define kPrinterCMD_StartQR             @"\x1b\x1d\x79\x53\x30\x02" \
                                        "\x1b\x1d\x79\x53\x31\x03" \
                                        "\x1b\x1d\x79\x53\x32\x06" \
                                        "\x1b\x1d\x79\x44\x31\x00"
#define kPrinterCMD_EndQR               @"\x1b\x1d\x79\x50\r\n"
