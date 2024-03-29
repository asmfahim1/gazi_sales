// To parse this JSON data, do
//
//     final inventoryCountModel = inventoryCountModelFromJson(jsonString);

/*import 'dart:convert';

InventoryCountModel inventoryCountModelFromJson(String str) =>
    InventoryCountModel.fromJson(json.decode(str));

String inventoryCountModelToJson(InventoryCountModel data) =>
    json.encode(data.toJson());

class InventoryCountModel {
  InventoryCountModel({
    required required this.totalInventoryCount,
  });

  int totalInventoryCount;

  factory InventoryCountModel.fromJson(Map<String, dynamic> json) =>
      InventoryCountModel(
        totalInventoryCount: json["total_InventoryCount"] ?? ' ' ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "total_InventoryCount": totalInventoryCount,
      };
}

// To parse this JSON data, do
//
//     final purchaseCountModel = purchaseCountModelFromJson(jsonString);

PurchaseCountModel purchaseCountModelFromJson(String str) =>
    PurchaseCountModel.fromJson(json.decode(str));

String purchaseCountModelToJson(PurchaseCountModel data) =>
    json.encode(data.toJson());

class PurchaseCountModel {
  PurchaseCountModel({
    required required this.totalPurchaseCount,
  });

  int totalPurchaseCount;

  factory PurchaseCountModel.fromJson(Map<String, dynamic> json) =>
      PurchaseCountModel(
        totalPurchaseCount: json["total_PurchaseCount"] ?? ' ' ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "total_PurchaseCount": totalPurchaseCount,
      };
}*/

// To parse this JSON data, do
//
//     final inventoryCountModel = inventoryCountModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final totalAdminCount = totalAdminCountFromJson(jsonString);

import 'dart:convert';

TotalAdminCount totalAdminCountFromJson(String str) =>
    TotalAdminCount.fromJson(json.decode(str));

String totalAdminCountToJson(TotalAdminCount data) =>
    json.encode(data.toJson());

class TotalAdminCount {
  int accountsCount;
  int inventoryCount;
  int productionCount;
  int salesCount;
  int scmCount;

  TotalAdminCount({
    required this.accountsCount,
    required this.inventoryCount,
    required this.productionCount,
    required this.salesCount,
    required this.scmCount,
  });

  factory TotalAdminCount.fromJson(Map<String, dynamic> json) =>
      TotalAdminCount(
        accountsCount: json["Accounts_Count"],
        inventoryCount: json["Inventory_Count"],
        productionCount: json["Production_Count"],
        salesCount: json["Sales_Count"],
        scmCount: json["SCM_Count"],
      );

  Map<String, dynamic> toJson() => {
        "Accounts_Count": accountsCount,
        "Inventory_Count": inventoryCount,
        "Production_Count": productionCount,
        "Sales_Count": salesCount,
        "SCM_Count": scmCount,
      };
}

// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

InventoryModel inventoryModelFromJson(String str) =>
    InventoryModel.fromJson(json.decode(str));

String inventoryModelToJson(InventoryModel data) => json.encode(data.toJson());

class InventoryModel {
  int damageCount;
  int grnCount;
  int rrCount;
  int sqcCount;
  int srCount;
  int toCount;
  int stoCount;
  int depoDcCount;

  InventoryModel({
    required this.damageCount,
    required this.grnCount,
    required this.rrCount,
    required this.sqcCount,
    required this.srCount,
    required this.toCount,
    required this.stoCount,
    required this.depoDcCount,
  });

  factory InventoryModel.fromJson(Map<String, dynamic> json) => InventoryModel(
        damageCount: json["DamageCount"],
        grnCount: json["GRNCount"],
        rrCount: json["RRCount"],
        sqcCount: json["SQCCount"],
        srCount: json["SRCount"],
        toCount: json["TOCount"],
        stoCount: json["STOCount"],
        depoDcCount: json["DepoDC_Count"],
      );

  Map<String, dynamic> toJson() => {
        "DamageCount": damageCount,
        "GRNCount": grnCount,
        "RRCount": rrCount,
        "SQCCount": sqcCount,
        "SRCount": srCount,
        "TOCount": toCount,
        "STOCount": stoCount,
        "DepoDC_Count": depoDcCount,
      };
}

// To parse this JSON data, do
//
//     final purchaseCountModel = purchaseCountModelFromJson(jsonString);

PurchaseCountModel purchaseCountModelFromJson(String str) =>
    PurchaseCountModel.fromJson(json.decode(str));

String purchaseCountModelToJson(PurchaseCountModel data) =>
    json.encode(data.toJson());

class PurchaseCountModel {
  PurchaseCountModel({
    required this.poCount,
    required this.cashCount,
    required this.csCount,
    required this.pafCount,
    required this.padjCount,
  });

  int poCount;
  int cashCount;
  int csCount;
  int pafCount;
  int padjCount;

  factory PurchaseCountModel.fromJson(Map<String, dynamic> json) =>
      PurchaseCountModel(
        poCount: json["POCount"] ?? ' ',
        cashCount: json["CashCount"] ?? ' ',
        csCount: json["CSCount"] ?? ' ',
        pafCount: json["PAFCount"] ?? ' ',
        padjCount: json["PADJCount"] ?? ' ',
      );

  Map<String, dynamic> toJson() => {
        "POCount": poCount,
        "CashCount": cashCount,
        "CSCount": csCount,
        "PAFCount": pafCount,
        "PADJCount": padjCount,
      };
}

// To parse this JSON data, do
//
//     final legalCountCountModel = legalCountCountModelFromJson(jsonString);

LegalCountCountModel legalCountCountModelFromJson(String str) =>
    LegalCountCountModel.fromJson(json.decode(str));

String legalCountCountModelToJson(LegalCountCountModel data) =>
    json.encode(data.toJson());

class LegalCountCountModel {
  LegalCountCountModel({
    required this.landAdvCount,
    required this.advAdjCount,
    required this.legalActCount,
    required this.legalAdjCount,
    required this.otherMoneyCount,
  });

  int landAdvCount;
  int advAdjCount;
  int legalActCount;
  int legalAdjCount;
  int otherMoneyCount;

  factory LegalCountCountModel.fromJson(Map<String, dynamic> json) =>
      LegalCountCountModel(
        landAdvCount: json["LandAdvCount"] ?? 0,
        advAdjCount: json["advAdjCount"] ?? 0,
        legalActCount: json["LegalActCount"] ?? 0,
        legalAdjCount: json["LegalAdjCount"] ?? 0,
        otherMoneyCount: json["OtherMoneyCount"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "LandAdvCount": landAdvCount,
        "advAdjCount": advAdjCount,
        "LegalActCount": legalActCount,
        "LegalAdjCount": legalAdjCount,
        "OtherMoneyCount": otherMoneyCount,
      };
}

// To parse this JSON data, do
//
//     final hrCountModel = hrCountModelFromJson(jsonString);

HrCountModel hrCountModelFromJson(String str) =>
    HrCountModel.fromJson(json.decode(str));

String hrCountModelToJson(HrCountModel data) => json.encode(data.toJson());

class HrCountModel {
  HrCountModel({
    required this.absentCount,
    required this.leaveandTourCount,
    required this.earlyCount,
    required this.LateCount,
  });

  int absentCount;
  int leaveandTourCount;
  int earlyCount;
  int LateCount;

  factory HrCountModel.fromJson(Map<String, dynamic> json) => HrCountModel(
        absentCount: json["AbsentCount"] ?? 0,
        leaveandTourCount: json["LeaveandTourCount"] ?? 0,
        earlyCount: json["EarlyCount"] ?? 0,
        LateCount: json["LateCount"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "AbsentCount": absentCount,
        "LeaveandTourCount": leaveandTourCount,
        "EarlyCount": earlyCount,
        "LateCount": LateCount,
      };
}

// To parse this JSON data, do
//
//     final accounts = accountsFromJson(jsonString);

Accounts accountsFromJson(String str) => Accounts.fromJson(json.decode(str));

String accountsToJson(Accounts data) => json.encode(data.toJson());

class Accounts {
  int test;
  int apCount;
  int arCount;
  int billCount;
  int doCount;
  int iouCount;
  int loanAdjCount;
  int mrCount;
  int pettyCount;
  int PMCount;
  int VoucherCount;

  Accounts({
    required this.test,
    required this.apCount,
    required this.arCount,
    required this.billCount,
    required this.doCount,
    required this.iouCount,
    required this.loanAdjCount,
    required this.mrCount,
    required this.pettyCount,
    required this.PMCount,
    required this.VoucherCount,
  });

  factory Accounts.fromJson(Map<String, dynamic> json) => Accounts(
        test: json["test"],
        apCount: json["APCount"],
        arCount: json["ARCount"],
        billCount: json["BILLCount"],
        doCount: json["DOCount"],
        iouCount: json["IOUCount"],
        loanAdjCount: json["Loan_AdjCount"],
        mrCount: json["MRCount"],
        pettyCount: json["PettyCount"],
        PMCount: json["PMCount"],
        VoucherCount: json["VoucherCount"],
      );

  Map<String, dynamic> toJson() => {
        "test": test,
        "APCount": apCount,
        "ARCount": arCount,
        "BILLCount": billCount,
        "DOCount": doCount,
        "IOUCount": iouCount,
        "Loan_AdjCount": loanAdjCount,
        "MRCount": mrCount,
        "PettyCount": pettyCount,
        "PMCount": PMCount,
        "VoucherCount": VoucherCount,
      };
}

// To parse this JSON data, do
//
//     final productionModel = productionModelFromJson(jsonString);

ProductionModel productionModelFromJson(String str) =>
    ProductionModel.fromJson(json.decode(str));

String productionModelToJson(ProductionModel data) =>
    json.encode(data.toJson());

class ProductionModel {
  int bomCount;
  int batchCOunt;

  ProductionModel({
    required this.bomCount,
    required this.batchCOunt,
  });

  factory ProductionModel.fromJson(Map<String, dynamic> json) =>
      ProductionModel(
        bomCount: json["BOMCount"],
        batchCOunt: json["BatchCOunt"],
      );

  Map<String, dynamic> toJson() => {
        "BOMCount": bomCount,
        "BatchCOunt": batchCOunt,
      };
}

// To parse this JSON data, do
//
//     final scmmOdel = scmmOdelFromJson(jsonString);

ScmmOdel scmmOdelFromJson(String str) => ScmmOdel.fromJson(json.decode(str));

String scmmOdelToJson(ScmmOdel data) => json.encode(data.toJson());

class ScmmOdel {
  int padjCount;
  int cashAdvCount;
  int csCount;
  int poCount;
  int sprCount;

  ScmmOdel({
    required this.padjCount,
    required this.cashAdvCount,
    required this.csCount,
    required this.poCount,
    required this.sprCount,
  });

  factory ScmmOdel.fromJson(Map<String, dynamic> json) => ScmmOdel(
        padjCount: json["PADJ_Count"],
        cashAdvCount: json["Cash_Adv_Count"],
        csCount: json["CS_Count"],
        poCount: json["POCount"],
        sprCount: json["SPRCount"],
      );

  Map<String, dynamic> toJson() => {
        "PADJ_Count": padjCount,
        "Cash_Adv_Count": cashAdvCount,
        "CS_Count": csCount,
        "POCount": poCount,
        "SPRCount": sprCount,
      };
}

// To parse this JSON data, do
//
//     final salesMOdel = salesMOdelFromJson(jsonString);

SalesMOdel salesMOdelFromJson(String str) =>
    SalesMOdel.fromJson(json.decode(str));

String salesMOdelToJson(SalesMOdel data) => json.encode(data.toJson());

class SalesMOdel {
  int total;
  int dcCount;
  int depositCount;
  int soCount;
  int srCount;
  int ddcCount;

  SalesMOdel({
    required this.total,
    required this.dcCount,
    required this.depositCount,
    required this.soCount,
    required this.srCount,
    required this.ddcCount,
  });

  factory SalesMOdel.fromJson(Map<String, dynamic> json) => SalesMOdel(
        total: json["total"],
        dcCount: json["DC_Count"],
        depositCount: json["DepositCount"],
        soCount: json["SOCount"],
        srCount: json["SR_Count"],
        ddcCount: json["DDC_Count"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "DC_Count": dcCount,
        "DepositCount": depositCount,
        "SOCount": soCount,
        "SR_Count": srCount,
        "DDC_Count": ddcCount,
      };
}
