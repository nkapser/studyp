module ApplicationHelper
  
  def courses
[["COMPUTER SCIENCE & ENGINEERING", "CSE"], ["INFORMATION TECHNOLOGY", "INF"], ["ELECTRONICS & COMMUNICATION ENGINEERING", "ECE"], ["ELECTRICAL & ELECTRONICS ENGINEERING", "EEE"], ["MECHANICAL ENGINEERING", "MEC"], ["CIVIL ENGINEERING", "CIV"], ["CHEMICAL ENGINEERING", "CHE"], ["PRODUCTION / INDUSTRIAL PRODUCTION ENGINEERING", "IPE"], ["ELECTRONICS & INSTRUMENTATION ENGINEERING", "EIE"], ["METALLURGICAL ENGINEERING", "MET"], ["PHARMACY(M.P.C.Stream)", "PHM"], ["BIO-MEDICAL ENGINEERING", "BME"], ["CIVIL ENVIRONMENTAL ENGINEERING", "CEE"], ["NAVAL ARCHITECTURE AND MARINE ENGINEERING", "NMA"], ["ELECTRONICS & TELEMATICS", "ETM"], ["MINING ENGINEERING", "MIN"], ["FOOD PROCESSING TECHNOLOGY", "FPT"], ["TEXTILE TECHNOLOGY", "TEX"], ["COMPUTER SCIENCE & SYSTEMS ENGINEERING", "CSS"], ["METALLURGY AND MATERIAL TECHNOLOGY", "MMT"], ["ELECTRONICS AND CONTROL SYSTEMS ENGINEERING", "ECS"], ["CHEMICAL PETRO ENGINEERING", "CPE"], ["ELECTRONICS & COMPUTER ENGINEERING", "ECM"], ["INSTRUMENTATION ENGINEERING/TECHNOLOGY", "IST"], ["MECHANICAL (MECHATRONICS)ENGINEERING", "MCT"], ["AUTOMOBILE ENGINEERING", "AUT"], ["APPLIED ELECTRONICS & INSTRUMENTATION ENGINEERING", "AEI"], ["AERONAUTICAL ENGINEERING", "ANE"], ["BIO-TECHNOLOGY", "BIO"], ["INSTRUMENTATION & CONTROL ENGINEERING", "ICE"], ["CHEMICAL(CERAMIC)TECHNOLOGY", "CER"], ["GEO-INFORMATICS", "GIN"], ["PLANNING", "PLG"], ["PHARMACY  (Bi.P.C stream)", "PHB"], ["DAIRYING", "DRG"], ["FOOD SCIENCE", "FDS"], ["AGRICULTURAL ENGINEERING", "AGR"], ["COMMERCIAL AGRICULTURAL & BUSINESS MGMT.", "CAB"], ["BIO-TECHNOLOGY (B.P C.STREAM)", "BTB"], ["DIGITAL TECHNIQUES FOR DESIGN AND PLANNING", "DTD"], ["FACILITIES AND SERVICES PLANNING", "FSP"], ["PHARM.D ( M P C STREAM)", "PHD"], ["PHARM.D ( B P C STREAM)", "PDB"], ["PETROLEUM TECHNOLOGY", "PET"], ["MINING MACHINERY ENGINEERING", "MME"]] 
  end
  
  def page_title
    @pagetitle = @title || "Eamcet Colleges - #{controller_name}"
  end

end