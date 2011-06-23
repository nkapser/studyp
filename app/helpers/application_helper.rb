module ApplicationHelper

def regions
  @regions ||= {"AU" => "Andhra Region", "OU" => "Osmania Region", "SVU" => "Sri Venkateswara Region", "SW" => "State Wide"}
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

def univ_type
  @univ_types ||= {"PVT" => "University", "SF" => "Self-Financed", "UNIV" => "Private"}
  @univ_types.keys
end

def affl_names
  @affls ||= { "JNTUK" =>	"JNTU Kakinada",
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
  
  @ffls.keys
end