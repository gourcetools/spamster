my $lsSiz= (-s "../../../config/channels-list.txt");
        print ("=======================================","\n");  
        print ("	Checking channels... ","\n"); 	  
		
if($lsSiz eq "0"){
        print ("=======================================","\n");  
        print ("	NO CHANNELS... ","\n"); 
        print ("	TRYING DOWNLOAD AGAIN...","\n"); 	  
        print ("=======================================","\n"); 
		system("sh", "dl-channels.sh","hey");
}else
{
        print ("=======================================","\n");  
        print ("		Ok ! ","\n"); 
        print ("=======================================","\n");
}
