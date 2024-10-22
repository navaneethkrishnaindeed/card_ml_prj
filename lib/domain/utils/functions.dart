import '../models/scanned_document_model.dart';



BlockEntity classifyText(String inputText) {
  final companySuffixes = [
    'Inc.',
    'Ltd.',
    'LLC',
    'Corp.',
    'Corporation',
    'Company',
    'Co.',
    'Pvt.',
    'AG',
    'GmbH',
    'S.A.',
    'PLC',
    'Limited',
    'Incorporated',
    'Holdings',
    'Partners',
    'Group',
    'Association',
    'SAS',
    'S.p.A',
    'Oy',
    'K.K.',
    'S.A.R.L.',
    'BV',
    'NV',
    'S.C.',
    'AS',
    'AB',
    'SA',
    'A/S',
    'Sp.z o.o.',
  ];
  final businessKeywords = [
    'Technologies',
    'Solutions',
    'Industries',
    'Services',
    'Consulting',
    'Systems',
    'Global',
    'Network',
    'Resources',
    'Logistics',
    'Manufacturing',
    'Enterprises',
    'Ventures',
    'Software',
    'Hardware',
    'Engineering',
    'Digital',
    'Analytics',
    'Marketing',
    'Communications',
    'Finance',
    'Investments',
    'Construction',
    'Healthcare',
    'Media',
    'Education',
    'Real Estate',
    'Energy',
    'Automotive',
    'Pharmaceuticals',
    'Biotech',
    'Telecommunications',
    'Retail',
    'Wholesale',
    'Insurance',
    'Banking',
    'Hospitality',
    'Tourism',
    'Transportation',
    'Aerospace',
    'Defense',
    'Technology',
    'Development',
    'Research',
    'Consultancy',
    'Foods',
    'Beverages',
    'Entertainment',
    'Fashion',
    'Apparel',
    'Cosmetics',
    'Beauty',
    'Publishing',
    'Security',
    'Electronics',
    'Metals',
    'Mining',
    'BUSINESS'
  ];

  final emailPattern = RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$');
  final phonePattern = RegExp(r'^\+?[\d\s\-()]{7,}$');

  if (emailPattern.hasMatch(inputText)) {
    return  BlockEntity(type:  EntityType.email,data: inputText);
  }

  if (phonePattern.hasMatch(inputText)) {
    return  BlockEntity(type:  EntityType.phone,data: inputText);
  }

if (companySuffixes.any((suffix) => inputText.toLowerCase().contains(suffix.toLowerCase())) || 
    businessKeywords.any((keyword) => inputText.toLowerCase().contains(keyword.toLowerCase())))   {
    return  BlockEntity(type:  EntityType.company,data: inputText);
  }

  if (inputText.trim().split(' ').length == 2) {
    return  BlockEntity(type:  EntityType.name,data: inputText);
  }

    return  BlockEntity(type:  EntityType.unknown,data: inputText);
}


