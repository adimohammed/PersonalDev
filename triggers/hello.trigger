trigger hello on Account (before insert, before update) {

 Account[] accs = Trigger.new;

   sfdctraining.addhellofield(accs);
}