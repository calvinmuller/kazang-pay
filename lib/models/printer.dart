class PrintRequest {
  int? bitmapImageResourceId;
  String? customerTrailer;
  String? fontName;
  String? heading;
  int? headingFontSize;
  int? imageWidth;
  int? imageXpos;
  int? normalFontSize;
  int? pageWidth;
  List<BasePrintCommand> printLineItems = [];
  ReceiptSectionEnum receiptSection;
  int? trailerFontSize;

  PrintRequest({
    this.bitmapImageResourceId,
    this.customerTrailer,
    this.fontName,
    this.heading,
    this.headingFontSize,
    this.imageWidth,
    this.imageXpos,
    this.normalFontSize,
    this.pageWidth,
    this.receiptSection = ReceiptSectionEnum.CUSTOMER,
    this.trailerFontSize,
  });

  Map<String, dynamic> toJson() =>
      {
        'bitmapImageResourceId': bitmapImageResourceId,
        'customerTrailer': customerTrailer,
        'fontName': fontName,
        'heading': heading,
        'headingFontSize': headingFontSize,
        'imageWidth': imageWidth,
        'imageXpos': imageXpos,
        'normalFontSize': normalFontSize,
        'pageWidth': pageWidth,
        'printLineItems': printLineItems.map((e) => e.toJson()).toList(),
        'receiptSection': receiptSection.name,
        'trailerFontSize': trailerFontSize,
      };
}

enum ReceiptSectionEnum {
  MERCHANT,
  CUSTOMER,
}

class BasePrintCommand {
  AlignmentEnum alignment;
  int lineSpacingAfterPrinting;
  PrintLineFormatEnum? printLineFormat;
  int xPosition;
  int yPosition;

  BasePrintCommand({
    this.alignment = AlignmentEnum.LEFT,
    required this.lineSpacingAfterPrinting,
    this.printLineFormat,
    required this.xPosition,
    required this.yPosition,
  });

  Map<String, dynamic> toJson() =>
      {
        'alignment': alignment.index.toString(),
        'lineSpacingAfterPrinting': lineSpacingAfterPrinting,
        'printLineFormat': printLineFormat,
        'xPosition': xPosition,
        'yPosition': yPosition,
      };
}

enum AlignmentEnum {
  LEFT,
  CENTER,
  RIGHT,
}

class PrintLineFormatEnum {
  static const SINGLE_ENTRY = 0;
  static const DOUBLE_ENTRY = 1;
  static const NEW_LINE = 2;
  static const IMAGE = 3;
  static const LINE = 4;
}

class NewLinePrintCommand extends BasePrintCommand {
  NewLinePrintCommand(): super(
    lineSpacingAfterPrinting: 0,
    xPosition: 20,
    yPosition: 0,
    alignment: AlignmentEnum.LEFT,
  );
}

class DoubleTextPrintCommand extends BasePrintCommand {
  bool bold;
  int fontSize;
  bool italic;
  String? leftAlignedValue;
  String? rightAlignedValue;

  DoubleTextPrintCommand({
    this.bold = false,
    required this.fontSize,
    this.italic = false,
    this.leftAlignedValue,
    this.rightAlignedValue,
  }) : super(
    lineSpacingAfterPrinting: 0,
    xPosition: 20,
    yPosition: 0,
    alignment: AlignmentEnum.LEFT,
  );

  @override
  Map<String, dynamic> toJson() =>
      {
        'bold': bold,
        'fontSize': fontSize,
        'italic': italic,
        'leftAlignedValue': leftAlignedValue,
        'rightAlignedValue': rightAlignedValue,
        ...super.toJson(),
      };
}

class SingleTextPrintCommand extends BasePrintCommand {
  bool bold;
  int? fontSize;
  bool isHeader;
  bool? isTrailer;
  bool italic;
  String? value;

  SingleTextPrintCommand({
    this.bold = false,
    this.fontSize = 25,
    this.isHeader = false,
    this.isTrailer,
    this.italic = false,
    this.value,
  }) : super(
    lineSpacingAfterPrinting: 0,
    xPosition: 20,
    yPosition: 0,
    alignment: AlignmentEnum.LEFT,
  );

  @override
  Map<String, dynamic> toJson() =>
      {
        'bold': bold,
        'fontSize': fontSize,
        'isHeader': isHeader,
        'isTrailer': isTrailer,
        'italic': italic,
        'value': value,
        ...super.toJson(),
      };
}
