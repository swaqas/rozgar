class AppGearController < ApplicationController

  
def read_csv
#begin
  filename = '/home/waqas/Documents/rozgar all data2.csv'
  file = File.new(filename, 'r')
  @c=""
#apid=1723;
  file.each_line("\n") do |row|

    columns=row.split(";")
#
    @c = @c + "                   " + columns[2].to_s.gsub('"', '')+" " +columns[3].to_s.gsub('"', '')
    @c = @c + "<br/>"
#if apid!=1723
#  a=Applicant.find_all_by_serial(columns[1].to_s.gsub('"', '')).first
#    if !a.nil?
#      a.street=columns[8].to_s.gsub('"', '');
#    a.save
#    end
#end
#    apid=apid+1
apid= applicant_insert columns[0].to_s.gsub('"', ''), columns[1].to_s.gsub('"', ''), columns[2].to_s.gsub('"', ''), columns[3].to_s.gsub('"', ''), columns[4].to_s.gsub('"', ''), columns[5].to_s.gsub('"', ''), columns[6].to_s.gsub('"', ''), columns[7].to_s.gsub('"', ''), columns[9].to_s.gsub('"', ''), columns[11].to_s.gsub('"', ''), columns[12].to_s.gsub('"', ''), columns[13].to_s.gsub('"', ''), columns[14].to_s.gsub('"', ''), columns[15].to_s.gsub('"', ''), columns[16].to_s.gsub('"', ''), columns[17].to_s.gsub('"', ''), columns[18].to_s.gsub('"', '')
#guarantor_insert apid, 'first_name', 'last_name', 'father_first_name', 'father_last_name', 'id_card_number', 'address', 'street', 'phone', 'mobile', 'education',   'relationship', 'opinions'
#
#apid= applicant_insert("RZ0784", "9/1/2011", "Muhammad", "Abid", "Abdul Saeed", "Khan Qadri", "42101-9358273-7", "4/3", "Liaqatabad", "", "0300-2085652", "Inter-Commerce", "6", "Fridge and AC shop", "Has a fridge and AC shop since the last 6 years. Wants a shop on rent. Requires at least Rs 20000", "Father, Mother", "0")
#
guarantor_insert apid, columns[29].to_s.gsub('"', ''), columns[30].to_s.gsub('"', ''), columns[31].to_s.gsub('"', ''), columns[32].to_s.gsub('"', ''), columns[33].to_s.gsub('"', ''), columns[34].to_s.gsub('"', ''), columns[35].to_s.gsub('"', ''), columns[38].to_s.gsub('"', ''), columns[39].to_s.gsub('"', ''), columns[40].to_s.gsub('"', ''),   columns[41].to_s.gsub('"', ''), columns[42].to_s.gsub('"', '')
guarantor_insert apid, columns[43].to_s.gsub('"', ''), columns[44].to_s.gsub('"', ''), columns[45].to_s.gsub('"', ''), columns[46].to_s.gsub('"', ''), columns[47].to_s.gsub('"', ''), columns[48].to_s.gsub('"', ''), columns[49].to_s.gsub('"', ''), columns[52].to_s.gsub('"', ''), columns[53].to_s.gsub('"', ''), columns[54].to_s.gsub('"', ''),   columns[55].to_s.gsub('"', ''), columns[56].to_s.gsub('"', '')

insert_expenditure(apid, columns[57].to_s.gsub('"', '')) if columns[57].to_s.gsub('"', '').length>0
insert_expenditure(apid, columns[58].to_s.gsub('"', '')) if columns[58].to_s.gsub('"', '').length>0
insert_expenditure(apid, columns[59].to_s.gsub('"', '')) if columns[59].to_s.gsub('"', '').length>0
insert_expenditure(apid, columns[60].to_s.gsub('"', '')) if columns[60].to_s.gsub('"', '').length>0


insert_child(apid, columns[19].to_s.gsub('"', '')) if columns[19].to_s.gsub('"', '').length>0
insert_child(apid, columns[20].to_s.gsub('"', '')) if columns[20].to_s.gsub('"', '').length>0
insert_child(apid, columns[21].to_s.gsub('"', '')) if columns[21].to_s.gsub('"', '').length>0
insert_child(apid, columns[22].to_s.gsub('"', '')) if columns[22].to_s.gsub('"', '').length>0
insert_child(apid, columns[23].to_s.gsub('"', '')) if columns[23].to_s.gsub('"', '').length>0
insert_child(apid, columns[24].to_s.gsub('"', '')) if columns[24].to_s.gsub('"', '').length>0
insert_child(apid, columns[25].to_s.gsub('"', '')) if columns[25].to_s.gsub('"', '').length>0
insert_child(apid, columns[26].to_s.gsub('"', '')) if columns[26].to_s.gsub('"', '').length>0
insert_child(apid, columns[27].to_s.gsub('"', '')) if columns[27].to_s.gsub('"', '').length>0
insert_child(apid, columns[28].to_s.gsub('"', '')) if columns[28].to_s.gsub('"', '').length>0


insert_income(apid, columns[61].to_s.gsub('"', '')) if columns[61].to_s.gsub('"', '').length>0
insert_income(apid, columns[62].to_s.gsub('"', '')) if columns[62].to_s.gsub('"', '').length>0
insert_income(apid, columns[63].to_s.gsub('"', '')) if columns[63].to_s.gsub('"', '').length>0
insert_income(apid, columns[64].to_s.gsub('"', '')) if columns[64].to_s.gsub('"', '').length>0

insert_payment(apid, columns[65].to_s.gsub('"', ''))
insert_payment(apid, columns[66].to_s.gsub('"', ''))

   end
#rescue Exception => exc
#  @c=exc
#end
end
def applicant_insert serial, entry_date, first_name, last_name, father_first_name, father_last_name, id_card_number, address, street, phone, mobile, education, experience, occupation, about, family, children
  a=Applicant.new
  a.serial=serial if !serial.nil?
  a.entry_date=entry_date if !entry_date.nil?
  a.first_name=first_name if !first_name.nil?
  a.last_name=last_name if !last_name.nil?
  a.father_first_name=father_first_name if !father_first_name.nil?
  a.father_last_name=father_last_name if !father_last_name.nil?
  a.id_card_number=id_card_number if !id_card_number.nil?
  a.address=address if !address.nil?
  a.street=street if !street.nil?
  a.city_id=1;
  a.country_id=1;
  a.phone=phone if !phone.nil?
  a.mobile=mobile if !mobile.nil?
  a.education=education if !education.nil?
  a.experience=experience if !experience.nil?
  a.occupation=occupation if !occupation.nil?
  a.about=about if !about.nil?
  a.family=family if !family.nil?
  a.number_of_children
  a.save
  return a.id 
end

def guarantor_insert apid, first_name, last_name, father_first_name, father_last_name, id_card_number, address, street, phone, mobile, education, relationship, opinion
  a=Guarantor.new
  a.applicant_id=apid
  a.first_name=first_name
  a.last_name=last_name
  a.father_first_name=father_first_name
  a.father_last_name=father_last_name
  a.id_card_number=id_card_number
  a.address=address
  a.street=street
  a.city_id=1
  a.country_id=1
  a.phone=phone
  a.mobile=mobile
  a.education=education
  a.relationship=relationship
  a.opinion=opinion
  a.save

end

def insert_expenditure apid, detail
  a=Expenditure.new
  a.detail=detail
  a.applicant_id=apid
  a.save
end

def insert_income apid, detail
  a=Income.new
  a.applicant_id=apid
  a.detail=detail
  a.save
end


def insert_child apid, detail
  a=Child.new
  a.child_name=""
  a.applicant_id=apid
  a.detail=detail
  a.save
end

def insert_payment apid, detail
  a=PaymentPlan.new
  a.applicant_id=apid
  a.detail=detail
  a.save
end


end
