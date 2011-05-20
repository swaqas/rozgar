module Site::TrackerHelper

 
 def donner_names
   don=Donner.all
   @d ||={:data => don.collect(&:first_name)}
 end
end
