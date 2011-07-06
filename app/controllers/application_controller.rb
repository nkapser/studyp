class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :regions, :districts, :minority, :coed, :university_types, :universities
  
  def regions(key='')
    @regions ||= {"AU" => "Andhra Region", "OU" => "Osmania Region", "SVU" => "Sri Venkateswara Region"}
    key == '' ? @regions.keys : @regions.values_at(key).first
  end

  def districts(key='')
    @districts ||= { :vsp => "Vishakhapatnam",:hyd => "Hyderabad",:kdp => "Kadapa",:wgl => "Warangal",:pks => "Prakasam",:rr  => "Ranga Reddy",:eg  => "East Godavari",:ctr => "Chittoor",:khm => "Khammam",:skl => "Srikakulam",:nlg => "Nalgonda",:nlr => "Nellore",:wg  => "West Godavari",:gtr => "Guntur",:knl => "Kurnool",:kri => "Krishna",:atp => "Anantapur",:adb => "Adilabad",:vzm => "Vizia Nagaram",:krm => "Karim Nagar",:med => "Medak",:nzb => "Nizamabad",:mbn => "Mahaboob Nagar" }
    key == '' ? @districts.keys : @districts.values_at(key.downcase.to_sym).first    
  end

  def minority(key='')
    @minority ||= { :na => "Non-Minority", :chr => "Christian Minority", :mus => "Muslim Minority"}
    key == '' ? @minority.keys : @minority.values_at(key.downcase.to_sym).first    
  end

  def coed(key='')
    @coed ||= { "COED" => "Co-Education", "GIRLS" => "Girls Only"}
    key == '' ? @coed.keys : @coed.values_at(key).first
  end

  def university_types(key='')
    @univ_types ||= {"PVT" => "University", "SF" => "Self-Financed", "UNIV" => "Private"}
    key == '' ? @univ_types.keys : @univ_types.values_at(key).first        
  end

  def universities(key='')
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
    key == '' ? @universities.keys : @universities.values_at(key).first            
  end
  
end
