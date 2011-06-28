module ApplicationHelper

  def regions
    @regions ||= {"AU" => "Andhra Region", "OU" => "Osmania Region", "SVU" => "Sri Venkateswara Region"}
    @regions.keys
  end

  def districts
    @districts ||= { :vsp => "Vishakhapatnam",:hyd => "Hyderabad",:kdp => "Kadapa",:wgl => "Warangal",:pks => "Prakasam",:rr  => "Ranga Reddy",:eg  => "East Godavari",:ctr => "Chittoor",:khm => "Khammam",:skl => "Srikakulam",:nlg => "Nalgonda",:nlr => "Nellore",:wg  => "West Godavari",:gtr => "Guntur",:knl => "Kurnool",:kri => "Krishna",:atp => "Anantapur",:adb => "Adilabad",:vzm => "Vizia Nagaram",:krm => "Karim Nagar",:med => "Medak",:nzb => "Nizamabad",:mbn => "Mahaboob Nagar" }
    @districts.keys
  end

  def minority
    @minority ||= { :na => "Non-Minority", :chr => "Christian Minority", :mus => "Muslim Minority"}
    # @minority.values_at(type.downcase.to_sym)
    @minority.keys
  end

  def coed
    @coed ||= { "COED" => "Co-Education", "GIRLS" => "Girls Only"}
    @coed.keys
  end

  def university_types
    @univ_types ||= {"PVT" => "University", "SF" => "Self-Financed", "UNIV" => "Private"}
    @univ_types.keys
  end

  def universities
    @universities ||= { "JNTUK" =>	"JNTU Kakinada",
    "JNTUA" =>	"JNTU Anantapur",
    "KU" =>	"Kakatiya University",
    "JNTUH"	=> "JNTU Hyderabad",
    "AU"	=> "Andhra University",
    "ANU" =>	"Acharya Nagarjuna University",
    "OU" =>	"Osmania University",
    "JNTH"	=> "Jawaharlal Nehru Technological University",
    "ANGRAU" =>	"Acharya NG Ranga Agricultural University",
    "VETUNI"	=> "Sri Venkateswara Veterinary University",
    "SKU" =>	"Sri Krishnadevaraya University",
    "JNFAU" =>	"Jawaharlal Nehru Architecture and Fine Arts University",
    "SVU"	=> "Sri Venkateswara University",
    "PLMU"	=> "Palamur Univerity",
    "SPMU" => "Sri Padmavathi Mahila Viswavidyalayam",
    "SVHU" =>	"Satavahana University",
    "YGVU" =>	"Yogi Vemana University"
    }  
    @universities.keys
  end
  
  def courses
[["COMPUTER SCIENCE & ENGINEERING", "CSE"], ["INFORMATION TECHNOLOGY", "INF"], ["ELECTRONICS & COMMUNICATION ENGINEERING", "ECE"], ["ELECTRICAL & ELECTRONICS ENGINEERING", "EEE"], ["MECHANICAL ENGINEERING", "MEC"], ["CIVIL ENGINEERING", "CIV"], ["CHEMICAL ENGINEERING", "CHE"], ["PRODUCTION / INDUSTRIAL PRODUCTION ENGINEERING", "IPE"], ["ELECTRONICS & INSTRUMENTATION ENGINEERING", "EIE"], ["METALLURGICAL ENGINEERING", "MET"], ["PHARMACY(M.P.C.Stream)", "PHM"], ["BIO-MEDICAL ENGINEERING", "BME"], ["CIVIL ENVIRONMENTAL ENGINEERING", "CEE"], ["NAVAL ARCHITECTURE AND MARINE ENGINEERING", "NMA"], ["ELECTRONICS & TELEMATICS", "ETM"], ["MINING ENGINEERING", "MIN"], ["FOOD PROCESSING TECHNOLOGY", "FPT"], ["TEXTILE TECHNOLOGY", "TEX"], ["COMPUTER SCIENCE & SYSTEMS ENGINEERING", "CSS"], ["METALLURGY AND MATERIAL TECHNOLOGY", "MMT"], ["ELECTRONICS AND CONTROL SYSTEMS ENGINEERING", "ECS"], ["CHEMICAL PETRO ENGINEERING", "CPE"], ["ELECTRONICS & COMPUTER ENGINEERING", "ECM"], ["INSTRUMENTATION ENGINEERING/TECHNOLOGY", "IST"], ["MECHANICAL (MECHATRONICS)ENGINEERING", "MCT"], ["AUTOMOBILE ENGINEERING", "AUT"], ["APPLIED ELECTRONICS & INSTRUMENTATION ENGINEERING", "AEI"], ["AERONAUTICAL ENGINEERING", "ANE"], ["BIO-TECHNOLOGY", "BIO"], ["INSTRUMENTATION & CONTROL ENGINEERING", "ICE"], ["CHEMICAL(CERAMIC)TECHNOLOGY", "CER"], ["GEO-INFORMATICS", "GIN"], ["PLANNING", "PLG"], ["PHARMACY  (Bi.P.C stream)", "PHB"], ["DAIRYING", "DRG"], ["FOOD SCIENCE", "FDS"], ["AGRICULTURAL ENGINEERING", "AGR"], ["COMMERCIAL AGRICULTURAL & BUSINESS MGMT.", "CAB"], ["BIO-TECHNOLOGY (B.P C.STREAM)", "BTB"], ["DIGITAL TECHNIQUES FOR DESIGN AND PLANNING", "DTD"], ["FACILITIES AND SERVICES PLANNING", "FSP"], ["PHARM.D ( M P C STREAM)", "PHD"], ["PHARM.D ( B P C STREAM)", "PDB"], ["PETROLEUM TECHNOLOGY", "PET"], ["MINING MACHINERY ENGINEERING", "MME"]] 
  end

end