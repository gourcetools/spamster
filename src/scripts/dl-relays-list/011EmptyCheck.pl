my $lsSiz= (-s "./config/RelaysList.txt");
        print ("=======================================","\n");  
        print ("CHECKING RELAYS ","\n"); 	  
        print ("=======================================","\n"); 
		
if($lsSiz eq "0"){
        print ("=======================================","\n");  
        print ("NO RELAYS... ","\n"); 
        print ("TRYING DOWNLOAD AGAIN...","\n"); 	  
        print ("=======================================","\n"); 
		system("sh", "010DownloadRelaysList.sh","hey");
}else
{
        print ("=======================================","\n");  
        print ("OK ","\n"); 
        print ("=======================================","\n");
}