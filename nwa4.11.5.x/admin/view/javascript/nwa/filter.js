function filter (phrase, _id, cellNr,wholecontent){

    if (wholecontent == undefined){
        
        wholecontent = false;
        
    }
    
    
    var suche = phrase.value.toLowerCase().replace(/ /g, '');
    var name =  phrase.name;
    var table = document.getElementById(_id);
    var ele;
 
    
    // alert (suche);
    for (var r = 2; r < table.rows.length; r++){
        
        if (table.rows[r].cells[cellNr] != undefined){
            
            ele = table.rows[r].cells[cellNr].innerHTML.replace(/<[^>]+>/g,"");
            
            var content = ele.toLowerCase().replace(/ /g, '');
            
            var valid = false;
            
            if (suche == ""){
                
                valid = true;
                
            }else if (wholecontent){
 
                valid = (content == suche);
              
            }else{
                
                valid = (content.indexOf(suche)>=0);
            }
        
            if (valid){

              //  alert(table.rows[r].className + " -> " + table.rows[r].className.indexOf('filter_hidden'));
                    
                var filter_info = table.rows[r].className.split(' ');
                    
                var is_filtered_by_another = false;
                    
                for(var filter_class in filter_info){
                        
                    if (filter_info[filter_class].indexOf('filter_hidden')>=0)
                          
                        if (filter_info[filter_class] != 'filter_hidden'+cellNr){
                            
                            is_filtered_by_another = true;

                            break;
                            
                        }
                        
                            
                } 
                
               // var test =table.rows[r].className;
                
                
                table.rows[r].setAttribute("class", table.rows[r].className.replace('filter_show'+cellNr, ''));
                table.rows[r].setAttribute("class", table.rows[r].className.replace('filter_hidden'+cellNr, ''));
                
              //  alert('antes ->'+ test + 'depois->'+table.rows[r].className);
                
                if (table.rows[r].className != 'row_hidden' && !is_filtered_by_another){

                    table.rows[r].style.display = '';
 
                    if (suche != ""){
                        
                        table.rows[r].setAttribute("class", table.rows[r].className + ' ' + 'filter_show'+cellNr);
                        
                    }
                }

            } else{

                table.rows[r].style.display = 'none';
   
                if (suche != ""){
                      
                    table.rows[r].setAttribute("class",  table.rows[r].className + ' ' + 'filter_hidden'+cellNr);
                        
                }

            }
        
        }
    }
    
}

