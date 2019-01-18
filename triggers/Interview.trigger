trigger Interview on Account (before insert, before update) {
    for (Account a : Trigger.New){
        List<contact> c= [select Email from Contact where id =:a.id];
        for (Contact Con:c)
        if (a.Type== 'Prospect'){
            Con.Email='abc@gmail.com';
            update c;
        }
    }

}